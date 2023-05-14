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
NumPedido bigint not null auto_increment,      			#COLUNA 1 - NumPedido armazena de forma automatica uma sequencia para numero do pedido
DataPedido datetime not null,                 			#COLUNA 2 - DataPedido tipo data e tempo
ValorTotal numeric(10,2) not null,             			#COLUNA 3 - ValorTotal (10,2) numero decimal com 2 casas decimais
CodFunc_FK bigint not null,                         	#COLUNA 4 - CodFunc_FK recebe a variavel estrangeira da tabela FUNCIONARIOS COLUNA 1 - CodFunc
primary key(NumPedido),                                 #COLUNA 1 - NumPedido PRIMARY KEY   
foreign key (CodFunc_FK) references funcionarios (CodFunc) #COLUNA 4 - CodFunc_FK FOREIGN recebe a variavel estrangeira da tabela FUNCIONARIOS COLUNA 1 - CodFunc
);

show tables;

describe funcionarios;

describe pedidos;