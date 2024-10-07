drop database biblioteca2;

create database biblioteca2;

use biblioteca2;

create table autores(
    id_autor int  auto_increment primary key not null,
    nome varchar (100) not null
);

create table livros (
    id_livro int auto_increment primary key not null,
    isbn int not null,
    titulo varchar (100) not null,
    p_chave varchar(100) not null,
    local_edicao varchar(100) not null,
    editora varchar(100) not null,
    id_autor int not null,
    foreign key (id_autor) references autores (id_autor)
);

create table exemplares(
    id_exemplar int auto_increment primary key not null,
    n_exemplar int not null,
    id_livro int not null,
    foreign key (id_livro) references livros (id_livro)
);

create table assosiados (
    id_socio int auto_increment primary key not null,
    nome varchar (100) not null,
    id_exemplar int not null,
    foreign key (id_exemplar) references exemplares (id_exemplar)
);

create table emprestimo (
    id_emprestimo int auto_increment primary KEY not null,
    data_e date not null,
    hora time not null,
    id_livro int not null,
    id_socio int not null,
    foreign key (id_livro) references livros (id_livro),
    foreign key (id_socio) references assosiados (id_socio)
);

INSERT INTO autores (nome) VALUES
('J.K. Rowling'),
('George R.R. Martin'),
('J.R.R. Tolkien'),
('Agatha Christie'),
('Isaac Asimov');


INSERT INTO livros (isbn, titulo, p_chave, local_edicao, editora, id_autor) VALUES
(9780747, 'Harry Potter e a Pedra Filosofal', 'Ficção', 'Londres', 'Rocco', 1),
(9780553, 'A Guerra dos Tronos', 'Ficção', 'Nova Iorque', 'Leya', 2),
(9780618, 'O Senhor dos Anéis: A Sociedade do Anel', 'Ficção', 'Londres', 'Martins Fontes', 3),
(9780062, 'Assassinato no Expresso do Oriente', 'Mistério', 'Londres', 'Editora Nova Fronteira', 4),
(9780553, 'Fundação', 'Ciência Ficção', 'Nova Iorque', 'Editora Aleph', 5);


INSERT INTO exemplares (n_exemplar, id_livro) VALUES
(1, 1),
(2, 1),
(1, 2),
(3, 3),
(1, 4),
(2, 5);


INSERT INTO assosiados (nome, id_exemplar) VALUES
('Carlos Almeida', 1),
('Juliana Ferreira', 2),
('Ricardo Santos', 3),
('Fernanda Lima', 4),
('Mariana Oliveira', 5);


INSERT INTO emprestimo (data_e, hora, id_livro, id_socio) VALUES
('2024-10-01', '10:00:00', 1, 1),
('2024-10-02', '14:30:00', 2, 2),
('2024-10-03', '09:15:00', 3, 3),
('2024-10-04', '11:45:00', 4, 4),
('2024-10-05', '08:30:00', 5, 5);
