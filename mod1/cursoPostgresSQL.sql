SELECT * From aluno;

CREATE TABLE aluno (
	id SERIAL,
	nome VARCHAR(255),
	cpf CHAR(11),
	observacao TEXT,
	idade INTEGER,
	dinheiro NUMERIC(10, 2),
	altura REAL,
	ativo BOOLEAN,
	data_nascimento DATE,
	hora_aula TIME,
	matriculado_em TIMESTAMP
);

INSERT INTO aluno (
	
	nome,
	cpf,
	observacao,
	idade,
	dinheiro,
	altura,
	ativo,
	data_nascimento,
	hora_aula,
	matriculado_em
	
	
	
) VALUES

(
	'Diogo',
	'12345678901',
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac dui et nisl vestibulum consequat. Integer vitae magna egestas, finibus libero dapibus, maximus magna. Fusce suscipit mi ut dui vestibulum, non vehicula felis fringilla. Vestibulum eget massa blandit, viverra quam non, convallis libero. Morbi ut nunc ligula. Duis tristique purus augue, nec sodales sem scelerisque dignissim. Sed vel rutrum mi. Nunc accumsan magna quis tempus rhoncus. Duis volutpat nulla a aliquet feugiat. Vestibulum rhoncus mi diam, eu consectetur sapien eleifend in. Donec sed facilisis velit. Duis tempus finibus venenatis. Mauris neque nisl, pulvinar eu volutpat eu, laoreet in massa. Quisque vestibulum eros ac tortor facilisis vulputate. Sed iaculis purus non sem tempus mollis. Curabitur felis lectus, aliquam id nunc ut, congue accumsan tellus.',
	35,
	100.50,
	1.81,
	TRUE,
	'1984-08-27',
	'17:30:00',
	'2020-02-08 12:32:45'
	


);

SELECT *
    FROM aluno
WHERE id = 1

UPDATE aluno 
	SET 
	nome = 'Nico',
	cpf = '10987654321',
	observacao = 'Teste',
	idade = 38,
	dinheiro = 15.23,
	altura = 1.90,
	ativo = FALSE,
	data_nascimento = '1980-01-15',
	hora_aula = '13:00:00',
	matriculado_em = '2020-01-02 15:00:00'

WHERE id = 1;

SELECT * FROM aluno WHERE nome = 'Nico';

DELETE FROM aluno WHERE nome = 'Nico';
	

SELECT nome,
       idade,
       matriculado_em
FROM aluno;


SELECT nome AS "Nome do Aluno",
       idade,
       matriculado_em AS quando_se_matriculou
FROM aluno;

INSERT INTO aluno (nome) VALUES ('Erick Fernandes');
INSERT INTO aluno (nome) VALUES ('Nico Steppat');
INSERT INTO aluno (nome) VALUES ('João Roberto');
INSERT INTO aluno (nome) VALUES ('Diego');

-- Filtrando registro de campos do tipo texto

SELECT * 
	FROM aluno
WHERE nome = 'Diogo';


SELECT * 
	FROM aluno
WHERE nome <> 'Diogo';

SELECT * 
	FROM aluno
WHERE nome != 'Diogo';

SELECT *
	FROM aluno
WHERE nome LIKE 'Diogo';

SELECT * 
	FROM aluno
WHERE nome LIKE '_iogo';


SELECT * 
	FROM aluno
WHERE nome LIKE 'Di_go';

SELECT * 
	FROM aluno
WHERE nome NOT LIKE 'Di_go';

SELECT * 
	FROM aluno
WHERE nome LIKE 'D%';

SELECT * 
	FROM aluno
WHERE nome LIKE '%s';

SELECT * 
	FROM aluno
WHERE nome LIKE '% %';

SELECT * 
	FROM aluno
WHERE nome LIKE '%i%a%';

-- Filtrando registros de campos do tipo numérico, data e booleano

SELECT * 
	FROM aluno
WHERE cpf IS NOT NULL;

SELECT * 
	FROM aluno
WHERE idade <> 36;

SELECT *
	FROM aluno
WHERE idade >= 35;

SELECT *
	FROM aluno
