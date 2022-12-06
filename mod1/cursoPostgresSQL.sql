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

























