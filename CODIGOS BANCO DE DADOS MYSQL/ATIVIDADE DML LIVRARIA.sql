CREATE DATABASE livraria;

USE livraria;

CREATE TABLE livro(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200),
    autor VARCHAR(200),
    preco DECIMAL(10,2),
    quantidade_estoque INT,
    categoria VARCHAR(200)
);

CREATE TABLE cliente(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200),
    idade INT
);

INSERT INTO cliente(nome,idade)
VALUES("Maria", 25);

INSERT INTO cliente(nome,idade)
VALUES("Carlos", 40);

INSERT INTO cliente(idade,nome)
VALUES(31,"Ana");

INSERT INTO cliente(nome,idade)
VALUES
('João', 19),
('Bruna', 28),
('Ricardo', 52);

SELECT * FROM livro
WHERE categoria = "Ficção"
	AND preco < 50.00;
    
SELECT * FROM livro
WHERE titulo LIKE "O%"
 OR titulo LIKE "A%";
 
 SELECT * FROM livro
WHERE autor LIKE "%Silva%";

SELECT * FROM livro
WHERE preco BETWEEN 29.90 AND 79.90;

SELECT * FROM livro
WHERE categoria IN ('Biografias' , 'Historia', 'Autoajuda');

SELECT * FROM livro
WHERE categoria NOT IN ("Didaticos" AND "Romance");

SELECT * FROM livro
WHERE quantidade_estoque BETWEEN 1 AND 5;

SELECT * FROM livro
WHERE autor IS NULL;

SELECT * FROM livro
WHERE quantidade_estoque = 0;

SELECT SUM(preco * quantidade_estoque) AS valor_total_estoque
FROM livro;

SELECT * FROM livro
WHERE categoria = 'Tecnologia'
	AND preco = (
		SELECT MAX(preco) FROM LIVRO
        WHERE categoria = 'Tecnologia'
);

SELECT MIN(preco) AS menor_preco_poesia
FROM livro
WHERE categoria = 'Poesia';

SELECT AVG(preco) AS media_preco
FROM livro
WHERE autor = 'George Orwell';

SELECT COUNT(*) AS total_suspense 
FROM livro
WHERE categoria = 'Suspense';
