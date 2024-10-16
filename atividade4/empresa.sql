/* DESCRIÇÃO DAS TABELAS:
employee: Contém detalhes do funcionário, como ID, nome, data de nascimento, endereço, cidade, país e supervisor imediato.
customer: Armazena informações do cliente, incluindo ID do cliente, nome, empresa, e-mail, endereço, cidade e país.
purchase: Registra detalhes de pedidos, incluindo ID do pedido, ID do cliente (quem fez o pedido), funcionário 
		(quem atendeu o pedido), preço total e detalhes de compra e envio.
purchase_item: Conecta compras a produtos por meio de ID, produto, preço unitário e quantidade.
category: Fornece insights sobre categorias de produtos usando ID da categoria, nome, descrição e ID da categoria principal.
product: Lista os produtos da loja e inclui o ID do produto, o nome do produto, o ID da categoria, a quantidade por unidade, 
		o preço unitário, as unidades em estoque e o status do produto. */
        
-- PARTE 1 - CRIAÇÃO DA DATABASE E SUAS TABELAS
DROP DATABASE IF EXISTS empresa;
CREATE DATABASE empresa;
USE empresa;

-- Criação da tabela 'employee'
CREATE TABLE employee (
    employee_id INTEGER PRIMARY KEY,
    last_name VARCHAR(40) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    birth_date DATE,
    hire_date DATE,
    address VARCHAR(128),
    city VARCHAR(30),
    country VARCHAR(30),
    reports_to INTEGER,
    FOREIGN KEY (reports_to) REFERENCES employee(employee_id)
);

-- Criação da tabela 'customer'
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    contact_name VARCHAR(30) NOT NULL,
    company_name VARCHAR(40),
    contact_email VARCHAR(128) NOT NULL,
    address VARCHAR(120),
    city VARCHAR(30),
    country VARCHAR(30)
);

-- Criação da tabela 'purchase'
CREATE TABLE purchase (
    purchase_id INTEGER PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    total_price DECIMAL(10,2) NOT NULL,
    purchase_date TIMESTAMP NOT NULL,
    shipped_date TIMESTAMP,
    ship_address VARCHAR(60),
    ship_city VARCHAR(30),
    ship_country VARCHAR(15),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);

