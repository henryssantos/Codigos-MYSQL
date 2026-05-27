CREATE DATABASE gestao_colegio;

USE gestao_colegio;

CREATE TABLE aluno(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT
);

CREATE TABLE professor(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    especialidade VARCHAR(100)
);

CREATE TABLE curso(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    carga_horaria INT
);

CREATE TABLE turma(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    id_curso INT,
    id_professor INT,
    FOREIGN KEY(id_curso) REFERENCES curso(id),
    FOREIGN KEY(id_professor) REFERENCES professor(id)
);

CREATE TABLE matricula(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_turma INT,
    data_matricula DATE,
    FOREIGN KEY(id_aluno) REFERENCES aluno(id),
    FOREIGN KEY(id_turma) REFERENCES turma(id)
);

INSERT INTO aluno(nome, idade) VALUES
('Carlos', 20),
('Ana', 22),
('Juliana', 19),
('Roberto', 25);

INSERT INTO professor(nome, especialidade) VALUES
('Marcos Lima', 'Banco de Dados'),
('Fernanda Souza', 'Programação'),
('Ricardo Alves', 'Redes');

INSERT INTO curso(nome, carga_horaria) VALUES
('Desenvolvimento Web', 200),
('Java Fundamentals', 180),
('Administração de Redes', 150);

INSERT INTO turma(nome, id_curso, id_professor) VALUES
('Turma A', 1, 1),
('Turma B', 2, 2),
('Turma C', 3, 3),
('Turma D', 1, NULL);

INSERT INTO matricula(id_aluno, id_turma, data_matricula) VALUES
(1, 1, '2026-05-01'),
(2, 1, '2026-05-01'),
(3, 2, '2026-05-02');

SELECT 
	a.nome AS "Aluno",
    t.nome AS 'Turma',
    m.data_matricula AS "Data de Matricula"
FROM matricula m
INNER JOIN aluno a ON m.id_aluno = a.id
INNER JOIN turma t ON m.id_turma = t.id;

SELECT 
	t.nome AS "Turma",
    p.nome AS "Professor"
FROM turma t
LEFT JOIN professor p ON t.id_professor = p.id;

SELECT 
	p.nome AS "Professor",
    t.nome AS "Turma "
FROM turma t
RIGHT JOIN professor p ON t.id_professor = p.id;

    
