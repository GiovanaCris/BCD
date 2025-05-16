DROP DATABASE IF EXISTS AtvGi;
CREATE DATABASE AtvGi;
USE AtvGi;

CREATE TABLE Cadastros(
	id_cadastro INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(50),
    val_produto DOUBLE,
    desconto_produto FLOAT
);

CREATE TABLE Usuarios(
	id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(80),
    idade INT,
    email VARCHAR(100)
);

CREATE TABLE Pedidos(
	id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_cadastro INT,
    data_pedido DATETIME,
    quantidade_pediu INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_cadastro) REFERENCES Cadastros(id_cadastro)
);

INSERT INTO Usuarios (nome_usuario, idade, email) VALUES
('Luana Cristina Dias', 28, 'lucrisdias@email.com'),
('Giovana Clara Mota', 35, 'giclaramota@email.com');

INSERT INTO Cadastros (nome_produto, val_produto, desconto_produto) VALUES
('Bolsa', 79.90, 10.0),
('Mochila', 35.50, 5.0);

INSERT INTO Pedidos (id_usuario, id_cadastro, data_pedido, quantidade_pediu)
VALUES
(
    1,  -- Luana Cristina Dias
    1,  -- Bolsa
    NOW(),  -- Data e hora atuais
    2       -- Comprou 2 unidades
),
(
    2,  -- Giovana Clara Mota
    2,  -- Mochila
    NOW(),
    3
);

SELECT * FROM Cadastros;
SELECT * FROM Usuarios;
SELECT 
    p.id_pedido,
    CONCAT(UCASE(u.nome_usuario), ' comprou ') AS cliente,
    c.nome_produto,
    p.quantidade_pediu,
    TRUNCATE(c.val_produto, 2) AS valor_unitario,
    DATE_FORMAT(NOW(), '%d/%m/%Y %H:%i:%s') AS data_formatada
FROM Pedidos p
JOIN Usuarios u ON p.id_usuario = u.id_usuario
JOIN Cadastros c ON p.id_cadastro = c.id_cadastro;