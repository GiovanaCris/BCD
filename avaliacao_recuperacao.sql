-- Criação do banco
DROP DATABASE IF EXISTS BibliotecaOnline;
CREATE DATABASE IF NOT EXISTS BibliotecaOnline;
USE BibliotecaOnline;

-- Tabela de autores
CREATE TABLE autor (
 id_autor INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(100)
);

-- Tabela de livros
CREATE TABLE livro (
 id_livro INT PRIMARY KEY AUTO_INCREMENT,
 titulo VARCHAR(100),
 ano_publicacao INT,
 id_autor INT,
 FOREIGN KEY (id_autor) REFERENCES autor(id_autor)
);

-- Tabela de leitores
CREATE TABLE leitor (
 id_leitor INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(100)
);

-- Tabela de emprestimos
CREATE TABLE emprestimo (
 id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
 id_livro INT,
 id_leitor INT,
 data_emprestimo DATE,
 FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
 FOREIGN KEY (id_leitor) REFERENCES leitor(id_leitor)
);

-- Inserções em autor
INSERT INTO autor (nome) VALUES
('Machado de Assis'),
('Clarice Lispector'),
('Monteiro Lobato'),
('Cecília Meireles');

-- Inserções em livro
INSERT INTO livro (titulo, ano_publicacao, id_autor) VALUES
('Dom Casmurro', 1899, 1),
('A Hora da Estrela', 1977, 2),
('O Sítio do Picapau Amarelo', 1939, 3),
('Romance de uma menina', 2018, 2),
('Ou isto ou aquilo', 1964, 4),
('Livro Pós-Moderno', 2021, 1);

-- Inserções em leitor
INSERT INTO leitor (nome) VALUES
('Ana Paula'),
('João Pedro'),
('Mariana Silva'),
('Carlos Andrade');

-- Inserções em emprestimo
INSERT INTO emprestimo (id_livro, id_leitor, data_emprestimo) VALUES
(1, 1, '2024-01-12'),
(2, 2, '2023-11-10'),
(3, 3, '2022-05-07'),
(4, 1, '2024-03-02'),
(5, 4, '2023-07-19'),
(6, 2, '2024-05-25'),
(2, 1, '2024-06-01'),
(4, 3, '2024-06-02');

-- Exercício 1 Liste o título dos livros e o nome dos respectivos autores.
SELECT titulo AS titulo_livro, -- Query
	(SELECT nome -- Subquery
    FROM autor
    WHERE autor.id_autor = livro.id_autor) AS nome_autor
FROM livro;

-- Exercício 2 Liste os nomes dos leitores e os títulos dos livros que eles emprestaram.
SELECT 
	(SELECT nome
    FROM leitor
    WHERE leitor.id_leitor = emprestimo.id_leitor) AS nome_leitor,
    
    (SELECT titulo
    FROM livro
    WHERE livro.id_livro = emprestimo.id_livro) AS titulo_livro_emprestado
FROM emprestimo;

-- Com INNER JOIN para otimizar e diminuir a quantidade de linhas
SELECT leitor.nome, livro.titulo
FROM emprestimo
INNER JOIN leitor ON  emprestimo.id_leitor = leitor.id_leitor
INNER JOIN livro ON emprestimo.id_livro = livro.id_livro;

-- Exercício 3 Mostre o nome dos leitores, o nome dos autores e os títulos dos livros que foram emprestados a partir de 2024, organizando essas informações cruzando todas as tabelas necessárias
SELECT
	(SELECT nome
    FROM leitor
	WHERE leitor.id_leitor = emprestimo.id_leitor) AS nome_leitor,
    
    (SELECT titulo
    FROM livro
    WHERE livro.id_livro = emprestimo.id_livro) AS livros_emprestados,
    
	(SELECT nome
	FROM autor
	WHERE autor.id_autor = 
		(SELECT id_autor
        FROM livro
        WHERE livro.id_livro = emprestimo.id_livro)
	)AS nome_autor
FROM emprestimo 
WHERE data_emprestimo > '2024-01-01';