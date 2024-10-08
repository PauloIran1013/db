drop database locadora_musicas;
create database locadora_musicas;
use locadora_musicas;

create table cantor(
    id_cantor int auto_increment primary key not null,
    nome varchar (100) not null
);

create table compositor(
    id_compositor int auto_increment primary key not null,
    nome varchar(100)
);

create table musicas (
    id_musica int auto_increment primary key not null,
    titulo varchar (100) not null,
    duracao time not null,
    id_cantor int not null,
    id_compositor int not null,
    foreign key (id_cantor) references cantor (id_cantor),
    foreign key (id_compositor) references compositor (id_compositor)
);

create table cd(
    id_cd int auto_increment primary key not null,
    titulo varchar (100) not null,
    id_musica int not null,
    foreign key (id_musica) references musicas (id_musica)
);


INSERT INTO cantor (nome) VALUES
('Maria Gadú'),
('Djavan'),
('Caetano Veloso');


INSERT INTO compositor (nome) VALUES
('Tom Jobim'),
('Chico Buarque'),
('Gilberto Gil');

INSERT INTO musicas (titulo, duracao, id_cantor, id_compositor) VALUES
('Oração', '00:03:30', 1, 1),
('Flor de Lis', '00:04:15', 2, 2),
('Sozinho', '00:02:45', 3, 3),
('Sutilmente', '00:05:00', 1, 2);

INSERT INTO cd (titulo, id_musica) VALUES
('CD Maria Gadú', 1),
('CD Djavan', 2),
('CD Caetano Veloso', 3),
('CD Maria Gadú - Ao Vivo', 4);
