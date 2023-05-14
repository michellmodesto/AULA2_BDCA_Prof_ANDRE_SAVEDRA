#AULA2_BDCA_prof_Andre_SCRIPT_Exemplo5
#SQL - STRUCTURE QUERY LANGUAGE

#TABELAS - FUNCIONARIOS / TABELA - PEDIDOS

# 						TABELA - FUNCIONARIOS
#	CodFunc (int) PRIMARY KEY		/	NomeFunc VARCHAR(45)

# 						TABELA - PEDIDOS
#	NumPedido (int) PRIMARY KEY		/	DataPedido DATETIME	/	ValorTotal NUMERIC (10,2) *Número decimal com duas casas /		CodFunc_FK (INT)

#CRIAR BASE DE DADOS 2aula_ecommerce
create database 2aula_ecommerce;

#USAR BASE DE DADOS - ecommerce
use 2aula_ecommerce;

#CRIAR TABELA - FUNCIONARIOS
create table funcionarios(                      
CodFunc bigint not null auto_increment,			#COLUNA 1 - CodFunc
NomeFunc varchar(45),							#COLUNA 2 - NomeFunc
primary key(CodFunc)							#COLUNA 1 CodFunc é a PRIMARY KEY QUE IRÁ RELACIONAR COM A TABELA PEDIDOS
);

select now();									#Carrega data e hora atual no sistema

#CRIA TABELA PEDIDOS
create table pedidos(
NumPedido bigint not null auto_increment,      			        #COLUNA 1 - NumPedido armazena de forma automatica uma sequencia para numero do pedido
DataPedido datetime not null,                 			        #COLUNA 2 - DataPedido tipo data e tempo
ValorTotal numeric(10,2) not null,             			        #COLUNA 3 - ValorTotal (10,2) numero decimal com 2 casas decimais
CodFunc_FK bigint not null,                                 #COLUNA 4 - CodFunc_FK recebe a variavel estrangeira da tabela FUNCIONARIOS COLUNA 1 - CodFunc
primary key(NumPedido),                                     #COLUNA 1 - NumPedido PRIMARY KEY   
foreign key (CodFunc_FK) references funcionarios (CodFunc)  #COLUNA 4 - CodFunc_FK FOREIGN recebe a variavel estrangeira da tabela FUNCIONARIOS COLUNA 1 - CodFunc
);

show tables;

describe funcionarios;

describe pedidos;

insert into funcionarios (NomeFunc) values ("Daniel Pinheiro");
insert into funcionarios (NomeFunc) values ("Luciano França");
insert into funcionarios (NomeFunc) values ("Alexandra Pinheiro");
insert into funcionarios (NomeFunc) values ("Júlia Pinheiro");
insert into funcionarios (NomeFunc) values ("Maria Rosa");

select * from funcionarios;

insert into pedidos (DataPedido,ValorTotal,CodFunc_FK) values ("2023-02-09 18:55:00",1500.00,1);
insert into pedidos (DataPedido,ValorTotal,CodFunc_FK) values ("2023-05-23 14:30:00",2300.00,2);

select * from pedidos;
