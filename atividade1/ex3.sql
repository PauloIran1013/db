drop database senac;

create table senac;

use senac;

create table professores(
    id_professor int auto_increment primary key not null,
    nome varchar (100) not null,
    telefone int not null
);

create table aluno(
    id_aluno int auto_increment primary key not null,
    nome varchar(100) not null,
    endereco varchar (100) not null, 
    telefone int not null
);

create table cursos(
    id_curso int auto_increment primary key not null,
    nome varchar (100) not null,
    preco int not null,
    id_aluno int not null,
    id_professor int not null,
    FOREIGN KEY (id_aluno) references aluno (id_aluno),
    foreign key (id_professor) references professores (id_professor)
);


INSERT INTO professores (nome, telefone) VALUES
('Carlos Almeida', 123456789),
('Mariana Souza', 987654321),
('Roberto Pereira', 456789123),
('Ana Costa', 321654987),
('Fernando Lima', 159753468);

INSERT INTO aluno (nome, endereco, telefone) VALUES
('João Silva', 'Rua A, 123', 123456789),
('Juliana Ferreira', 'Av. B, 456', 987654321),
('Ricardo Santos', 'Praça C, 789', 456789123),
('Fernanda Lima', 'Rua D, 101', 321654987),
('Mariana Oliveira', 'Av. E, 202', 159753468);

INSERT INTO cursos (nome, preco, id_aluno, id_professor) VALUES
('Matemática Avançada', 500, 1, 1),
('Física Moderna', 600, 2, 2),
('Programação em Python', 700, 3, 3),
('Química Orgânica', 550, 4, 4),
('História da Arte', 450, 5, 5);

