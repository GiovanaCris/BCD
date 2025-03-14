create database biblioteca_giovanaC;
-- drop database biblioteca_giovanaC
use biblioteca_giovanaC;

create table Categoria(
	id_categoria int auto_increment primary key,
	tipos_categorias varchar (100)
);

create table Livros(
	id_livro int auto_increment primary key,
	ISNB integer,
    titulo varchar (100),
    descricao text
);

create table categorias_livros(
	id_categoria_livro int auto_increment primary key,
    id_livro int not null,
    id_categoria int not null,
    foreign key (id_categoria) references Categoria (id_categoria),
    foreign key (id_livro) references Livros ( id_livro)
);

create table Autores(
	id_autor int auto_increment primary key,
    nome_autor varchar(100),
    data_nascimento date
);

create table livros_autores(
	id_livro_autor int auto_increment primary key,
	id_livros int not null,
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
    foreign key (id_livro) references Livro (id_livro),
    foreign key (id_usuario) references Usuarios (id_usuario)
);

create table Associacao(
	id_associacao int auto_increment primary key,
    tipos_associacao varchar(15),
    foreign key (id_usuario) references Usuarios (id_usuario)
);

insert into <Livros> (<ISNB>, <titulo>, <descricao>)
values
	('1342245', 'É assim que acaba', 'hakhkhksbajdbaj'),
    ('134424245', 'É assim que acaba', 'hakhkhksbajdbaj'),
    ('134243545', 'É assim que acaba', 'hakhkhksbajdbaj');
    
insert into <>

select * from biblioteca_giovanaC



    