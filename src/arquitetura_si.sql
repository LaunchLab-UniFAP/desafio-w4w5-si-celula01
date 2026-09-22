-- LaunchLab UniFAP - Desenvolvimento SI
-- Foco: DDL (Definição de Estrutura) e DCL (Controle de Acesso)

-- 1. Definição das Entidades e Integridade Referencial
CREATE TABLE municipios (
    id_municipio INT PRIMARY KEY,
    nome_municipio VARCHAR(100) NOT NULL,
    populacao INT NOT NULL
);

CREATE TABLE emendas_saude (
    id_emenda INT PRIMARY KEY,
    id_municipio_destino INT,
    valor_emenda DECIMAL(12,2) NOT NULL, 
    data_repasse DATE NOT NULL,
    status_auditoria VARCHAR(30) DEFAULT 'Pendente',
    FOREIGN KEY (id_municipio_destino) REFERENCES municipios(id_municipio)
);

-- 2. Implementação de Segurança de Dados e Compliance Legal (DCL)

