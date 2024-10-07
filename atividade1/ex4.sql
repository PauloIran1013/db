        drop database locadora_filmes;

        create database locadora_filmes;

        use locadora_filmes;

        create table membros(
        id_membro int auto_increment primary key not null,
        primeiro_nome varchar(100) not null,
        ultimo_nome varchar(100) not null,
        n_titulo int not null,
        credito int not null
        );

        create table astros (
            id_astro int auto_increment primary key not null,
            nome varchar(100) not null,
            data_nasc date not null
        );

        create table filmes(
            id_filme int auto_increment primary key not null,
            titulo varchar(100) not null,
            categoria varchar(100) not null,
            autor varchar(100) not null,
            id_astro int not null,
            foreign key (id_astro) references astros (id_astro)
        );

        create table fitas (
            id_fita int auto_increment primary key not null,
            formato varchar(100) not null,
            id_membro int not null,
            id_filme int not null,
            foreign key (id_membro) references membros (id_membro),
            foreign key (id_filme) references filmes (id_filme)
        );


INSERT INTO membros (primeiro_nome, ultimo_nome, n_titulo, credito) VALUES
('João', 'Silva', 123456789, 500),
('Maria', 'Oliveira', 987654321, 600),
('Ricardo', 'Santos', 456789123, 300),
('Fernanda', 'Lima', 321654987, 400),
('Carlos', 'Almeida', 159753468, 700);

INSERT INTO astros (nome, data_nasc) VALUES
('Robert Downey Jr.', '1965-04-04'),
('Scarlett Johansson', '1984-11-22'),
('Chris Evans', '1981-06-13'),
('Natalie Portman', '1981-06-09'),
('Leonardo DiCaprio', '1974-11-11');

INSERT INTO filmes (titulo, categoria, autor, id_astro) VALUES
('Os Vingadores', 'Ação', 'Joss Whedon', 1),
('Lucy', 'Ficção Científica', 'Luc Besson', 2),
('Capitão América: O Soldado Invernal', 'Ação', 'Anthony e Joe Russo', 3),
('Cisne Negro', 'Drama', 'Darren Aronofsky', 4),
('O Lobo de Wall Street', 'Comédia', 'Martin Scorsese', 5);

INSERT INTO fitas (formato, id_membro, id_filme) VALUES
('VHS', 1, 1),
('DVD', 2, 2),
('Blu-ray', 3, 3),
('VHS', 4, 4),
('DVD', 5, 5);
