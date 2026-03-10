CREATE USER marianne IDENTIFIED BY '12345';
show variables;

CREATE USER teste_02 IDENTIFIED BY '12345';
create database cco;
use cco;

create table grupo(
	id int primary key auto_increment,
    nome varchar(45)
);

-- CONCEDER PERMISSÃO
GRANT UPDATE, ALTER, SELECT, DROP ON cco.grupo TO teste_02 with grant option;
GRANT INSERT ON cco.grupo TO teste_02 with grant option;
GRANT DELETE ON cco.grupo TO teste_02 with grant option;

-- DELETAR PERMISSÃO
REVOKE INSERT ON cco.grupo FROM teste_02;