-- Linguagem SQL: Comandos DDL.

/* O primeiro comando a ser estudado é o CREATE DATABASE. Este
comando permite criar um banco de dados no SGBD escolhido. */

CREATE DATABASE IF NOT EXISTS ifba_ilheus DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

use ifba_ilheus;

/* Um exemplo para o comando CREATE TABLE seria a criação da tabela
Empregado, com os campos: matricula nome, data de nascimento e salario. */

CREATE TABLE IF NOT EXISTS empregado 
(
	matricula INTEGER,
	nome VARCHAR(50),
    data_nasc DATE,
    salario FLOAT(5,2)	);
    
/* Escrever um comando de SQL que permita criar uma tabela com o nome
Caixa_Postal, capaz de armazenar um inteiro de até quatro dígitos e uma
string com 45 caracteres */

CREATE TABLE IF NOT EXISTS caixa_postal
(	
	num_caixa INT,
    nm_caixa CHAR(45)	);
    
/* Escrever um comando de SQL que permita criar uma tabela com o nome
Pessoa, com o seguintes atributos: ID, Nome, Idade, Salario, Telefone e
Código Postal) 
No entanto, podem ser indicadas as características próprias de cada uma das
colunas, tais como: Que valores podem admitir? Qual o valor padrão? O campo
representa um atributo identificador (chave primária)? 
*/

-- learning about constraints. 
/* Existem alguns tipos distintos de restrições que se podem aplicar a colunas:
 constraint DEFAULT
 Constraint NOT NULL
 Constraint CHECK
 Constraint UNIQUE
 Constraint PRIMARY KEY
 Constraint REFERENCES */

/* Se quisermos que uma coluna não admita valores nulos, usamos a cláusula
'NOT NULL'. Caso um valor não seja inserido em uma coluna o valor padrão
(default) armazenado nela é 'NULL'. No entanto, é possível associar um outro valor
default através da cláusula 'DEFAULT'. Se quisermos, por exemplo, que a
localidade padrão (default) se chame Ilhéus então teremos que fazer o seguinte:*/

CREATE TABLE IF NOT EXISTS pessoa 
(
	id_pessoa INTEGER NOT NULL,
    nm_pessoa VARCHAR(45),
    idade INTEGER,
    sl_pessoa FLOAT(5,2) DEFAULT ('1040.00'),
    tel_pessoa VARCHAR(12),
    cd_postal VARCHAR(9)	
)DEFAULT CHARSET = utf8;

/* A constraint CHECK permite realizar a validação dos dados inseridos na
coluna, através da especificação de uma condição. São admitidos apenas os dados
cujo resultado da avaliação da condição seja verdadeiro. */

CREATE TABLE IF NOT EXISTS dados_pessoas
(
	nome CHAR(60) CHECK(nome NOT LIKE '%Riligan%'),
    idade INTEGER NOT NULL CHECK(idade >= 0 and idade <= 150),
    sexo CHAR(1) CHECK(sexo IN('M','F')),
    temp_servico INTEGER CHECK(temp_servico >= 0)
)DEFAULT CHARSET = utf8;

/* A constraint 'UNIQUE' indica que os valores dessa coluna não podem se
repetir. Em uma tabela podem existir tantas colunas 'UNIQUE' quantas forem
necessárias.
 */
 
 CREATE TABLE IF NOT EXISTS infos_pessoais
 (
	codigo NUMERIC NOT NULL,
    nome VARCHAR(20) UNIQUE, 
    cpf VARCHAR(19) UNIQUE,
    temp_serv INTEGER UNIQUE CHECK(temp_serv >= 0)
    )DEFAULT CHARSET = utf8;
    
--  Criar um banco de dados Clínica com as seguintes características:
/* Tabela Medicos
 Atributo CRM: caractere, único e não vazio
 Atributo Nome: caractere e não vazio
 Atributo Idade: inteiro e não poderá ser maior que 23 e menor que 70
 Atributo Especialidade: caractere e não poderá possuir especialização
em Ortopedia  */
    
CREATE TABLE IF NOT EXISTS medico
(
	crm VARCHAR(12) UNIQUE NOT NULL,
    nome VARCHAR(60) NOT NULL,
    idade INTEGER CHECK(idade < 23 and idade > 70),
    especialidade VARCHAR(20) CHECK(especialidade NOT LIKE '%Ortopedia%')
)DEFAULT CHARSET = utf8; 

-- answer of e-book for comparing
/* CREATE TABLE medicos
	(crm CHAR(15) NOT NULL UNIQUE,
	nome CHAR(100) NOT NULL,
	idade INTEGER CHECK(idade > 23 AND idade < 70),
	especialidade CHAR(50) CHECK(especialidade NOT LIKE
	'%ORTOPEDIA%') */
-- pag 27