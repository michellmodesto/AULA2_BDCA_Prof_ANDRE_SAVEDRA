#AULA2_BDCA_prof_Andre_SCRIPT_Exemplo3
#NETFLIX, que permita selecionar um ator com os filmes que participou

#				TABELA - ACTOR
#			actor_id (int / primary key)	/ 	name	

#				TABELA - FILMS
#			film_id (int / primary key)	    / 	title (texto)	/   genere (texto)

#				TABELA - ACTOR_FILM_MAPPING
#			actor_id (int / Foregein) 		/ 	film_id (int / Foregein)    

#CRIAR UMA BASE DE DADOS - NOME 2AULA_NETFLIX
create database 2aula_netflix;

#USAR BASE DE DADOS CRIADA
use 2aula_netflix;

#CRIAR TABELAS ACTOR, FILMS E MAPPING_ACTOR_FILMS

#TABELA ACTOR - NOME DOS ATORES
create table actor(                         		#criar tabela ator,
idActor bigint not null auto_increment, 			#coluna IDActor numero inteiro e automatico,
name varchar(150) not null,							#coluna name datetype texto de tamanho 150, obrigatorio,
primary key (idActor)								#chave primaria de relacionamento (idActor),
);

#TABELA FILMS - TITULO E GENERO
create table films(									#criar tabela films,
idFilm bigint not null auto_increment,				#coluna "IdFilm" numero inteiro e automatico,
title varchar (150) not null,						#coluna "title" texto de tamanho 150, obrigatorio,
genre varchar (150) not null,						#coluna "genre" texto de tamanho 150, obrigatorio,
primary key (idFilm)								#chave primaria de relacionamento (idFilm)
);

#TABELA MAPPING_ACTOR_FILM - PARA FILTRA OS FILMES DE UM DETERMINADO ATOR
create table mapping_actor_film(					#criar tabela de relacionamento de ator e film
	id bigint not null auto_increment,				#coluna id para receber numero sequencial automatico
    actorFK bigint not null,						#coluna "actorFK" que ira receber a informacao da primary key tabela actor
    filmFK bigint not null,							#coluna "filmFK" que ira recever a informacao da primary key tabela films
    primary key(id),								#a coluna ID sera a coluna de primary key
    foreign key(actorFK) references actor(idActor),	#a coluna actorFK recebera a variavel estrangeira de referencia da tabela actor(idActor)
    foreign key(filmFK) references films(idFilm)	#a coluna filmFK recebera a variavel estrangeira de referencia da tabela films(idFilm)
    );

show tables; 										#apresenta as tabelas criadas dentro do database netflix

#INSERIR DADOS NAS TABELAS
#COMANDO - INSERT INTO tabelaA (colunaA) VALUES ("texto ou infomação")

insert into actor (name) values ("JOÃO DE ALMEIDA"); #inserir na table actor (coluna name) o valor ("JOÃO DE ALMEIDA");
insert into actor (name) values ("MARIA JOAQUINA");	 #inserir na table actor (coluna name) o valor ("MARIA JOAQUINA");
insert into actor (name) values ("JOSÉ ALENCAR");	 #inserir na table actor (coluna name) o valor ("JOSÉ ALENCAR");

#MOSTRAR A TABELA ACTOR COM AS INFORMACOES INSERIDAS
select * from actor;

#INSERIR MAIS DE UMA INFORMACAO NA MESMA LINHA DA TABELA

insert into films (title, genre) values ("AVENGERS","AÇÃO"); 			#inserir na table FILMS colunas (title, genre) os valors ("AVENGERS","AÇÃO");
insert into films (title, genre) values ("TOP GUN","AÇÃO");				#inserir na table FILMS colunas (title, genre) os valors ("TOP GUN","AÇÃO");
insert into films (title, genre) values ("ALERTA VERMELHO","AÇÃO");		#inserir na table FILMS colunas (title, genre) os valors ("ALERTA VERMELHO","AÇÃO");
insert into films (title, genre) values ("IT A COISA","TERROR");		#inserir na table FILMS colunas (title, genre) os valors ("IT A COISA","TERROR");

#MOSTRAR A TABELA ACTOR COM AS INFORMACOES
select * from films;

#INSERIR MAIS DE UMA INFORMACAO NA MESMA LINHA DA TABELA

insert into mapping_actor_film (actorFK, filmFK) values (1,3);		#inserir na table mapping_actor_film colunas (filmFK, actorFK) os valores ("1","3");
insert into mapping_actor_film (actorFK, filmFK) values (1,1);		#inserir na table mapping_actor_film colunas (filmFK, actorFK) os valores ("1","1");
insert into mapping_actor_film (actorFK, filmFK) values (2,1);		#inserir na table mapping_actor_film colunas (filmFK, actorFK) os valores ("2","1");
insert into mapping_actor_film (actorFK, filmFK) values (2,2);		#inserir na table mapping_actor_film colunas (filmFK, actorFK) os valores ("2","2");
insert into mapping_actor_film (actorFK, filmFK) values (3,3);		#inserir na table mapping_actor_film colunas (filmFK, actorFK) os valores ("3","3");

#FALHOU PORQUE NA LISTA DE ATORES NÂO TEM INFORMAÇÃO NA IdActor "4"
insert into mapping_actor_film (actorFK, filmFK) values (4,2);		#inserir na table mapping_actor_film colunas (filmFK, actorFK) os valores ("4","2");

#MOSTRAR A TABELA ACTOR COM AS INFORMACOES
select * from mapping_actor_film;

select * from mapping_actor_film								#selecionou os dados da tabela mapping_actor_film
join actor on mapping_actor_film.actorFK = actor.idActor		#JOIN tabela actor na tabela mapping_actor_film igual texto coluna actor.idActor
join films on mapping_actor_film.filmFK = films.idFilm;			#JOIN tabela films na tabela mapping_actor_film igual texto coluna films.idFilm
