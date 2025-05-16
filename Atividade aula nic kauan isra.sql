DROP DATABASE IF EXISTS atvsubconsulta;
CREATE DATABASE atvsubconsulta;
USE atvsubconsulta;

-- drop database subquery_aula;
-- Criar tabelas
CREATE TABLE clientes (
 id INT PRIMARY KEY,
 nome VARCHAR(50)
);
CREATE TABLE pedidos (
 id INT PRIMARY KEY,
 cliente_id INT,
 valor DECIMAL(10,2)
);
-- Inserir dados
INSERT INTO clientes (id, nome) VALUES (1, 'Ana'), (2, 'Bruno'), (3, 'Clara'), (4, 'Daniel'), 
(5, 'Kauan');
INSERT INTO pedidos (id, cliente_id, valor) VALUES 
 (1, 1, 1200.00), (2, 1, 300.00), (3, 2, 600.00), (4, 3, 50.00), (5, 2, 800.00), (6, 5, 99.00);

-- Exercício 1
SELECT nome
FROM clientes
WHERE id = (SELECT cliente_id FROM pedidos WHERE valor = (SELECT MAX(valor) FROM pedidos));

-- Exercício 2
SELECT nome
FROM clientes
WHERE id IN (SELECT cliente_id FROM pedidos WHERE valor < 100.00);

-- Exercício 3
SELECT nome
FROM clientes c
WHERE EXISTS (
	SELECT 1
    FROM pedidos p
    WHERE p.cliente_id = c.id AND p.valor > 1000
);