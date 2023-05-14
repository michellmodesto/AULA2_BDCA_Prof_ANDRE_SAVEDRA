##AULA2_BDCA_prof_Andre_SCRIPT_Exemplo4
#SQL - STRUCTURE QUERY LANGUAGE
# TABELAS - USUÁRIOS / TABELA - MEALS / TABELA - DAY

# 															TABELA - USUÁRIOS
#	id (int) PRIMARY KEY		/	User_Name VARCHAR(45)	/	User_Age INT (2)	/	User_Dob DATATIME	/	User_heigth DOUBLE	/	User_Weight	INT

#															TABELA - DAY
#	idDay DATE PRIMARY KEY		/	user_name VARCHAR(45)	/	User_ID INT FOREGEIN

# 															TABELA - MEALS
#	Meal_num INT	PRIMARY KEY	/	Calories INT	/	Fat INT		/	Carbohydrates INT	/	Fibre INTE	/	Protein	INT	/	Day_idDay DATE FOREGEIN / Day_user_ID INT PK FOREGEIN

#CRIAR BASE DE DADOS - NUTRITION
create database 2aula_nutrition;

#USAR BASE DE DADOS - NUTRITION
use 2aula_nutrition;

#CRIAR TABELA - USUÁRIOS
create table user(
idUser bigint not null auto_increment,		#COLUNA 1 - ID USUÁRIO
nameUser varchar(45) not null,				#COLUNA 2 - NOME USUÁRIO
ageUser bigint not null,					#COLUNA 3 - IDADE USUÁRIO
dobUser datetime not null default now(),	#COLUNA 4 - DATA DE CADASTRO DO USUÁRIO DIA E HORA
heightUser double not null,					#COLUNA 5 - ALTURA DO USUÁRIO
weightUser bigint not null,					#COLUNA 6 - PESO DO USÁRIO
primary key(idUser)                        	#COLUNA 1 - idUser PRIMARY KEY
);

select * from user;

#INSERIR DADOS DE USUARIOS NA TABELA - USUARIOS
insert into user (nameUser, ageUser, heightUser, weightUser, dobUser)
values ("João", 35, 1.7, 71, "2023-02-13 19:52:00" ); #"2023-02-13 19:52:00"

insert into user (nameUser, ageUser, heightUser, weightUser, dobUser)
values ("Francisco", 26, 1.85, 90, "2023-02-13 19:53:00");

insert into user (nameUser, ageUser, heightUser, weightUser, dobUser)
values ("Larissa", 20, 1.5, 63, "2023-02-13 19:54:00");

#CRIAR TABELA - DIA
create table day(
idDay bigint not null auto_increment,				#COLUNA 1 - ID DIA
day date not null,									#COLUNA 2 - DIA
user_fk bigint not null,							#COLUNA 3 - USUÁRIO foreign key *MESMO TIPO DE VARIAVEL BIGINT*
primary key(idDay),									#COLUNA 1 - idDay PRIMARY KEY
foreign key (user_fk) references  user (idUser)		#COLUNA 3 - USER_FK RECEBE VARIAVEL ESTRANGEIRA ID_USER DA TABELA USURARIOS
);

insert into day (day, user_FK)
values ("2023-02-13",2);

insert into day (day, user_FK)
values ("2023-02-11",1);

insert into day (day, user_FK)
values ("2023-02-11",3);

select* from day;

#CRIAR TABELA - MEALS
create table meals(									
idUser bigint not null auto_increment,				#COLUNA 1 - idUser 
calories int not null,								#COLUNA 2 - calories
fat int,											#COLUNA 3 - fat
carbohydrates int not null,							#COLUNA 4 - carbohydrates
fibre int,											#COLUNA 5 - fibre
protein int,										#COLUNA 6 - protein
day_FK bigint not null,								#COLUNA 7 - day_FK
primary key (idUser),								#COLUNA 1 - PRIMARY KEY DA TABELA MEALS
foreign key (day_FK) references day (idDay)			#COLUNA 7 RECEBE VARIAVEL ESTRANGEIRA  DA TABELA DAY (COLUNA 1 - idDay)
);

insert into meals (calories, fat, carbohydrates, fibre, protein, day_FK) 
values (170,150,250,120,360,3);

select * from meals
join day on  idDay = meals.day_fk
join user on day.user_fk = user.idUser;