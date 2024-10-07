drop database biblioteca;

create database biblioteca;

use biblioteca;

create table autor(
    id_autor int auto_increment primary key ,
    nome_autor varchar (100) not null,
    cpf varchar(100) not null,
    nacionalidade varchar (100) not null
);

create table categoria(
    id_categoria int auto_increment primary key,
    nome_categoria varchar (100) not null,
    descricao text not null
);  

    create table livro (
        id_livro int auto_increment primary key,
        titulo varchar(100) not null,
        ano date not null,
        editora varchar(100) not null,
        id_autor int not null,
        id_categoria int not  null,
        foreign key (id_autor) references autor (id_autor),
        foreign key (id_categoria) references categoria(id_categoria)
    );



INSERT INTO autor (nome_autor, cpf, nacionalidade) VALUES
('J.K. Rowling', "12345678901", 'Britânica'),
('George R.R. Martin', "10987654321", 'Americana'),
('J.R.R. Tolkien', "12345678900", 'Britânica'),
('Agatha Christie', "98765432100", 'Britânica'),
('Isaac Asimov', "19283746500", 'Americana');


INSERT INTO categoria (nome_categoria, descricao) VALUES
('Ficção', 'Romances e contos de ficção literária'),
('Fantasía', 'Obras que incluem elementos fantásticos'),
('Mistério', 'Livros que envolvem mistérios e crimes'),
('Ciência', 'Livros que abordam temas científicos e tecnológicos'),
('História', 'Livros que relatam eventos históricos');


INSERT INTO livro (titulo, ano, editora, id_autor, id_categoria) VALUES
('Harry Potter e a Pedra Filosofal', '1997-06-26', 'Rocco', 1, 1),
('A Guerra dos Tronos', '1996-08-06', 'Leya', 2, 2),
('O Senhor dos Anéis: A Sociedade do Anel', '1954-07-29', 'Martins Fontes', 3, 2),
('Assassinato no Expresso do Oriente', '1934-01-01', 'Editora Nova Fronteira', 4, 3),
('Fundação', '1951-06-01', 'Editora Aleph', 5, 4);
