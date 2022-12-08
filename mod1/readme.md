#PostgresSQL

**Comando para cria um Database**

    CREATE DATABASE <nomeDatabase>

**Para Lista os banco de dados criados**

    \l

**Para deletar um database**

    DROP DATABASE <nome>

## Criando uma tabela

**```integer``` -->  dados que são números inteiros entre -2147483648 e +2147483647**

**```real``` --> dados numéricos com casas decimais de até seis dígitos**

**```serial``` -->  números inteiros positivos com incremento automático, ou seja, não precisamos colocar o valor dele, pois quando incluirmos um novo dado, ele já será incrementado + 1**

**```numeric``` -->  com ele, poderemos definir a precisão, ou seja, a quantidade de casas decimais que queremos no número.**

#### Existem três tipos de campo de texto:

> - **O ```varchar(n)```, utilizado em 90% dos casos. Ele funciona para textos com um número de caracteres pré-determinado. Por exemplo: o nome de uma pessoa teria até, aproximadamente, 255 caracteres, portanto poderíamos caracterizá-lo como varchar;**

> - **O ```char(n)```, utilizado quando sabemos exatamente a quantidade de caracteres que será utilizada naquele campo. Por exemplo, o campo de CPF sempre vai ter 11 caracteres, então podemos colocá-lo em um campo do tipo char, que já tem o tamanho pré-definido. Porém, se foram definidos 11 caracteres para o campo e a pessoa preencheu apenas 9, os dois caracteres restantes serão preenchidos com espaços em branco, e não queremos isso. Por isso o este type só deve ser utilizado quando o dado tiver um número exato de caracteres;**
  
> - **O ```text```, utilizado quando não temos ideia de qual será o tamanho do texto, mas ainda queremos armazená-lo no banco de dados.**

**boolean** --> Ele é definido para ser verdadeiro ou falso, podendo ser utilizado quando só duas opções são possíveis: ativo ou inativo, se uma ação foi executada ou não e exemplos similares.

**date** --> Data

**time** --> Hora

**timestamp** -->  Apresenta tanto a data quanto a hora. Estes tipos de campo estão

**Criando tabela**
```sql
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
```

**Para os dados de minha tabela**

```sql
SELECT * FROM aluno;
```

# Executando operações CRUD

### Incluindo um egistro na tabela

```sql
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

```

### Atualizando um registro na tabela

> **WHERE** - Sere para filtrar apenas os dados, básimante é lógica.

**Selecionar todos com filtragem pelo ID**

```sql
SELECT *
    FROM aluno
WHERE id = 1
```

```SET``` - Serve para informarmos os campos que modificamos
```UPDATE``` - Atualizar

### Excluindo um registro da tabela

**Verificando se um Nico na tabela**
```sql
SELECT * FROM aluno WHERE nome = 'Nico';
```

**Removendo registro, onde há um Nico**

```sql
DELETE FROM aluno WHERE nome = 'Nico';
```

## Consultas com Filtro

### Selecionando colunas específicas da tabela

```AS``` - É um alias, ou seja, serve para trocar o nome de exibição dos campos na tabela.

Se escrevermos ```SELECT matriculado_em AS quando_se_matriculou```, essa coluna aparecerá com o nome ```"quando_se_matriculou"```.

```sql
SELECT nome,
       idade,
       matriculado_em
FROM aluno;
```

O alias também pode ser usado para atribuir nomes com espaço para os campos, o que pode ser útil, por exemplo, para elaborar um relatório. Nesses casos, os novos nomes precisam estar entre aspas duplas ```" "```, ou o programa não irá reconhecê-los e aparecerá uma mensagem de erro de sintaxe.
```sql
SELECT nome AS "Nome do Aluno",
       idade,
       matriculado_em AS quando_se_matriculou
FROM aluno;
```

