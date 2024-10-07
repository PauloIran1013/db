--crm = id_medico--
drop database consultorio;

create database consultorio;

use consultorio;

create table medico(
    crm int auto_increment primary key not null, 
    nome_medico varchar (100) not null,
    especialidade varchar(100) not null,
    telefone int not null
);

create table paciente(
    id_paciente int auto_increment primary key not null,
    nome varchar(100) not null,
    endereco varchar(100) not null,
    telefone int not null,
    data_nasc date not null,
    sexo  varchar(100) not null,
    nome_convenio varchar (100) not null,
    documento  varchar (100) not null,
    numero_convenio int not null
);

create table consulta (
    id_consulta int auto_increment primary key not null,
    data_con date not null,
    hora time not null,
    especialidade_consulta varchar(100) not null,
    crm int not null,
    id_paciente int not null,
    foreign key (crm) references medico (crm),
    foreign key (id_paciente) references paciente (id_paciente)
);

INSERT INTO medico (nome_medico, especialidade, telefone) VALUES
('Dr. João Silva', 'Cardiologia', 123456789),
('Dra. Maria Oliveira', 'Pediatria', 987654321),
('Dr. Pedro Santos', 'Ortopedia', 456789123),
('Dra. Ana Costa', 'Ginecologia', 321654987),
('Dr. Luiz Ferreira', 'Neurologia', 159753468);

INSERT INTO paciente (nome, endereco, telefone, data_nasc, sexo, nome_convenio, documento, numero_convenio) VALUES
('Carlos Almeida', 'Rua A, 123', 123456789, '1980-01-15', 'Masculino', 'Unimed', '12345678901', 1001),
('Juliana Ferreira', 'Av. B, 456', 987654321, '1992-05-23', 'Feminino', 'Bradesco Saúde', '10987654321', 1002),
('Fernanda Lima', 'Praça C, 789', 456789123, '1985-07-30', 'Feminino', 'Amil', '19283746500', 1003),
('Ricardo Santos', 'Rua D, 101', 321654987, '1975-10-12', 'Masculino', 'Porto Seguro', '11223344556', 1004),
('Mariana Sousa', 'Av. E, 202', 159753468, '1990-03-18', 'Feminino', 'SulAmérica', '12312312312', 1005);

INSERT INTO consulta (data_con, hora, especialidade_consulta, crm, id_paciente) VALUES
('2024-10-10', '09:00:00', 'Cardiologia', 1, 1),
('2024-10-11', '14:30:00', 'Pediatria', 2, 2),
('2024-10-12', '11:15:00', 'Ortopedia', 3, 3),
('2024-10-13', '15:45:00', 'Ginecologia', 4, 4),
('2024-10-14', '08:00:00', 'Neurologia', 5, 5);

