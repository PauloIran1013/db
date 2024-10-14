DROP DATABASE IF EXISTS livraria;
CREATE DATABASE livraria;
USE livraria;

CREATE TABLE Autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50),
    data_nascimento DATE
);

CREATE TABLE Livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    id_autor INT,
    genero VARCHAR(50),
    ano_publicacao INT,
    quantidade_estoque int not null,
    preco DECIMAL(10, 2),
    FOREIGN KEY (id_autor) REFERENCES Autores(id_autor)
);

CREATE TABLE Vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_livro INT,
    data_venda DATE NOT NULL,
    quantidade INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_livro) REFERENCES Livros(id_livro)
);

INSERT INTO Autores (nome, nacionalidade, data_nascimento) VALUES
('J.K. Rowling', 'Britânica', '1965-07-31'),
('George R.R. Martin', 'Americano', '1948-09-20'),
('Isaac Asimov', 'Americano', '1920-01-02');

INSERT INTO Livros (titulo, id_autor, genero, ano_publicacao, preco, quantidade_estoque) VALUES
('Harry Potter e a Pedra Filosofal', 1, 'Fantasia', 1997, 39.90,7),
('Harry Potter e a Câmara Secreta', 1, 'Fantasia', 1998, 59.90,8),
('As Crônicas de Gelo e Fogo: A Guerra dos Tronos', 2, 'Fantasia', 1996, 49.90,52),
('Fundação', 3, 'Ficção Científica', 1951, 29.90,10);

INSERT INTO Livros (titulo, id_autor, genero, ano_publicacao, preco, quantidade_estoque) VALUES
('O Guia do Mochileiro das Galáxias', 1, 'Ficção Científica', 1979, 34.90, 100);

INSERT INTO Vendas (id_livro, data_venda, quantidade, total) VALUES
(1, '2024-01-15', 2, 79.80),
(3, '2024-02-10', 1, 49.90),
(2, '2024-02-20', 1, 39.90),
(4, '2024-03-01', 3, 89.70);

--2. Atualização de Dados

update Livros 
set preco = 29.90
where titulo = 'Harry Potter e a Câmara Secreta' ;

update Livros 
set quantidade_estoque = 2
where titulo = 'Harry Potter e a Câmara Secreta' ;


--3. Exclusão de Dados

delete from Livros
where titulo = 'O Guia do Mochileiro das Galáxias';

-- Atividade 2: Consulta de Dados
-- 1. Consultas Simples:
select * from Livros 
where id_autor = 1;

select * from Livros
where preco > 40.00;

2. Consultas com Filtros:
SELECT nome
FROM Autores
WHERE id_autor IN (
    SELECT id_autor
    FROM Livros
    GROUP BY id_autor
    HAVING COUNT(*) > 1
);

SELECT *
FROM Vendas
WHERE data_venda BETWEEN '2024-01-15' AND '2024-02-20';

-- 3. Consultas com Funções de Agregação:

select avg (preco)
from Livros;

select sum(quantidade)
from vendas;
