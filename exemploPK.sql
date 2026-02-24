-- primeiros comandos - continuação
-- criar database
-- Etapa 1
create database aula_4;
-- colocar o database em uso
-- Etapa 2
use aula_4;
/*
criar a tabela de empresa 
onde o auto increment inicie a partir de 100
*/
-- Etapa 3  -  NOT NULL
-- drop table empresa

CREATE TABLE empresa (    
     id              INT auto_increment,    
     nome            VARCHAR(40) not null,
     representante   varchar(40),
     primary key chave(id)
) auto_increment=100;  -- parametro opcional, se não informado inicia em 1
-- inserir dados na tabela empresa
-- Etapa 4
insert into empresa (nome, representante) 
values ('Tivit', 'João'),
	   ('Accenture', 'José'),
	   ('Rappi', 'Marta'),
	   ('Raizen', 'Maria Alice'),
	   ('C6 Bank', 'Mariana'),
	   ('Banco Safra', 'Sandra'),
	   ('Deloitte', 'Giovanni'),
	   ('Elera', 'Vera'),
	   ('Sptech', 'Alessandro');

select * from empresa;

desc empresa;

-- apagar primary key
-- Quando a tabela tem auto increment deve-se retirar 
-- o auto_increment antes de apagar a PK
ALTER TABLE empresa MODIFY id INT NOT NULL;
desc empresa;

alter table empresa drop primary key;
desc empresa;
-- criando novamente a PK

alter table empresa add 
      constraint pk_empresa primary key(id);
      
desc empresa;
-- criando o auto incremente novamente

alter table empresa
     modify id INT NOT NULL AUTO_INCREMENT;
     
desc empresa;
-- alterando a sequencia do autoincrement

ALTER TABLE empresa AUTO_INCREMENT = 1000;

desc empresa;