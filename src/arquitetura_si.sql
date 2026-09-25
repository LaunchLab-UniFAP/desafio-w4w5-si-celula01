-- LaunchLab UniFAP - Desenvolvimento SI
-- Foco: DDL (Definição de Estrutura) e DCL (Controle de Acesso)

-- 1. Definição das Entidades e Integridade Referencial

CREATE EXTENSION IF NOT EXISTS moddatetime;

CREATE OR REPLACE FUNCTION fn_impedir_delete_fisico()
RETURNS TRIGGER AS $$
BEGIN
    RAISE EXCEPTION 'Não é permitida a exclusão física. Utilize apenas Soft Delete atualizando a coluna data_exclusao.';
END;
$$ LANGUAGE plpgsql;

CREATE TABLE municipio (
    id UUID PRIMARY KEY DEFAULT uuidv7(),
    nome VARCHAR(100) NOT NULL,
    populacao INT NOT NULL,
    data_criacao TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    data_atualizacao TIMESTAMPTZ,
    data_exclusao TIMESTAMPTZ
);

DROP TRIGGER IF EXISTS update_municipio_modtime ON municipio;
CREATE TRIGGER update_municipio_modtime
    BEFORE UPDATE ON municipio
    FOR EACH ROW
    EXECUTE FUNCTION moddatetime(data_atualizacao);

CREATE TABLE municipio_log (
    id UUID PRIMARY KEY DEFAULT uuidv7(),
    municipio_id UUID NOT NULL,
    acao_executada VARCHAR(50) NOT NULL,
    data_criacao TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    usuario_auditor VARCHAR(100) NOT NULL
);

CREATE OR REPLACE FUNCTION fn_log_municipio()
RETURNS TRIGGER AS $$
DECLARE
    acao VARCHAR(50);
BEGIN
    IF (TG_OP = 'UPDATE' AND OLD.data_exclusao IS NULL AND NEW.data_exclusao IS NOT NULL) THEN
        acao := 'SOFT_DELETE';
    ELSE
        acao := TG_OP;
    END IF;

    INSERT INTO municipio_log (municipio_id, acao_executada, usuario_auditor)
    VALUES (
        NEW.id, 
        acao, 
        current_user
    );
    
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_log_municipio ON municipio;
CREATE TRIGGER trg_log_municipio
    AFTER INSERT OR UPDATE ON municipio
    FOR EACH ROW EXECUTE FUNCTION fn_log_municipio();

DROP TRIGGER IF EXISTS trg_bloquear_delete_municipio ON municipio;
CREATE TRIGGER trg_bloquear_delete_municipio
    BEFORE DELETE ON municipio
    FOR EACH ROW EXECUTE FUNCTION fn_impedir_delete_fisico();


CREATE TYPE status_auditoria AS ENUM (
    'PENDENTE',          
    'PLANO_DE_ACAO',     
    'EM_ANDAMENTO',      
    'AGUARDANDO_REVISAO', 
    'APROVADO',          
    'REPROVADO'         
);

CREATE TYPE area_emenda AS ENUM (
    'SAUDE',
    'ASSISTENCIA_SOCIAL',
    'EDUCACAO',
    'INFRAESTRUTURA',
    'OUTROS'
);

CREATE TABLE emenda (
    id UUID PRIMARY KEY DEFAULT uuidv7(),
    municipio_destino_id UUID NOT NULL,
    valor DECIMAL(12,2) NOT NULL, 
    area area_emenda NOT NULL,
    data_repasse TIMESTAMPTZ NOT NULL,
    status_auditoria status_auditoria NOT NULL DEFAULT 'PENDENTE'::status_auditoria,
    data_criacao TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    data_atualizacao TIMESTAMPTZ,
    data_exclusao TIMESTAMPTZ,
    FOREIGN KEY (municipio_destino_id) REFERENCES municipio(id),
);

DROP TRIGGER IF EXISTS update_emenda_modtime ON emenda;
CREATE TRIGGER update_emenda_modtime
    BEFORE UPDATE ON emenda
    FOR EACH ROW
    EXECUTE FUNCTION moddatetime(data_atualizacao);


CREATE TABLE emenda_log (
    id UUID PRIMARY KEY DEFAULT uuidv7(),
    emenda_id UUID NOT NULL,
    acao_executada VARCHAR(50) NOT NULL,
    data_criacao TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    usuario_auditor VARCHAR(100) NOT NULL
);

CREATE OR REPLACE FUNCTION fn_log_emenda()
RETURNS TRIGGER AS $$
DECLARE
    acao VARCHAR(50);
BEGIN
    IF (TG_OP = 'UPDATE' AND OLD.data_exclusao IS NULL AND NEW.data_exclusao IS NOT NULL) THEN
        acao := 'SOFT_DELETE';
    ELSE
        acao := TG_OP;
    END IF;

    INSERT INTO emenda_log (emenda_id, acao_executada, usuario_auditor)
    VALUES (
        NEW.id, 
        acao, 
        current_user
    );
    
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_log_emenda ON emenda;
CREATE TRIGGER trg_log_emenda
    AFTER INSERT OR UPDATE ON emenda
    FOR EACH ROW EXECUTE FUNCTION fn_log_emenda();

DROP TRIGGER IF EXISTS trg_bloquear_delete_emenda ON emenda;
CREATE TRIGGER trg_bloquear_delete_emenda
    BEFORE DELETE ON emenda
    FOR EACH ROW EXECUTE FUNCTION fn_impedir_delete_fisico()

-- 2. Implementação de Segurança de Dados e Compliance Legal (DCL)
CREATE ROLE auditor_fiscal WITH NOLOGIN;

GRANT USAGE ON SCHEMA public TO auditor_fiscal;

GRANT SELECT, INSERT, UPDATE ON municipio TO auditor_fiscal;

GRANT SELECT, INSERT ON municipio_log TO auditor_fiscal;

GRANT SELECT, INSERT, UPDATE ON emenda TO auditor_fiscal;

GRANT SELECT, INSERT ON emenda_log TO auditor_fiscal;

GRANT USAGE ON TYPE status_auditoria TO auditor_fiscal;

GRANT USAGE ON TYPE area_emenda TO auditor_fiscal;