WHERE idade <= 35;

SELECT *
	FROM aluno
WHERE idade > 35;

SELECT *
	FROM aluno
WHERE idade < 35;

SELECT *
	FROM aluno
WHERE idade BETWEEN 10 AND 35;

SELECT * FROM aluno WHERE ativo = true;

SELECT * FROM aluno WHERE ativo = false;

SELECT * FROM aluno WHERE ativo IS NULL;



SELECT * 
	FROM aluno
WHERE nome LIKE 'D%'
	AND cpf IS NOT NULL;
	
SELECT * 
	FROM aluno
WHERE nome LIKE 'Diogo'
	OR nome LIKE 'Rodrigo'
	OR nome LIKE 'Nico%';

SELECT *
	FROM aluno
WHERE nome LIKE '%Steppat'
	AND nome LIKE 'Nico%';


SELECT * 
	FROM aluno
WHERE nome LIKE 'Thiago'
	OR nome LIKE 'Miguel';



DROP TABLE curso;

CREATE TABLE curso (

	id INTEGER NOT NULL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL

)

INSERT INTO curso (id, nome) VALUES (NULL, NULL);
INSERT INTO curso (id, nome) VALUES (1, NULL);
INSERT INTO curso (id, nome) VALUES (NULL, 'HTML');

INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (2, 'Javascript');

SELECT * FROM curso;
SELECT * FROM aluno;

DROP TABLE aluno;

CREATE TABLE aluno (

	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL

);

INSERT INTO aluno (nome) VALUES ('Diogo');
INSERT INTO aluno (nome) VALUES ('vINICIUS');

SELECT * FROM aluno;
SELECT * FROM curso;

DROP TABLE aluno_curso;

CREATE TABLE aluno_curso (

	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id, curso_id),
	
	FOREIGN KEY (aluno_id)
		REFERENCES aluno (id),
	
	FOREIGN KEY (curso_id)
		REFERENCES curso (id)
	
);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1, 1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2, 1);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3, 1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1, 3);


SELECT * FROM aluno WHERE id = 1;
SELECT * FROM curso WHERE id = 1;

SELECT * FROM aluno WHERE id = 2;
SELECT * FROM curso WHERE id = 1;

SELECT * FROM aluno WHERE id = 3;
SELECT * FROM curso WHERE id = 1;


SELECT *
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	JOIN curso		 ON curso.id             = aluno_curso.curso_id

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2, 2);

SELECT aluno.nome as "Nome do Aluno",
	   curso.nome as "Nome do Curso"
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	JOIN curso       ON curso.id             = aluno_curso.curso_id

INSERT INTO aluno (nome) VALUES ('Nico');
INSERT INTO curso (id, nome) VALUES (3, 'CSS');



SELECT aluno.nome as "Nome do Aluno",
	   curso.nome as "Nome do Curso"
	FROM aluno
LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
LEFT JOIN curso       ON curso.id             = aluno_curso.curso_id



SELECT aluno.nome as "Nome do Aluno",
	   curso.nome as "Nome do Curso"
	FROM aluno
RIGHT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
RIGHT JOIN curso       ON curso.id             = aluno_curso.curso_id

SELECT aluno.nome as "Nome do Aluno",
	   curso.nome as "Nome do Curso"
	  FROM aluno
FULL JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
FULL JOIN curso       ON curso.id             = aluno_curso.curso_id


SELECT aluno.nome as "Nome do Aluno",
	   curso.nome as "Nome do Curso"
	From aluno
CROSS JOIN curso;

INSERT INTO aluno (nome) VALUES ('João');

SELECT * FROM aluno;
SELECT * FROM aluno_curso;
SELECT * FROM curso;

DELETE FROM aluno WHERE id = 1;

DROP TABLE aluno_curso;

CREATE TABLE aluno_curso (

	aluno_id INTEGER,
	curso_id INTEGER,
	
	PRIMARY KEY (aluno_id, curso_id),
	
	FOREIGN KEY (aluno_id) 
		REFERENCES aluno (id)
	ON DELETE CASCADE,
	
	FOREIGN KEY (curso_id) 
		REFERENCES curso (id)

);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1, 1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2, 1);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3, 1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1, 3);

