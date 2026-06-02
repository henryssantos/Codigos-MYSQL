CREATE DATABASE varejo;

USE varejo;

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cidade VARCHAR(100)
);

CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100),
    preco DECIMAL(10,2)
);

CREATE TABLE venda (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    data_venda DATE,
    id_cliente INT,
    FOREIGN KEY (id_cliente)
    REFERENCES cliente(id_cliente)
);

CREATE TABLE item_venda (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_venda INT,
    id_produto INT,
    quantidade INT,
    FOREIGN KEY (id_venda) REFERENCES venda(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

INSERT INTO cliente(nome,cidade) VALUES
('Maria','Salvador'),
('João','Feira de Santana'),
('Ana','Camaçari'),
('Carlos','Salvador');

INSERT INTO produto(nome_produto,preco) VALUES
('Notebook',3500),
('Mouse',80),
('Teclado',150),
('Monitor',1200),
('Headset',250);

INSERT INTO venda(data_venda,id_cliente) VALUES
('2026-06-01',1),
('2026-06-01',2),
('2026-06-02',3),
('2026-06-02',1);

INSERT INTO item_venda(id_venda,id_produto,quantidade) VALUES
(1,1,1),
(1,2,2),
(2,3,1),
(2,5,2),
(3,4,1),
(4,2,3),
(4,5,1);

-- Questão 1:
SELECT 
    c.nome, 
    v.data_venda, 
    p.nome_produto, 
    iv.quantidade
FROM venda v
INNER JOIN cliente c ON v.id_cliente = c.id_cliente
INNER JOIN item_venda iv ON v.id_venda = iv.id_venda
INNER JOIN produto p ON iv.id_produto = p.id_produto;

-- Questão 2:

SELECT 
    COUNT(id_venda) AS total_vendas
FROM venda;

-- Questão 3:

SELECT 
    SUM(p.preco * iv.quantidade) AS faturamento_total
FROM item_venda iv
INNER JOIN produto p ON iv.id_produto = p.id_produto;

-- Questão 4:

SELECT 
    AVG(preco) AS preco_medio
FROM produto;

-- Questão 5:

SELECT 
    nome_produto, 
    preco
FROM produto
WHERE preco = (SELECT MAX(preco) FROM produto);

-- Questão 6:

SELECT 
    nome_produto, 
    preco
FROM produto
WHERE preco = (SELECT MIN(preco) FROM produto);

-- Questão 7: 

SELECT 
    c.nome, 
    SUM(iv.quantidade) AS total_produtos_comprados
FROM cliente c
INNER JOIN venda v ON c.id_cliente = v.id_cliente
INNER JOIN item_venda iv ON v.id_venda = iv.id_venda
GROUP BY c.nome;

-- Questão 8:

SELECT 
    c.nome, 
    SUM(p.preco * iv.quantidade) AS valor_total_gasto
FROM cliente c
INNER JOIN venda v ON c.id_cliente = v.id_cliente
INNER JOIN item_venda iv ON v.id_venda = iv.id_venda
INNER JOIN produto p ON iv.id_produto = p.id_produto
GROUP BY c.nome;

-- Questão 9:

SELECT 
    v.id_venda, 
    AVG(iv.quantidade) AS media_produtos_por_venda
FROM venda v
INNER JOIN item_venda iv ON v.id_venda = iv.id_venda
GROUP BY v.id_venda;

-- Questão 10:

WITH TotaisPorVenda AS (
    SELECT 
        c.nome, 
        SUM(p.preco * iv.quantidade) AS valor_total_compra
    FROM cliente c
    INNER JOIN venda v ON c.id_cliente = v.id_cliente
    INNER JOIN item_venda iv ON v.id_venda = iv.id_venda
    INNER JOIN produto p ON iv.id_produto = p.id_produto
    GROUP BY c.nome, v.id_venda
)

-- Cliente com a compra de MAIOR valor
SELECT nome, valor_total_compra, 'Maior Compra' AS status
FROM TotaisPorVenda
WHERE valor_total_compra = (SELECT MAX(valor_total_compra) FROM TotaisPorVenda)

UNION

-- Cliente com a compra de MENOR valor
SELECT nome, valor_total_compra, 'Menor Compra' AS status
FROM TotaisPorVenda
WHERE valor_total_compra = (SELECT MIN(valor_total_compra) FROM TotaisPorVenda);


