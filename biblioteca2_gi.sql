create database biblioteca_giovanaC;
-- drop database biblioteca_giovanaC
use biblioteca_giovanaC;

create table Autores(
	id_autor int auto_increment primary key,
    nome_autor varchar(100),
    data_nascimento date
);

create table Categoria(
	id_categoria int auto_increment primary key,
	tipos_categorias varchar (100)
);

create table Livros(
	id_livro int auto_increment primary key,
	ISNB varchar (30),
    titulo varchar (100),
    descricao text
);

create table livros_autores(
	id_livro_autor int auto_increment primary key,
	id_livro int not null,
    id_autor int not null,
    foreign key (id_autor) references Autores (id_autor),
    foreign key (id_livro) references Livros (id_livro)
);

create table Usuarios(
	id_usuario int auto_increment primary key,
    nome_usuario varchar (60),
    email_usuario varchar (100),
    data_registro date
);

create table Emprestimo(
	id_emprestimo int auto_increment primary key,
    data_inicio date,
    data_devolucao date,
    id_usuario int not null,
    id_livro int not null,
    foreign key (id_livro) references Livros (id_livro),
    foreign key (id_usuario) references Usuarios (id_usuario)
);

create table Associacao(
	id_associacao int auto_increment primary key,
    tipos_associacao varchar(15)
);

create table categorias_livros(
	id_categoria_livro int auto_increment primary key,
    id_livro int not null,
    id_categoria int not null,
    foreign key (id_categoria) references Categoria (id_categoria),
    foreign key (id_livro) references Livros ( id_livro)
);

insert into Livros (ISNB, titulo, descricao)
values
	('978-3-16-148410-0', 'O senhor dos Anéis', 'Uma jornada épica em um mundo fantástico onde heróis e vilões batalham pelo destino da Terra Média.'),
    ('978-0-7432-7356-5', 'O Código Da Vinci', 'Um thriller que mistura arte, religião e mistérios históricos, envolvendo uma trama de conspirações e enigmas.'),
    ('978-0-452-28423-45', '1984', 'A distopia de um regime totalitário onde o governo controla todos os aspectos da vida dos cidadãos, inclusive os pensamentos.'),
    ('978-0-395-19395-8', 'Harry Potter e a Pedra Filosofal', 'O jovem Harry Potter descobre que é um bruxo e entra na Escola de Magia e Bruxaria de Hogwarts, iniciando uma série de aventuras.'),
    ('978-1-4028-9462-6', 'A Menina que Roubava Livros', 'A história de uma jovem garota na Alemanha durante a Segunda Guerra Mundial, que encontra consolo nos livros enquanto o mundo ao seu redor desmorona.'),
    ('978-0-553-21311-7', 'Cem Anos de Solidão', 'A história da família Buendía, ao longo de várias gerações, em um cenário mágico-realista repleto de amor, solidão e mistério.');
    
insert into Categoria (tipos_categorias)
values
	('Romance'),
    ('Ação'),
    ('Comédia'),
    ('ficção'),
    ('Suspense'),
    ('Terror');
    
insert into Autores (nome_autor, data_nascimento)
values
	('J.R.R. Tolkien', '1892-01-03'),
    ('Dan Brown', '1964-06-22'),
    ('George Orwell', '1903-06-25'),
    ('J.K. Rowling', '1965-07-31'),
    ('Markus Zusak', '1975-06-23'),
    ('Gabriel García Márquez', '1927-03-06');
    
insert into Usuarios (nome_usuario, email_usuario, data_registro)
values
	('Giovana', 'giovana.gi@gmail.com', '2013-03-18'),
    ('Nic', 'nic.vilela@gmail.com', '2013-03-18'),
    ('Ana', 'ana.clarinha@gmail.com', '2013-03-18'),
    ('Diva', 'luana.diva@gmail.com', '2013-03-18'),
    ('Franfran', 'franfran.yas@gmail.com', '2013-03-18'),
    ('Ju', 'juliana.coelho@gmail.com', '2013-03-18');
    
insert into Emprestimo (data_inicio, data_devolucao, id_usuario, id_livro)
values
	('2025-02-12', '2025-02-13', 1, 4),
    ('2014-03-15', '2025-04-14', 2, 6),
    ('2025-03-10', '2025-07-15', 3, 2),
    ('2022-01-12', '2022-01-16', 4, 1),
    ('2022-04-22', '2022-05-16', 5, 3),
    ('2023-01-12', '2023-01-16', 6, 5);
    
insert into Associacao (tipos_associacao)
values
	('Premium'),
    ('basic'),
    ('medium');
    
select * from Emprestimo;
select * from Livros;
select * from Categoria;
select * from Autores;
select * from Usuarios;
select * from Associacao;




    