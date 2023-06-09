#AULA2_BDCA_prof_Andre_SCRIPT_Exemplo1
#SQL - STRUCTURE QUERY LANGUAGE
# CRIE UMA TABELA PARA ABRIGAR OS SEGUINTES DADOS, TREINE O CREATE, SHOW, DESCRIBE E DEPOIS O DROP:
# COLUNAS ID, NAME, DEPARTAMENT, BIRTH
# REGISTROS DA TABELA
# ID: 1 / Name: Maria Gloria / Departament: CS / Birth: 1994-03-12
# ID: 2 / Name: Jhon Smith   / Departament: IT / Birth: 1993-02-07
# ID: 3 / Name: Gal Rao      / Departament: CS / Birth: 1992-09-11
# ID: 4 / Name: Jakey Smith  / Departament: EC / Birth: 1990-08-31
# ID: 5 / Name: Rama Saho    / Departament: IT / Birth: 1994-12-09
# ID: 6 / Name: Maria Gaga   / Departament: EC / Birth: 1993-10-09

#PASSO 1 - criar uma base de dados com comando CREATE DABASE (nome); *Ctrl + ENTER executa e clique em atualizar na arvore SCHEMAS para atualizar
create database 1aula_funcionarios;

#PASSO 2 - acessar o banco de dados com comando USE (nome);
use 1aula_funcionarios;

#PASSO 3 - criar uma tabela com comando CREATE TABLE (nome) e inserir as colunas com os tipo de entradas para cada variavel;
create table registro(                  #Tabela com titulo de registroFunc
idFunc bigint auto_increment,           #Coluna idFunc com auto_increment para gerar automatico valor de registro
nameFunc varchar(150) not null,         #Coluna nameFunc para registro do nome de funcionarios
departamentFunc varchar(2) not null,    #Coluna departamentFunc para regsitro do departamento do funcionario
birthFunc date not null,			    #Coluna birthFunc para registro da data de nascimento do funcionario
primary key (idFunc)                    #Coluna idFunc é a chave primaria para relacionar com outra tabela utilizando com foreign
);

#PASSO 4 - Apresentar tabela comando SHOW TABLES
show tables;

#PASSO 5 - Inserir informações na tabela comando INSERT INTO (nome_tabela) VALUES ("INFORMAÇÃO")
# ID: 1 / Name: Maria Gloria / Departament: CS / Birth: 1994-03-12
# ID: 2 / Name: Jhon Smith   / Departament: IT / Birth: 1993-02-07
# ID: 3 / Name: Gal Rao      / Departament: CS / Birth: 1992-09-11
# ID: 4 / Name: Jakey Smith  / Departament: EC / Birth: 1990-08-31
# ID: 5 / Name: Rama Saho    / Departament: IT / Birth: 1994-12-09
# ID: 6 / Name: Maria Gaga   / Departament: EC / Birth: 1993-10-09

insert into registro (nameFunc, departamentFunc, birthFunc) values ("Maria Gloria", "CS", "1994-03-12");
insert into registro (nameFunc, departamentFunc, birthFunc) values ("Jhon Smith", "IT", "1993-02-07");
insert into registro (nameFunc, departamentFunc, birthFunc) values ("Gal Rao", "CS", "1992-09-11");
insert into registro (nameFunc, departamentFunc, birthFunc) values ("Jakey Smith", "EC", "1990-08-31");
insert into registro (nameFunc, departamentFunc, birthFunc) values ("Rama Saho", "IT", "1994-12-09");
insert into registro (nameFunc, departamentFunc, birthFunc) values ("Maria Gaga", "EC", "1993-10-09");

#PASSO 6 - Mostrar a tabela com seus respectivos registros pelo comando SELECT * FROM (nome da tabela)
select * from registro;