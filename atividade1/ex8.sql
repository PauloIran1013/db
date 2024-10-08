drop database empresa;
create database empresa;
use empresa;

create table diretoria(
    id_diretoria int auto_increment primary key not null,
    nome_diretoria varchar(100)
);

create table departamento (
    id_depar int auto_increment primary key not null,
    funcao varchar(100)  not null,
    nome_departamento varchar (100) not null,
    id_diretoria int not null,
    foreign key (id_diretoria) references diretoria (id_diretoria)
);

create table dependentes(
    id_dependente int auto_increment primary key not null,  
    nome_dependente varchar(100) not null,
    cpf varchar(100) not null
);

create table funcionarios (
    id_funcionarios int auto_increment primary key not null,
    nome_funcionario varchar(100) not null,
    cpf varchar(100) not null,
    id_dependente int not null,
    id_departamento int not null,
    foreign key (id_dependente) references dependentes (id_dependente),
    foreign key (id_departamento) references departamento (id_depar)
);

INSERT INTO diretoria (nome_diretoria) VALUES
('Diretoria Geral'),
('Diretoria Financeira'),
('Diretoria de Recursos Humanos');

INSERT INTO departamento (funcao, nome_departamento, id_diretoria) VALUES
('Gestão', 'Administração', 1),
('Controle Financeiro', 'Finanças', 2),
('Recrutamento e Seleção', 'RH', 3),
('Treinamento', 'Desenvolvimento', 3);

INSERT INTO dependentes (nome_dependente, cpf) VALUES
('Ana Silva', '12345678901'),
('Carlos Souza', '23456789012'),
('Mariana Lima', '34567890123');

INSERT INTO funcionarios (nome_funcionario, cpf, id_dependente, id_departamento) VALUES
('João Pereira', '98765432100', 1, 1),
('Maria Oliveira', '87654321009', 2, 2),
('Pedro Santos', '76543210908', 3, 3),
('Laura Costa', '65432109807', 1, 4);
