	CREATE DATABASE Gestao_escola;
    
    USE Gestao_escola;
    
    CREATE TABLE aluno(
		id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(200),
        idade INT
    );
    
    CREATE TABLE professor(
		id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(200),
        especialidade VARCHAR(200)
    );
    
    CREATE TABLE curso(
		id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(200),
        carga_horaria INT
    );
    
    CREATE TABLE turma(
		id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		nome VARCHAR(100),
        id_curso INT NOT NULL,
        id_professor INT NOT NULL,
        
		FOREIGN KEY (id_curso) REFERENCES curso(id),
        FOREIGN KEY(id_professor) REFERENCES professor(id)
    );
    
    CREATE TABLE matricula(
		id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        id_aluno INT NOT NULL,
		id_turma INT NOT NULL,
        data_matricula TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        
        FOREIGN KEY(id_aluno) REFERENCES aluno(id),
        FOREIGN KEY (id_turma) REFERENCES turma(id)
        
    );
    
INSERT INTO aluno(nome, idade)
VALUES
('Carlos',20),
('Ana',	22),
('Juliana',	19),
('Roberto', 25);

INSERT INTO professor(nome, especialidade)
VALUES
('Marcos Lima', 'Banco de Dados'),
('Fernanda Souza', 'Programação'),
('Ricardo Alves', 'Redes');

INSERT INTO curso(nome, carga_horaria)
VALUES
('Desenvolvimento Web', 200),
('Java Fundemantals ', 180),
('Administração de Redes', 150);

INSERT INTO turma(nome, id_curso, id_professor)
VALUES
('Turma A', 1 ,1),
('Turma B', 2,2),
('Turma C', 3,3),
('Turma D',1,1);

INSERT INTO matricula(id_aluno, id_turma, data_matricula)
VALUES
(1,1, '2026-05-01'),
(2,1,'2026-05-01'),
(3,2,'2026-05-02');


    