CREATE TABLE alunos (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  turma TEXT NOT NULL,
  curso TEXT NOT NULL,
  data_nascimento DATE
);

CREATE TABLE cursos (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  duracao_anos INT
);

CREATE TABLE matriculas (
  id SERIAL PRIMARY KEY,
  aluno_id INT REFERENCES alunos(id) ON DELETE CASCADE,
  curso_id INT REFERENCES cursos(id) ON DELETE CASCADE,
  data_matricula DATE DEFAULT CURRENT_DATE
);

INSERT INTO cursos (nome, duracao_anos)
VALUES ('Engenharia da Computação', 4), 
       ('Ciência da Computação', 4), 
       ('Adm Tech', 4), 
       ('Sistemas da Informação', 4), 
       ('Engenharia de Software', 4); 

INSERT INTO alunos (nome, turma, curso, data_nascimento)
VALUES ('Adriana Fernandes Policia', 'T18', 'Engenharia da Computação', '2002-05-10'), 
       ('Maria Vitória dos Santos', 'T18', 'Ciência da Computação', '2006-08-20'), 
       ('Marcela Amorim da Costa', 'T18', 'Adm Tech', '2005-02-15'), 
       ('Karol Rocha Barbosa', 'T18', 'Adm Tech', '2003-03-12'), 
       ('Sophia Hochman', 'T18', 'Sistemas da Informação', '2001-04-21'), 
       ('Lívia Sabóia Tavares', 'T18', 'Engenharia de Software', '2002-10-20'), 
       ('Mirela Schneider Bianchi', 'T18', 'Engenharia de Software', '2003-12-10'), 
       ('Victor Raymundo Grycajuk', 'T18', 'Ciência da Computação', '2006-01-02'), 
       ('Jaime Andrade de Almeida', 'T18', 'Ciência da Computação', '2003-11-10'), 
       ('Lucas Carvalho dos Ramos', 'T18', 'Adm Tech', '2000-01-18'); 

INSERT INTO matriculas (aluno_id, curso_id, data_matricula)
VALUES (3, 3, '2024-01-24'),
       (4, 4, '2024-01-24'),
       (5, 5, '2024-01-24'),
       (6, 5, '2024-01-24'),
       (7, 6, '2024-01-24'),
       (8, 7, '2024-01-24'),
       (9, 7, '2024-01-24'),
       (10, 4, '2024-01-24'),
       (11, 4, '2024-01-24'),
       (12, 5, '2024-01-24');

/* Consulta de Relacionamento */

SELECT a.nome AS aluno, c.nome AS curso, m.data_matricula
FROM matriculas m
JOIN alunos a ON m.aluno_id = a.id
JOIN cursos c ON m.curso_id = c.id;
