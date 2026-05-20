CREATE DATABASE atividade;

USE atividade;

CREATE TABLE clientes(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT NOT NULL
);

INSERT INTO clientes(nome, idade)
VALUES ("Maria", 25);

INSERT INTO clientes(nome, idade)
VALUES("Carlos", 40);

INSERT INTO clientes(nome, idade)
VALUES ("Ana", 31);

INSERT INTO clientes (nome, idade)
VALUES
('JOAO', 20),
('FERNANDA', 35),
('LUCAS', 28);

SELECT * FROM clientes;

UPDATE clientes
SET idade = 50
WHERE id = 2; 

UPDATE clientes
SET nome = "Paulo Silva"
WHERE id = 3;

UPDATE clientes
SET idade = 19,
	nome = "Henry Santos"
WHERE id = 4;

UPDATE clientes
SET idade = idade + 1
WHERE id > 0;

DELETE FROM clientes
WHERE id = 5;

DELETE FROM clientes
WHERE id > 0
AND idade < 18;

DELETE FROM clientes
WHERE id > 0
AND idade > 80;

DELETE FROM clientes
WHERE id > 0;

SELECT * FROM clientes;

SELECT nome FROM clientes;

SELECT nome, idade FROM clientes;

SELECT * FROM clientes
WHERE id = 2;

SELECT * FROM clientes
WHERE idade > 30;

SELECT * FROM clientes
WHERE idade = 25;

SELECT * FROM clientes
WHERE idade <> 40;

SELECT * FROM clientes
WHERE idade >= 18;

SELECT * FROM clientes
WHERE idade <= 60;

SELECT * FROM clientes
WHERE id>= 1 AND ID <= 5;

SELECT * FROM clientes
WHERE idade > 20 AND idade< 50;

SELECT * FROM clientes
WHERE idade = 18 OR idade = 60;

SELECT * FROM clientes
WHERE id = 1 OR id = 10;

SELECT * FROM clientes
WHERE NOT id = 3;

SELECT * FROM clientes
WHERE NOT idade = 25;

SELECT * FROM clientes
WHERE id BETWEEN 1 AND 10;

SELECT * FROM clientes
WHERE idade BETWEEN 20 AND 40;

SELECT * FROM clientes
WHERE idade NOT BETWEEN 30 AND 50;

SELECT * FROM clientes
WHERE id IN (1, 3, 5);

SELECT * FROM clientes
WHERE idade IN (18, 25, 40);

SELECT * FROM clientes
WHERE id NOT IN (2, 4, 6);

SELECT * FROM clientes
WHERE idade NOT IN (20, 30, 50);

SELECT * FROM clientes
WHERE nome LIKE 'JO%';

SELECT * FROM clientes
WHERE nome LIKE '%A';

SELECT * FROM clientes
WHERE nome LIKE '%OS%';

SELECT * FROM clientes
WHERE nome LIKE '%AN%';

SELECT * FROM clientes
WHERE nome NOT LIKE '%AR%';

SELECT * FROM clientes
WHERE nome IS NULL;

SELECT * FROM clientes
WHERE nome IS NOT NULL;

SELECT * FROM clientes
WHERE idade IS NULL;

SELECT * FROM clientes
WHERE idade IS NOT NULL;

SELECT SUM(idade) AS SOMA_IDADES
FROM clientes;

SELECT SUM(idade) AS SOMA_IDADES
FROM clientes
WHERE idade > 50;

SELECT AVG(idade) AS MEDIA_IDADES
FROM clientes;

SELECT AVG(idade) AS MEDIA_IDADES
FROM clientes
WHERE idade > 18;

SELECT MIN(idade) AS MENOR_IDADE
FROM clientes;

SELECT MAX(idade) AS MAIOR_IDADE
FROM clientes;

SELECT COUNT(*) AS TOTAL_CLIENTES
FROM clientes;

SELECT COUNT(*) AS TOTAL_CLIENTES
FROM clientes
WHERE idade > 30;