-- Criação da tabela 'purchase_item'
CREATE TABLE purchase_item (
    purchase_id INT,
    product_id INT,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (purchase_id, product_id),
    FOREIGN KEY (purchase_id) REFERENCES purchase(purchase_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Criação da tabela 'category'
CREATE TABLE category (
    category_id INTEGER PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    description TEXT,
    parent_category_id INTEGER,
    FOREIGN KEY (parent_category_id) REFERENCES category(category_id)
);

-- Criação da tabela 'product'
CREATE TABLE product (
    product_id INTEGER PRIMARY KEY,
    product_name VARCHAR(40) NOT NULL,
    category_id INT,
    quantity_per_unit VARCHAR(20),
    unit_price DECIMAL(10,2),
    units_in_stock INT,
    discontinued BOOLEAN NOT NULL,
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

-- PARTE 2 - INSERÇÃO DOS DADOS NAS TABELAS
-- Inserindo registros na tabela 'employee'
INSERT INTO employee (employee_id, last_name, first_name, birth_date, hire_date, address, city, country, reports_to) VALUES
(1, 'Smith', 'John', '1980-01-01', '2010-06-01', '123 Main St', 'New York', 'USA', NULL),
(2, 'Doe', 'Jane', '1985-02-02', '2012-07-15', '456 Elm St', 'Los Angeles', 'USA', 1),
(3, 'Brown', 'James', '1978-03-03', '2009-09-09', '789 Oak St', 'Chicago', 'USA', 1),
(4, 'Johnson', 'Emily', '1990-04-04', '2015-04-01', '101 Maple St', 'Houston', 'USA', 2),
(5, 'Williams', 'Michael', '1983-05-05', '2011-11-11', '202 Pine St', 'Phoenix', 'USA', 3),
(6, 'Jones', 'Sarah', '1992-06-06', '2017-03-03', '303 Cedar St', 'Philadelphia', 'USA', 2),
(7, 'Miller', 'David', '1975-07-07', '2008-02-02', '404 Birch St', 'San Antonio', 'USA', 4),
(8, 'Wilson', 'Jessica', '1988-08-08', '2013-12-12', '505 Spruce St', 'San Diego', 'USA', 5),
(9, 'Moore', 'Daniel', '1977-09-09', '2007-05-05', '606 Fir St', 'Dallas', 'USA', 4),
(10, 'Taylor', 'Laura', '1989-10-10', '2016-01-01', '707 Ash St', 'San Jose', 'USA', 6);

-- Inserindo registros na tabela 'customer'
INSERT INTO customer (customer_id, contact_name, company_name, contact_email, address, city, country) VALUES
(1, 'Alice Johnson', 'Tech Solutions', 'alice.johnson@techsolutions.com', '100 Tech St', 'New York', 'USA'),
(2, 'Bob Smith', 'Innovative Goods', 'bob.smith@innovativegoods.com', '200 Market St', 'Los Angeles', 'USA'),
(3, 'Charlie Brown', 'Best Services', 'charlie.brown@bestservices.com', '300 Service Rd', 'Chicago', 'USA'),
(4, 'Diana Prince', 'Heroic Supplies', 'diana.prince@heroicsupplies.com', '400 Hero St', 'Houston', 'USA'),
(5, 'Edward White', 'White Goods', 'edward.white@whitegoods.com', '500 White St', 'Phoenix', 'USA'),
(6, 'Fiona Black', 'Black Enterprises', 'fiona.black@blackenterprises.com', '600 Enterprise Rd', 'Philadelphia', 'USA'),
(7, 'George Green', 'Green Tech', 'george.green@greentech.com', '700 Green St', 'San Antonio', 'USA'),
(8, 'Hannah Blue', 'Blue Waves', 'hannah.blue@bluewaves.com', '800 Ocean Rd', 'San Diego', 'USA'),
(9, 'Ian Red', 'Red Apples', 'ian.red@redapples.com', '900 Apple St', 'Dallas', 'USA'),
(10, 'Julia Silver', 'Silver Services', 'julia.silver@silverservices.com', '1000 Silver Rd', 'San Jose', 'USA');

-- Inserindo registros na tabela 'purchase'
INSERT INTO purchase (purchase_id, customer_id, employee_id, total_price, purchase_date, shipped_date, ship_address, ship_city, ship_country) VALUES
(1, 1, 1, 250.00, '2023-01-01 10:00:00', '2023-01-02 10:00:00', '100 Tech St', 'New York', 'USA'),
(2, 2, 2, 500.00, '2023-02-01 11:00:00', '2023-02-03 11:00:00', '200 Market St', 'Los Angeles', 'USA'),
(3, 3, 3, 150.00, '2023-03-01 12:00:00', '2023-03-04 12:00:00', '300 Service Rd', 'Chicago', 'USA'),
(4, 4, 4, 300.00, '2023-04-01 13:00:00', '2023-04-05 13:00:00', '400 Hero St', 'Houston', 'USA'),
(5, 5, 5, 1000.00, '2023-05-01 14:00:00', '2023-05-06 14:00:00', '500 White St', 'Phoenix', 'USA'),
(6, 6, 6, 750.00, '2023-06-01 15:00:00', '2023-06-07 15:00:00', '600 Enterprise Rd', 'Philadelphia', 'USA'),
(7, 7, 7, 200.00, '2023-07-01 16:00:00', '2023-07-08 16:00:00', '700 Green St', 'San Antonio', 'USA'),
(8, 8, 8, 450.00, '2023-08-01 17:00:00', '2023-08-09 17:00:00', '800 Ocean Rd', 'San Diego', 'USA'),
(9, 9, 9, 600.00, '2023-09-01 18:00:00', '2023-09-10 18:00:00', '900 Apple St', 'Dallas', 'USA'),
(10, 10, 10, 350.00, '2023-10-01 19:00:00', '2023-10-11 19:00:00', '1000 Silver Rd', 'San Jose', 'USA');

INSERT INTO purchase (purchase_id, customer_id, employee_id, total_price, purchase_date, shipped_date, ship_address, ship_city, ship_country) VALUES
(11, 1, 2, 400.00, '2023-10-02 10:00:00', '2023-10-03 10:00:00', '101 Tech St', 'New York', 'USA'),
(12, 1, 3, 250.00, '2023-10-03 11:00:00', '2023-10-04 11:00:00', '102 Tech St', 'New York', 'USA');

-- Inserindo registros na tabela 'purchase_item'
INSERT INTO purchase_item (purchase_id, product_id, unit_price, quantity) VALUES
(1, 1, 25.00, 10),
(2, 2, 50.00, 10),
(3, 3, 15.00, 10),
(4, 4, 30.00, 10),
(5, 5, 100.00, 10),
(6, 6, 75.00, 10),
(7, 7, 20.00, 10),
(8, 8, 45.00, 10),
(9, 9, 60.00, 10),
(10, 10, 35.00, 10);

-- Inserindo registros na tabela 'category'
INSERT INTO category (category_id, name, description, parent_category_id) VALUES
(1, 'Electronics', 'Electronic devices and gadgets', NULL),
(2, 'Home Appliances', 'Appliances for home use', NULL),
(3, 'Clothing', 'Apparel and accessories', NULL),
(4, 'Books', 'Books and magazines', NULL),
(5, 'Sports', 'Sporting goods and equipment', NULL),
(6, 'Toys', 'Toys and games for children', NULL),
(7, 'Beauty', 'Beauty products and accessories', NULL),
(8, 'Furniture', 'Home and office furniture', NULL),
(9, 'Groceries', 'Food and beverages', NULL),
(10, 'Health', 'Healthcare products and medicines', NULL);

-- Inserindo registros na tabela 'product'
INSERT INTO product (product_id, product_name, category_id, quantity_per_unit, unit_price, units_in_stock, discontinued) VALUES
(1, 'Smartphone', 1, '1 unit', 699.99, 50, FALSE),
(2, 'Washing Machine', 2, '1 unit', 499.99, 30, FALSE),
(3, 'T-Shirt', 3, '1 unit', 19.99, 200, FALSE),
(4, 'Novel', 4, '1 unit', 9.99, 100, FALSE),
(5, 'Tennis Racket', 5, '1 unit', 79.99, 40, FALSE),
(6, 'Action Figure', 6, '1 unit', 14.99, 150, FALSE),
(7, 'Lipstick', 7, '1 unit', 24.99, 75, FALSE),
(8, 'Office Chair', 8, '1 unit', 89.99, 20, FALSE),
(9, 'Organic Apples', 9, '1 kg', 3.99, 100, FALSE),
(10, 'Vitamin C', 10, '1 bottle', 12.99, 60, FALSE);

-- PARTE 3 - EXERCÍCIOS:

--1. Exibir todos os dados presentes na tabela product:
select * from product;

--2. Exibir os nomes dos produtos com um preço unitário maior ou igual a 24.99.
select * from product
where unit_price >= 24.99;

--3. Exibir dados de todos os produtos em categorias com ID 3 ou 8 e com preço unitário acima de 15.00.
select * from product
where (category_id = 3 or category_id = 8) 
and unit_price > 15.00;
    
--4. Selecione os nomes dos produtos junto com suas categorias. Exiba duas colunas: product_name e category_name.
SELECT  product_name, 
(SELECT name FROM category WHERE category_id = product.category_id) AS category_name
FROM product;

--5. Para cada compra, exiba o ID da compra, o nome do produto, o preço unitário no momento da compra e a quantidade de itens de cada produto.
SELECT 
purchase_item.purchase_id, 
product.product_name, 
purchase_item.unit_price, 
purchase_item.quantity
FROM 
 purchase_item, 
 product
WHERE 
purchase_item.product_id = product.product_id;

--6. Para cada compra, exiba todas as categorias de produtos comprados nessa compra. Mostre cada categoria apenas uma vez para cada compra.
select
purchase_item.purchase_id,
category.name as category_name
from 
purchase_item,
product,category
WHERE purchase_item.product_id = product.product_id
and product.category_id = category.category_id;

--7.  Exiba os dados de todas as categorias. Classifique as categorias por nome em ordem crescente (A a Z).
SELECT * FROM category 
ORDER BY name asc; 

--8. Mostre os sobrenomes, os nomes e as datas de nascimento dos funcionários. Classifique os resultados por idade do funcionário em ordem 
--crescente(Dica: use a colunabirth_date ).

select last_name, first_name, birth_date from employee
order by birth_date asc;

-- 9. Exibir dados de todos os produtos, classificando os resultados pelo número de unidades em ordem decrescente e pelo nome do produto em 
-- ordem crescente.

select * from product
order by  units_in_stock desc ,product_name asc;

--10. Para cada categoria de produto, mostre seu nome e encontre o preço unitário médio. Exiba duas colunas: nome e average_unit_price.
SELECT 
    category.name AS category_name,
    (SELECT AVG(unit_price) 
     FROM product 
     WHERE product.category_id = category.category_id) AS average_unit_price
FROM 
    category;

--11. Conte quantos clientes vivem em cada cidade, exceto em Knoxville e Stockton. Classifique os resultados pelo nome da cidade em ordem crescente. 
--Exiba duas colunas: city e customers_quantity.
SELECT 
city,
COUNT(*) AS employees_quantity
FROM 
employee
WHERE 
city NOT IN ('Knoxville', 'Stockton')
GROUP BY 
city
ORDER BY 
city ASC;

--12. Para cada categoria, encontre o número de produtos descontinuados. Mostre apenas as categorias com pelo menos três produtos descontinuados. 
--Classifique as linhas pelo número de produtos descontinuados em ordem decrescente. Exiba duas colunas: name (o nome da categoria) e 
--discontinued_products_number.

SELECT category.name, COUNT(product.product_id) AS discontinued_products_number
FROM category
JOIN product ON category.category_id = product.category_id
WHERE product.discontinued = TRUE
GROUP BY  category.category_id, category.name
HAVING COUNT(product.product_id) >= 3
ORDER BY discontinued_products_number DESC;

-- 13. Exibir o sobrenome e o nome dos funcionários com data de contratação desconhecida.
SELECT first_name, last_name from employee
WHERE hire_date is null;

--14. Contar o número de funcionários com datas de nascimento e de contratação desconhecidas.
SELECT 
    COUNT(*) 
FROM 
    employee
WHERE 
    birth_date IS NULL AND hire_date IS NULL;

-- 15.  Para cada cliente que fez uma compra, exiba o ID de cada compra feita por esse cliente e a porcentagem de dinheiro gasto nessa compra em relação a todo o dinheiro 
-- gasto por esse cliente.
SELECT 
    c.customer_id,
    p.purchase_id,
    p.total_price,
    (p.total_price / SUM(p.total_price) OVER (PARTITION BY c.customer_id) * 100) AS porcentagem_gasto
FROM 
    purchase p
JOIN 
    customer c ON p.customer_id = c.customer_id;
