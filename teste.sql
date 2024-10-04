drop database locadora ;

create database locadora;

use locadora ;

create table genero(
id_genero int auto_increment primary key,
nome_genero varchar (80) not null 
);

create table midia(
id_midia int auto_increment primary key,   
nome_midia varchar (80) not null
);

create table jogos (
id_jogo int auto_increment primary key,
nome_jogos varchar(80) not null,
ano_jogo int not null,
valor int not null,
id_genero int not null,
id_midia int not null,
foreign key (id_genero) references genero (id_genero),
foreign key (id_midia) references midia (id_midia)
);



insert into genero(nome_genero)values
('Ação'),
('Aventura'),
('Estratégia'),
('RPG'),
('Esporte');

insert into midia(nome_midia)values
('Físico'),
('Digital');

insert into jogos(nome_jogos, ano_jogo, valor,id_genero,id_midia)values
('The Last of Us', 2013, 250, 1, 2),
('God of War', 2018, 300, 1, 2),
('The Legend of Zelda: Breath of the Wild', 2017, 270, 2, 2),
('Elden Ring', 2020, 300, 4, 1),
('Civilization VI', 2016, 150, 3, 2);




-- vizu --
show tables
select * from 