SELECT * FROM aluno_curso;

SELECT aluno.nome as "Nome do Aluno",
	   curso.nome as "Nome do Curso"
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	JOIN curso       ON curso.id             = aluno_curso.curso_id


SELECT * FROM aluno;

UPDATE aluno
	SET id = 10
	WHERE id = 2;

UPDATE aluno
	SET id = 20
	WHERE id = 4;


DROP TABLE aluno_curso;

CREATE TABLE aluno_curso (

	aluno_id INTEGER,
	curso_id INTEGER,
	
	PRIMARY KEY (aluno_id, curso_id),
	
	FOREIGN KEY (aluno_id) 
		REFERENCES aluno (id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	
	FOREIGN KEY (curso_id) 
		REFERENCES curso (id)

);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2, 1);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3, 1);


SELECT 
	   aluno.id   as aluno_id,
	   aluno.nome as "Nome do Aluno",
	   curso.id   as curso_id,
	   curso.nome as "Nome do Curso"
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	JOIN curso       ON curso.id             = aluno_curso.curso_id

SELECT * FROM aluno;

UPDATE aluno
	SET id = 10
	WHERE id = 2;

SELECT * FROM aluno_curso;


CREATE TABLE funcionarios (

	id SERIAL PRIMARY KEY,
	matricula VARCHAR(10),
	nome VARCHAR(255),
	sobrenome VARCHAR(255)

);

INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M001', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M002', 'Vinícius', 'Dias');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M003', 'Nico', 'Steppat');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M004', 'João', 'Roberto');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M005', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M006', 'Alberto', 'Martins');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M007', 'Diogo', 'Oliveira');




SELECT * FROM funcionarios ORDER BY nome DESC;
SELECT * FROM funcionarios ORDER BY nome, matricula DESC;

SELECT * FROM funcionarios ORDER BY 3, 4, 2;

SELECT * FROM funcionarios ORDER BY 4, nome DESC, 2 ASC;

SELECT 
	   aluno.id   as aluno_id,
	   aluno.nome as "Nome do Aluno",
	   curso.id   as curso_id,
	   curso.nome as "Nome do Curso"
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	JOIN curso       ON curso.id             = aluno_curso.curso_id
	ORDER BY aluno.nome DESC, curso.nome

SELECT * FROM curso;
SELECT * FROM aluno;
	
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (20, 3);

SELECT 
	   aluno.id   as aluno_id,
	   aluno.nome as "Nome do Aluno",
	   curso.id   as curso_id,
	   curso.nome as "Nome do Curso"
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	JOIN curso       ON curso.id             = aluno_curso.curso_id
	ORDER BY curso.nome, aluno.nome;


SELECT *
	FROM funcionarios
	ORDER BY id
  LIMIT 5
OFFSET 3;


SELECT COUNT(id),
		SUM(id),
		MAX(id),
		MIN(id),
		ROUND(AVG(id), 0)
	FROM funcionarios;


SELECT DISTINCT
	nome,
	sobrenome

FROM funcionarios
ORDER BY nome;


SELECT
	nome,
	sobrenome,
	COUNT(id)
FROM funcionarios
GROUP BY nome, sobrenome
ORDER BY nome;


SELECT
	nome,
	sobrenome,
	COUNT(id)
FROM funcionarios
GROUP BY 1, 2
ORDER BY nome;

SELECT curso.nome,
		COUNT(aluno.id)
	FROM aluno
	JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
	JOIN curso       ON curso.id = aluno_curso.curso_id
GROUP BY 1
ORDER BY 1


SELECT * FROM aluno;
SELECT * FROM aluno_curso;
SELECT * FROM curso;

SELECT curso.nome,
		COUNT(aluno.id)
	FROM curso
	LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
	LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
	
	--WHERE curso.nome = 'Javascript'
GROUP BY 1
	HAVING COUNT(aluno.id) > 0;
	


SELECT nome,
		COUNT(id)
	FROM funcionarios
	GROUP BY nome
	HAVING COUNT(id) > 1;


