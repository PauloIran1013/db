drop database construtora;
create database construtora;
use construtora;

create table chefes(
    id_chefe int auto_increment primary key not null,
    nome_chefe varchar(100) not null
);


create table departamentos(
    id_departamento int auto_increment primary key not null,
    nome_departamento varchar (100) not null,
    id_chefe int not null,
    foreign key (id_chefe) references chefes (id_chefe)
);

create table empregados (
    id_empregado int primary key auto_increment not null,
    nome_empregado varchar(100) not null,
    data_nasc date not null,
    id_departamento int not null,
    foreign key (id_departamento) references departamentos (id_departamento)
);

create table projetos (
    id_projeto int auto_increment primary key not null,
    nome varchar(100) not null,
    id_departamento int not null,
    id_empregado int not null,
    foreign key (id_departamento) references departamentos (id_departamento),
    foreign key (id_empregado) references empregados (id_empregado)
);

INSERT INTO chefes (nome_chefe) VALUES
('Roberto Almeida'),
('Sofia Costa'),
('Fernando Oliveira');

INSERT INTO departamentos (nome_departamento, id_chefe) VALUES
('Administração', 1),
('Engenharia', 2),
('Financeiro', 3);

INSERT INTO empregados (nome_empregado, data_nasc, id_departamento) VALUES
('Lucas Pereira', '1985-03-15', 1),
('Julia Santos', '1990-07-20', 2),
('Marcos Silva', '1982-11-05', 3),
('Fernanda Lima', '1988-02-10', 2);

INSERT INTO projetos (nome, id_departamento, id_empregado) VALUES
('Construção do Prédio A', 2, 2),
('Reforma do Escritório', 1, 1),
('Gestão de Recursos', 3, 3),
('Desenvolvimento do Projeto B', 2, 4);
