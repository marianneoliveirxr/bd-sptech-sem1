use aula_4;
-- Exemplo de tabela criando o indice após
CREATE TABLE Estado (
	id INT PRIMARY KEY AUTO_INCREMENT,
	sigla CHAR(2),
	nome VARCHAR(50)
);

INSERT INTO Estado(sigla, nome) VALUES
				  ('AC', 'Acre'),
                  ('AL', 'Alagoas'),
                  ('AP', 'Amapá'),
                  ('AM', 'Amazonas'),
                  ('BA', 'Bahia'),
                  ('CE', 'Ceará'),
                  ('DF', 'Distrito Federal'),
                  ('ES', 'Espírito Santo'),
                  ('GO', 'Goiás'),
                  ('MA', 'Maranhão'),
                  ('MT', 'Mato Grosso'),
                  ('MS', 'Mato Grosso do Sul'),
                  ('MG', 'Minas Gerais'),
                  ('PA', 'Pará'),
                  ('PB', 'Paraíba'),
                  ('PR', 'Paraná'),
                  ('PE', 'Pernambuco'),
                  ('PI', 'Piauí'),
                  ('RJ', 'Rio de Janeiro'),
                  ('RN', 'Rio Grande do Norte'),
                  ('RS', 'Rio Grande do Sul'),
                  ('RO', 'Rondônia'),
                  ('RR', 'Roraima'),
                  ('SC', 'Santa Catarina'),
                  ('SP', 'São Paulo'),
                  ('SE', 'Sergipe'),
                  ('TO', 'Tocantins');

explain
select * from Estado where sigla = 'PE';

create index ix_01 on Estado(sigla);

INSERT INTO Estado(sigla, nome) 
VALUES ('PE', 'Pernambuco'),
       ('PE', 'Pernambuco');
       
select * from Estado where sigla = 'PE';

explain
select * from Estado where sigla = 'PE';

drop index ix_01 on Estado;

create unique index ix_01 on Estado(sigla);

select * from Estado where sigla = 'PE';

update Estado set sigla = null where id in (28,29);

update Estado set sigla = 'PE' where id in (28,29);

-- trabalhando com indice
drop table estado;

CREATE TABLE Estado (
	id INT PRIMARY KEY AUTO_INCREMENT,
	sigla CHAR(2),
	nome VARCHAR(50),
    key ix_estado(sigla)
);

INSERT INTO Estado(sigla, nome) VALUES
				  ('AC', 'Acre'),
                  ('AL', 'Alagoas'),
                  ('AP', 'Amapá'),
                  ('AM', 'Amazonas'),
                  ('BA', 'Bahia'),
                  ('CE', 'Ceará'),
                  ('DF', 'Distrito Federal'),
                  ('ES', 'Espírito Santo'),
                  ('GO', 'Goiás'),
                  ('MA', 'Maranhão'),
                  ('MT', 'Mato Grosso'),
                  ('MS', 'Mato Grosso do Sul'),
                  ('MG', 'Minas Gerais'),
                  ('PA', 'Pará'),
                  ('PB', 'Paraíba'),
                  ('PR', 'Paraná'),
                  ('PE', 'Pernambuco'),
                  ('PI', 'Piauí'),
                  ('RJ', 'Rio de Janeiro'),
                  ('RN', 'Rio Grande do Norte'),
                  ('RS', 'Rio Grande do Sul'),
                  ('RO', 'Rondônia'),
                  ('RR', 'Roraima'),
                  ('SC', 'Santa Catarina'),
                  ('SP', 'São Paulo'),
                  ('SE', 'Sergipe'),
                  ('TO', 'Tocantins');

INSERT INTO Estado(sigla, nome) 
VALUES ('PE', 'Pernambuco'),
       ('PE', 'Pernambuco');
       
-- trabalhando com unique
drop table estado;

CREATE TABLE Estado (
	id INT PRIMARY KEY AUTO_INCREMENT,
	sigla CHAR(2),
	nome VARCHAR(50),
    unique uk_estado(sigla)
);

INSERT INTO Estado(sigla, nome) VALUES
				  ('AC', 'Acre'),
                  ('AL', 'Alagoas'),
                  ('AP', 'Amapá'),
                  ('AM', 'Amazonas'),
                  ('BA', 'Bahia'),
                  ('CE', 'Ceará'),
                  ('DF', 'Distrito Federal'),
                  ('ES', 'Espírito Santo'),
                  ('GO', 'Goiás'),
                  ('MA', 'Maranhão'),
                  ('MT', 'Mato Grosso'),
                  ('MS', 'Mato Grosso do Sul'),
                  ('MG', 'Minas Gerais'),
                  ('PA', 'Pará'),
                  ('PB', 'Paraíba'),
                  ('PR', 'Paraná'),
                  ('PE', 'Pernambuco'),
                  ('PI', 'Piauí'),
                  ('RJ', 'Rio de Janeiro'),
                  ('RN', 'Rio Grande do Norte'),
                  ('RS', 'Rio Grande do Sul'),
                  ('RO', 'Rondônia'),
                  ('RR', 'Roraima'),
                  ('SC', 'Santa Catarina'),
                  ('SP', 'São Paulo'),
                  ('SE', 'Sergipe'),
                  ('TO', 'Tocantins');

INSERT INTO Estado(sigla, nome) 
VALUES ('PE', 'Pernambuco'),
       ('PE', 'Pernambuco');