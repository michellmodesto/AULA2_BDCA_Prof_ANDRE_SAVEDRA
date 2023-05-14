#AULA2_BDCA_prof_Andre_SCRIPT_Exemplo2
#SQL - STRUCTURE QUERY LANGUAGE
# CRIE UMA TABELA PARA ABRIGAR OS SEGUINTES DADOS, TREINE O CREATE, SHOW, DESCRIBE E DEPOIS O DROP:
# COLUNAS ID, NAME, DEPARTAMENT, BIRTH
#             TABELA - FUNCIONARIOS                                     					TABELA - DEPARTAMENTOS
#  Colunas - ID   /       NAME         /       BIRTH        /   DEPARTAMENT ID 		  	       ID   /    DEPARTAMENTS        
		  # ID: 1 / Name: Maria Gloria / Birth: 1994-03-12	/		 1							1	/		CS
          # ID: 2 / Name: Jhon Smith   / Birth: 1993-02-07	/		 2							2	/		IT
		  # ID: 3 / Name: Gal Rao      / Birth: 1992-09-11	/		 1							3	/		EC
		  # ID: 4 / Name: Jakey Smith  / Birth: 1990-08-31	/		 3
		  # ID: 5 / Name: Rama Saho    / Birth: 1994-12-09	/		 2
		  # ID: 6 / Name: Maria Gaga   / Birth: 1993-10-09	/		 3
          
          # A tabela Funcionarios recebe a informação departamento pela Foregein (variavel estrangeira) da tabela de departamentos PK coluna id
#CRIAR BASE DE DADOS          
create database 1aula_funcionarios_2;

#USAR BASE DE DADOS
use 1aula_funcionarios_2;

#CRIAR TABELA "DEPARTAMENTOS" COM COLUNAS
create table departament(
idDepartament bigint not null auto_increment,
nameDepartament varchar(200) not null,
primary key (idDepartament)
);

#INSERIR INFORMAÇÕES NA TABELA DEPARTAMENT
insert into departament (nameDepartament) values ("CS");
insert into departament (nameDepartament) values ("IT");
insert into departament (nameDepartament) values ("EC");

#EXIBIR TABELA DEPARTAMENT COM AS INFORMAÇÔES INSERIDAS
select * from departament;

#CRIAR TABELA "REGISTROS" COM COLUNAS
create table registros(
idRegistro bigint  not null auto_increment,
nameFunc varchar(100) not null,
birthFunc date not null,
departament_ID_FK bigint not null,
primary key(idRegistro),

#Departament_ID_FK receberá a variavel estrangeira da tabela referencia departament (coluna idDepartament)
foreign key (departament_ID_FK) references departament (idDepartament) 
);

#INSERIR OS REGISTROS DOS FUNCIOÁRIOS
# ID: 1 / Name: Maria Gloria  / Birth: 1994-03-12  / 	1
# ID: 2 / Name: Jhon Smith    / Birth: 1993-02-07  /	2
# ID: 3 / Name: Gal Rao       / Birth: 1992-09-11  /	1
# ID: 4 / Name: Jakey Smith   / Birth: 1990-08-31  /	3
# ID: 5 / Name: Rama Saho     / Birth: 1994-12-09  /	2
# ID: 6 / Name: Maria Gaga    / Birth: 1993-10-09  /	3

insert into registros (nameFunc, birthFunc, departament_ID_FK) values ("Maria Gloria", "1994-03-12", "1");
insert into registros (nameFunc, birthFunc, departament_ID_FK) values ("Jhon Smith", "1993-02-07", "2");
insert into registros (nameFunc, birthFunc, departament_ID_FK) values ("Gal Rao", "1992-09-11", "1");
insert into registros (nameFunc, birthFunc, departament_ID_FK) values ("Jakey Smith", "1990-08-31", "3");
insert into registros (nameFunc, birthFunc, departament_ID_FK) values ("Rama Saho", "1994-12-09", "2");
insert into registros (nameFunc, birthFunc, departament_ID_FK) values ("Maria Gaga", "1993-10-09", "3");

#EXIBIR TABELA REGISTROS
select * from registros;

#JUNTAR TABELA COM INFORMAÇÕES SIMILARES
select * from registros r join departament d 
on r.departament_ID_FK = d.idDepartament;