![](https://caelum-online-public.s3.amazonaws.com/1659-postgreSQL-Primeiros-passos-com-SQL/Transcri%C3%A7%C3%A3o/Aula+3/Imagens/alterando_nome_com_as.png)


### Filtrando registros de campos do tipo texto

**Filtrando por igualdade**

```sql
SELECT * 
	FROM aluno
WHERE nome = 'Diogo';
```

**Filtrando por diferença**

```sql 
SELECT * 
	FROM aluno
WHERE nome <> 'Diogo'; 
```

**Ou**

```sql
SELECT * 
	FROM aluno
WHERE nome != 'Diogo';
```

**Filtrando com o Like**

```LIKE``` - Pode ser entendido como "parecido com".

***"ONDE nome PARECIDO COM 'Diogo'"***
```sql
SELECT *
	FROM aluno
WHERE nome LIKE 'Diogo';
```

Ao utilizarmos o **LIKE** podemos aplicar dois operadores especiais: o ``_`` (underline) e o ``%`` (porcentagem).

``_`` - "Qualquer caractere naquela posição", ou seja, a posição que ele ocupa substitui um caractere.

```sql
SELECT * 
	FROM aluno
WHERE nome LIKE '_iogo';
```

```sql
SELECT * 
	FROM aluno
WHERE nome LIKE 'Di_go';
```

**Não parece com**

```sql
SELECT * 
	FROM aluno
WHERE nome NOT LIKE '_iogo';
```

``%`` - substitui todos os caracteres até o espaço que ele ocupa.

para recuperar todos os nomes que comecem com "D", usamos o comando:
```sql
SELECT * 
    FROM aluno
 WHERE nome LIKE 'D%';
 ```
**Filtrar os nomes terminados em "s"**

```sql
SELECT * 
    FROM aluno
 WHERE nome LIKE '%s';
 ```

**Recuperar todos os nomes que tenham espaço**

```sql
SELECT * 
    FROM aluno
 WHERE nome LIKE '% %';
```

**Filtrar entre Textos**

```sql
SELECT * 
    FROM aluno
 WHERE nome LIKE '%i%a%';
```

###  Filtrando registros de campos do tipo numérico, data e booleano

**Filtrando valores Nulos atraves do IS**

```SQL

SELECT *
    FROM aluno
 WHERE cpf IS NULL;

```

``IS NOT`` -  É o comando oposto, ou seja, mostra todos os registros cujo campo selecionado está preenchido.

**>= , que filtra resultados maiores ou iguais ao valor que declaramos**

```SQL
SELECT *
	FROM aluno
WHERE idade >= 35;
```

``<=``
```sql
SELECT *
	FROM aluno
WHERE idade <= 35;
```
``>``

```sql
SELECT *
	FROM aluno
WHERE idade > 35;

```

``<``

```sql
SELECT *
	FROM aluno
WHERE idade < 35;
```

``BETWEEN`` - Procura resultados entre dois valores declarados.
```sql
SELECT *
    FROM aluno
 WHERE idade BETWEEN 10 AND 20;
```

Com esse exemplo também não teremos nenhum resultado retornado, porque 35 não está na faixa que definimos. Contudo, se trocarmos "20" por "35", o programa retornaria os dados do "Diogo" novamente, porque o BETWEEN é um comando inclusivo. Isso significa que ele começa a contar do menor valor declarado, ou seja, o "10", até o maior valor declarado, o "35". Sendo assim, os resultados que incluem esses números também aparecem na nossa busca.

Todos esses filtros que aprendemos agora funcionam para os campos **INTERGER, REAL, SERIAL, NUMERIC, DATE, TIME e TIMESTAMP**.

Já campo BOOLEAN usará apenas os filtros ``=`` e ``<>``.

```sql
SELECT * FROM aluno WHERE ativo = true;
```

```sql
SELECT * FROM aluno WHERE ativo = false;
```

**Para filtrar os resultados do campo boleano que sejam nulos**

```sql
SELECT * FROM aluno WHERE ativo IS NULL;
```


**Filtrando utilizando operadores E e OU**

``AND`` - E

```SQL
SELECT * 
	FROM aluno
WHERE nome LIKE 'D%'
	AND cpf IS NOT NULL;
```

```sql
SELECT *
	FROM aluno
WHERE nome LIKE '%Steppat'
	AND nome LIKE 'Nico%';
```

``OR`` - OU

```SQL
SELECT * 
	FROM aluno
WHERE nome LIKE 'Diogo'
	OR nome LIKE 'Rodrigo'
	OR nome LIKE 'Nico%';

```

```sql
SELECT * 
	FROM aluno
WHERE nome LIKE 'Thiago'
	OR nome LIKE 'Miguel';
```

### Resumo do modulo

- A selecionar campos específicos da tabela
- Como definir um alias para os nomes dos campos
- A filtrar registros, utilizando o WHERE para campos do tipo de texto
	- Operadores =, !=,<>, LIKE e NOT LIKE
	- A diferença entre = e LIKE
	- O funcionamento do caractere % no filtro com LIKE e NOT LIKE
	- O funcionamento do caractere _ no filtro com LIKE e NOT LIKE
- Como filtrar utilizando IS NULL e IS NOT NULL
- Como filtrar registros para campos do tipos relacionados a números, datas e horas
	- =, !=, <>, <, <=, >, >=
	- BETWEEN
- Como filtrar registros para campos do tipo booleano
  - =, !=, <>
- Como funciona os operadores lógicos AND e OR

## Trabalhando com relacionamentos

### Criando tabela com chave primária

**Chave primária** - "uma coluna, ou grupo de colunas, que pode ser usada para identificar uma linha da tabela".

```sql
CREATE TABLE curso (

	id INTEGER NOT NULL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL

)
```
Uma chave primária não pode ser nula e precisa ser única.

### Criando uma tabela com chave estrangeira

```sql

FOREIGN KEY (CAMPO_NA_TABELA_ORIGEM)
REFERENCES TABELA_DESTINO (CAMPO_NA_TABELA DESTINO)

```
