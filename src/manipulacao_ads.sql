-- LaunchLab UniFAP - Desenvolvimento ADS
-- Foco: DML (Manipulação) e DQL (Consulta/Extração Analítica)

-- 1. Carga de Dados para Testes de Consistência (DML)
INSERT INTO municipios (id_municipio, nome_municipio, populacao) VALUES 
(1, 'Aba', 35000),
(2, 'Juazeiro', 270000);

INSERT INTO emendas_saude (id_emenda, id_municipio_destino, valor_emenda, data_repasse, status_auditoria) VALUES 
(101, 1, 500000.00, '2026-09-15', 'Aprovado'),
(102, 2, 1250000.50, '2026-09-16', 'Pendente');

-- 2. Query de Cruzamento Analítico para Auditoria Fiscal (DQL)

