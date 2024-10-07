drop database cursos;

create database cursos;

use cursos;

create table professores(
    id_professor int auto_increment primary key not null,
    nome varchar (100) not null,
    salario int not null,
    titulacao varchar (100) not null,
    data_nasc date not null
);

create table notas (
    id_nota int auto_increment primary key not null,
    media int not null
);

create table aluno (
    id_aluno int auto_increment primary key not null,
    nome varchar(100) not null,
    endereco varchar (100) not null,
    id_nota int not null,
    foreign key (id_nota) references notas (id_nota)
);

create table cursos(
    id_curso int auto_increment primary key not null,
    nome varchar (100) not null,
    id_aluno int not null,
    id_professor int not null,
    foreign key (id_aluno) references aluno (id_aluno),
    foreign key (id_professor) references professores (id_professor)
);

INSERT INTO professores (nome, salario, titulacao, data_nasc) VALUES
('Carlos Almeida', 5000, 'Mestre', '1980-05-15'),
('Maria Souza', 7000, 'Doutora', '1975-09-25'),
('Roberto Santos', 6000, 'Especialista', '1988-12-30'),
('Fernanda Lima', 5500, 'Mestre', '1990-03-20'),
('Juliana Ferreira', 8000, 'Doutora', '1982-07-10');

INSERT INTO notas (media) VALUES
(85),
(90),
(75),
(88),
(92);

INSERT INTO aluno (nome, endereco, id_nota) VALUES
('João Silva', 'Rua A, 123', 1),
('Juliana Oliveira', 'Av. B, 456', 2),
('Ricardo Santos', 'Praça C, 789', 3),
('Fernanda Lima', 'Rua D, 101', 4),
('Mariana Costa', 'Av. E, 202', 5);

INSERT INTO cursos (nome, id_aluno, id_professor) VALUES
('Matemática Avançada', 1, 1),
('Física Moderna', 2, 2),
('Programação em Python', 3, 3),
('Química Orgânica', 4, 4),
('História da Arte', 5, 5);
