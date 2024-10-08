drop database empresa2;
create database empresa2;
use empresa2;

create table projetos (
    id_projeto int auto_increment primary key not null,
    nome varchar(100) not null,
    localizacao varchar (100) not null
);

create table funcionarios(
    id_funcionarios int auto_increment primary key not null,
    salario int not null,
    endereço varchar(100) not null,
    cpf varchar (100) not null
);

create table departamento (
    id_departamento int auto_increment primary key not null,
    nome varchar (100) not null,
    data_inicio date not null,
    id_funcionarios int not null,
    id_projeto int not null,
    foreign key (id_funcionarios) references funcionarios (id_funcionarios),
    foreign key (id_projeto) references projetos (id_projeto)
);

INSERT INTO projetos (nome, localizacao) VALUES
('Construção do Parque', 'Centro da Cidade'),
('Reforma da Escola', 'Zona Sul'),
('Construção do Hospital', 'Zona Norte');

INSERT INTO funcionarios (salario, endereço, cpf) VALUES
(3000, 'Rua A, 123', '123.456.789-00'),
(4500, 'Avenida B, 456', '234.567.890-11'),
(5000, 'Rua C, 789', '345.678.901-22');

INSERT INTO departamento (nome, data_inicio, id_funcionarios, id_projeto) VALUES
('Administração', '2023-01-01', 1, 1),
('Engenharia', '2023-02-15', 2, 2),
('Financeiro', '2023-03-10', 3, 3);
