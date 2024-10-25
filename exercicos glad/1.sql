drop database glad;
create database glad;
use glad;

DROP TABLE IF EXISTS usuario;
CREATE TABLE usuario (
  id    INT AUTO_INCREMENT,
  nome  VARCHAR(45) NOT NULL,
  email VARCHAR(255) NOT NULL,
  fone  VARCHAR(20) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=INNODB;

DROP TABLE IF EXISTS forum;
CREATE TABLE forum (
  id           INT AUTO_INCREMENT,
  titulo       VARCHAR(45) NOT NULL,
  data_criacao DATE NOT NULL,
  PRIMARY KEY (id)
) ENGINE=INNODB;

DROP TABLE IF EXISTS postagem;
CREATE TABLE postagem (
  usuario_id    INT NOT NULL,
  forum_id      INT NOT NULL,
  mensagem      TEXT NOT NULL,
  data_postagem DATE NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES usuario (id),
  FOREIGN KEY (forum_id)   REFERENCES   forum (id)
) ENGINE=INNODB;


--1
create user 'moderadort'@'localhost' identified by '123teste';
grant all privileges on  glad.* to 'moderadort'@'localhost';
flush privileges;
select user from mYsql.user;

--2
create user 'pikachu'@'localhost' identified by 'teste123';
grant select (mensagem) on glad.postagem to 'pikachu'@'localhost';
flush privileges;

/* 3. Crie um usuÃ¡rio chamado maverick, com a senha topgun. 
Este usuÃ¡rio poderÃ¡ fazer INSERT, UPDATE e DELETE 
nas tabelas fÃ³rum e postagem. 
Ele tambÃ©m poderÃ¡ fazer SELECT na tabela usuÃ¡rio.*/
create user 'maverick'@'localhost' identified by 'topgun';
grant all privileges on  glad.forum to 'maverick'@'localhost';
grant all privileges on  glad.postagem to 'maverick'@'localhost';
grant select on glad.usuario to 'maverick'@'localhost';
flush privileges;

/* 4. Com o usuÃ¡rio moderador, faÃ§a inserÃ§Ã£o de registros 
nas tabelas forum e usuario 
(pelo menos 8 registros na tabela usuario e 5 registros na tabela forum).*/
INSERT INTO usuario (nome, email, fone) VALUES 
('Alice Silva', 'alice@example.com', '123456789'),
('Bruno Costa', 'bruno@example.com', '987654321'),
('Carlos Oliveira', 'carlos@example.com', '456123789'),
('Diana Lima', 'diana@example.com', '321654987'),
('Eduardo Santos', 'eduardo@example.com', '654789123'),
('Fernanda Almeida', 'fernanda@example.com', '789123456'),
('Gabriel Pereira', 'gabriel@example.com', '234567890'),
('Helena Rocha', 'helena@example.com', '876543210');

INSERT INTO forum (titulo, data_criacao) VALUES 
('Discussão sobre Tecnologia', '2024-10-01'),
('Fórum de Jogos', '2024-10-05'),
('Dicas de Programação', '2024-10-10'),
('Tendências em Design', '2024-10-12'),
('Eventos de Tecnologia', '2024-10-15'),
('Cultura Geek', '2024-10-18'),
('Desenvolvimento Pessoal', '2024-10-20'),
('Filmes e Séries', '2024-10-25');

INSERT INTO postagem (usuario_id, forum_id, mensagem, data_postagem) VALUES 
(1, 1, 'Alguém já testou a nova tecnologia X?', '2024-10-02'),
(2, 2, 'Qual é o melhor jogo de 2024?', '2024-10-06'),
(3, 3, 'Quais linguagens estão em alta atualmente?', '2024-10-11'),
(4, 1, 'A tecnologia Y é muito promissora!', '2024-10-12'),
(5, 4, 'Design minimalista é o futuro.', '2024-10-13'),
(6, 5, 'Quais eventos de tecnologia vocês recomendam?', '2024-10-14'),
(7, 6, 'A cultura geek é muito rica e diversificada.', '2024-10-17'),
(8, 7, 'Autoajuda e desenvolvimento pessoal são importantes!', '2024-10-21');

/* 5. Com o usuÃ¡rio root, consulte o conteÃºdo das tabelas fÃ³rum e usuÃ¡rio; 
(tente fazer as mesmas consultas com os usuÃ¡rios moderador, pikachu e maverick)*/
create user 'rooty'@'localhost' identified by '12345';
grant all privileges on glad.* to 'rooty'@'localhost' ;
flush privileges;
select * from forum;
select * from usuario;


/* 6. Com o usuÃ¡rio maverick, insira 10 registros 
na tabela postagem (as postagens deverÃ£o ser de 6 usuÃ¡rios diferentes).*/
INSERT INTO postagem (usuario_id, forum_id, mensagem, data_postagem) VALUES 
(1, 1, 'A nova tecnologia está mudando tudo!', '2024-10-26'),
(2, 2, 'Os gráficos desse jogo são impressionantes!', '2024-10-26'),
(3, 3, 'Qual é a melhor linguagem para iniciantes?', '2024-10-26'),
(4, 4, 'Estou aprendendo sobre design e adorando!', '2024-10-26'),
(5, 5, 'O último evento foi incrível, recomendo!', '2024-10-26'),
(1, 6, 'Cultura geek é tudo que precisamos!', '2024-10-26'),
(2, 7, 'O desenvolvimento pessoal faz toda a diferença!', '2024-10-26'),
(3, 8, 'Filmes e séries são ótimos para relaxar.', '2024-10-26'),
(4, 1, 'Tecnologia sempre em evolução!', '2024-10-26'),
(5, 2, 'Adoro jogos que estimulam a mente.', '2024-10-26');


/* 7. Com o usuÃ¡rio root, consulte o conteÃºdo da tabela postagem; 
(tente fazer a mesma consulta com os usuÃ¡rios moderador, pikachu e maverick)*/
select * from postagem ;

/* 8. Com o usuÃ¡rio moderador, faÃ§a uma consulta que retorne: 
tÃ­tulo do fÃ³rum, nome do usuÃ¡rio e data da postagem.*/
SELECT 
    f.titulo AS titulo_forum, 
    u.nome AS nome_usuario, 
    p.data_postagem 
FROM 
    glad.postagem p
JOIN 
    glad.forum f ON p.forum_id = f.id
JOIN 
    glad.usuario u ON p.usuario_id = u.id;

/* 9. Com o usuÃ¡rio pikachu, tente fazer 
a mesma consulta da questÃ£o anterior 
(exiba o print da consulta e o resultado obtido).*/
mysql> SELECT
    ->     f.titulo AS titulo_forum,
    ->     u.nome AS nome_usuario,
    ->     p.data_postagem
    -> FROM
    ->     glad.postagem p
    -> JOIN
    ->     glad.forum f ON p.forum_id = f.id
    -> JOIN
    ->     glad.usuario u ON p.usuario_id = u.id;
ERROR 1142 (42000): SELECT command denied to user 'pikachu'@'localhost' for table 'forum'

/* 10. Acesse o banco com o usuÃ¡rio root 
(ou algum usuÃ¡rio com permissÃµes de superadmin)*/
mysql -u rooty -p 

/* 11. Verifique se o autocommit do banco 
estÃ¡ ativo ou nÃ£o (exiba o comando):*/
    mysql> SELECT @@autocommit;
+--------------+
| @@autocommit |
+--------------+
|            1 |
+--------------+
1 row in set (0.00 sec)

/* 12. Desabilite o autocommit:*/
set autocommit = 0;

/* 13. FaÃ§a uma consulta (SELECT) 
de todos os registros da tabela postagem:*/
 select *  from postagem;

 
/* 14. Inicie uma transaÃ§Ã£o*/
start transaction;
 INSERT INTO usuario (nome, email, fone) VALUES 
('Isabela Ferreira', 'isabela@example.com', '123456789');
commit;

/* 15. Insira 1 novo registro a tabela postagem:*/
start transaction;
INSERT INTO postagem (usuario_id, forum_id, mensagem, data_postagem) VALUES 
(1, 1, 'Esta é uma nova postagem sobre tecnologia!', '2024-10-26');
commit;

/* 16. FaÃ§a, novamente, uma consulta (SELECT) 
de todos os registros da tabela postagem:*/
select * from postagem;

/* 17. Execute um rollback da transaÃ§Ã£o: */
start transaction;
INSERT INTO postagem (usuario_id, forum_id, mensagem, data_postagem) VALUES 
(1, 1, 'Esta é uma nova postagem sobre tecnologia!', '2024-10-26');
rollback;

/* 18. FaÃ§a, novamente, uma consulta (SELECT) 
de todos os registros da tabela postagem:*/
select * from postagem;


/* 19. Inicie uma nova transaÃ§Ã£o: */
start transaction;
 INSERT INTO usuario (nome, email, fone) VALUES 
('Cleiton', 'Cleiton@example.com', '123456789');
commit;


/* 20. FaÃ§a uma consulta (SELECT) 
de todos os registros da tabela postagem:*/
select * from postagem;

/* 21. Insira 1 novo registro a tabela postagem:*/
start transaction;
INSERT INTO postagem (usuario_id, forum_id, mensagem, data_postagem) VALUES 
(2, 3, 'Essa é uma nova discussão sobre programação!', '2024-10-26');
commit;

/* 23. FaÃ§a uma nova consulta (SELECT) 
de todos os registros da tabela postagem:*/
select * from postagem;


/* 24. Execute o commit da transaÃ§Ã£o: */
start transaction;
INSERT INTO postagem (usuario_id, forum_id, mensagem, data_postagem) VALUES 
(3, 4, 'Quais frameworks de front-end vocês estão usando?', '2024-10-26');
commit;

/* 25. FaÃ§a, novamente, uma consulta (SELECT) 
de todos os registros da tabela postagem:*/
select * from postagem;



/* 26. Tente realizar um rollback (verifique se terÃ¡ ou nÃ£o efeito apÃ³s o commit) 
e faÃ§a uma nova consulta:*/

START TRANSACTION;

INSERT INTO postagem (usuario_id, forum_id, mensagem, data_postagem) VALUES 
(4, 2, 'Estou aprendendo React e adorando!', '2024-10-26');

COMMIT;
rollback;

/* 27. Habilite o autocommit: */
set autocommit = 1;

/* 28. Exclua os usuÃ¡rios: maverick, pikachu e moderador */
drop user 'maverick'@'localhost';
drop user 'pikachu'@'localhost';
drop user 'moderadort'@'localhost';

/* 29. FaÃ§a uma consulta que exiba o tÃ­tulo das postagens dos usuÃ¡rios cujo nome contenha a letra "a".*/

SELECT 
    f.titulo AS titulo_forum, 
    p.mensagem AS mensagem_postagem 
FROM 
    postagem p
JOIN 
    usuario u ON p.usuario_id = u.id
JOIN 
    forum f ON p.forum_id = f.id
WHERE 
    u.nome LIKE '%a%';