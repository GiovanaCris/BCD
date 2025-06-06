-- Criar banco de dados
DROP DATABASE IF EXISTS empresa;
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

-- Criar tabela clientes
CREATE TABLE clientes (
 id INT AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(100),
 email VARCHAR(100),
 cidade VARCHAR(100),
 estado CHAR(2)
);
-- Inserir dados fictícios
INSERT INTO clientes (nome, email, cidade, estado) VALUES
('Ana Silva', 'ana.silva@email.com', 'Campinas', 'SP'),
('Bruno Souza', 'bruno.souza@email.com', 'Belo Horizonte', 'MG'),
('Carla Mendes', 'carla.mendes@email.com', 'São Paulo', 'SP'),
('Diego Rocha', 'diego.rocha@email.com', 'Rio de Janeiro', 'RJ'),
('Eduarda Lima', 'eduarda.lima@email.com', 'Sorocaba', 'SP'),
('Fernando Alves', 'fernando.alves@email.com', 'Curitiba', 'PR');

-- Exercício 1 Crie a VIEW clientes_sp com clientes do estado de SP.
CREATE VIEW clientes_sp AS 
SELECT nome, estado
FROM clientes
WHERE estado = 'SP';

-- Exercício 2  Consulte a VIEW clientes_sp usando SELECT *.
SELECT * FROM clientes_sp;

-- Exercício 3 Crie a VIEW clientes_upper com nomes em letras maiúsculas (UPPER).
CREATE VIEW clientes_upper AS
SELECT UPPER(nome) AS nome_maiusculo
FROM clientes;

SELECT * FROM clientes_upper;

-- Ecercício 4 .Tente dar UPDATE na VIEW clientes_upper. O que acontece?
-- UPDATE clientes_upper
-- SET nome_maiusculo = nome_maiusculo
-- WHERE nome_maiusculo = 'gigi';

-- Exercício 5 Crie a VIEW clientes_editaveis com id, nome e cidade. Altere a cidade de um cliente pela VIEW.
CREATE VIEW clientes_editaveis AS
SELECT id, nome, cidade
FROM clientes;

UPDATE clientes_editaveis
SET cidade = 'Sumaré'
WHERE id = 1;

SELECT * FROM clientes_editaveis;

-- Exercício 6  Liste as VIEWs criadas e veja o SQL da clientes_editaveis usando SHOW FULL TABLES e SHOW CREATE VIEW.
SHOW CREATE VIEW clientes_editaveis;
SHOW FULL TABLES WHERE Table_type = 'VIEW';

