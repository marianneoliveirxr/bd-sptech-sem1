-- 1. Crie o banco de dados chamado ARENA_PERFORMANCE.
create database ARENA_PERFORMANCE;

-- 2. Coloque o banco ARENA_PERFORMANCE em uso.
use ARENA_PERFORMANCE;

-- 3. Crie uma tabela chamada modalidades apenas com nome (VARCHAR(45)). Não defina PK
create table modalidades(
	nome varchar(45)
);

-- 4. Crie a tabela atletas com nome (VARCHAR(100)) e id_modalidade (INT)
create table atletas(
	nome varchar(100),
    id_modalidade int
);

-- 5. Altere a tabela modalidades para adicionar uma Chave Primária coluna id. 
ALTER TABLE modalidades ADD COLUMN id int primary key;
desc modalidades;

-- 6. Configure a coluna id da tabela modalidades para ser AUTO_INCREMENT, iniciando a partir do número 100. 


-- 7. Adicione uma Chave Primária na coluna id_atleta da tabela atletas. 
ALTER TABLE atletas ADD COLUMN id_atleta INT PRIMARY KEY auto_increment;

-- 8. Na tabela atletas, torne a coluna nome obrigatória (NOT NULL). 
ALTER TABLE atletas MODIFY COLUMN nome varchar(100) NOT NULL;

-- 9. Adicione uma coluna data_cadastro na tabela atletas com o valor padrão sendo a data e hora  
ALTER TABLE atletas ADD COLUMN data_cadastro DATETIME DEFAULT current_timestamp;

-- 10. Adicione a coluna email com 100 posições na tabela atletas
ALTER TABLE atletas ADD COLUMN email varchar(100);

-- 11. Adicione a coluna cpf CHAR(11) na tabela atletas, garantindo que ela seja ÚNICA.
ALTER TABLE atletas ADD COLUMN cpf CHAR(11) UNIQUE;
desc atletas;

-- 12. Altere o tamanho da coluna nome na tabela modalidades para 100 posições
ALTER TABLE modalidades MODIFY COLUMN nome varchar(100);

-- 13. Renomeie a coluna id da tabela modalidades para id_modalidade.  
ALTER TABLE modalidades RENAME COLUMN id to id_modalidade;

-- 14. Adicione uma coluna chamada status que aceite apenas os valores 'Ativo' ou 'Inativo'. 
ALTER TABLE modalidades ADD COLUMN status varchar(15) 
check(status in ('Ativo', 'Inativo'));

-- 15. Remova a coluna data_cadastro da tabela atletas.  
ALTER TABLE atletas DROP COLUMN data_cadastro;

-- 16. Adicione uma coluna genero (CHAR(1)) na tabela atletas. 
ALTER TABLE atletas ADD COLUMN genero CHAR(1);

-- 17. Crie uma tabela treinadores com id_treinador (PK), nome e experiencia_anos (INT).
CREATE TABLE treinadores (
	id_treinador int primary key auto_increment,
    nome VARCHAR(100),
    experiencia_anos INT
);

-- 19. Adicione as  colunas, salario inicial e salario atual na tabela treinadores.
ALTER TABLE treinadores ADD COLUMN salario_inicial DECIMAL(10,2),
						ADD COLUMN salario_atual DECIMAL(10,2);
desc treinadores;

-- 20. Altere a tabela treinadores para que os salario não possam ser menor que zero.
ALTER TABLE treinadores ADD CONSTRAINT chk_salario_min CHECK (salario_inicial >= 0 AND salario_atual >= 0);

-- 21. Não permita que o salario atual seja menor que o salario inicial 
ALTER TABLE treinadores ADD CONSTRAINT chk_salario_prog
	CHECK (salario_atual >= salario_inicial);

-- 22. Renomeie a tabela modalidades para esportes.
RENAME TABLE modalidades to esportes;

-- 23. Renomeie a tabela atletas para membros.  
RENAME TABLE atletas to membros;

-- 24.  Altere o nome da coluna id_modalidade na tabela membros para id_esporte. 
ALTER TABLE membros RENAME COLUMN id_modalidade to id_esporte;

-- 25. Crie um índice para a coluna nome na tabela membros para acelerar buscas.
CREATE INDEX ix_nome ON membros(nome);

-- 26. Insira um treinador sem informar colunas
INSERT INTO treinadores VALUES(DEFAULT, 'Alberto Gomes', 4, 1500.00, 2500.00);


-- 27. Insira três esportes de uma vez
alter table esportes MODIFY COLUMN id_modalidade int auto_increment, auto_increment = 100;
truncate table esportes;
SELECT * FROM esportes;
desc esportes;
INSERT INTO esportes VALUES ('Ginastica', null, 'Ativo'),
							('Judo', null, 'Ativo'),
                            ('Taekondo', null, 'Inativo');
                            
-- 28. Insira um membro sem informar colunas
SELECT * FROM esportes;
desc membros;
INSERT INTO membros VALUES ('Marcelo', 100, null, 'marcelo@sptech.school', '27384568921', 'M');

-- 29. Insira dois membros vinculados ao esporte 101
INSERT INTO membros VALUES ('Julia', 101, null, 'julia@sptech.school', '28374291823', 'F'),
							('Fernanda', 101, null, 'fernanda@sptech.school', '98765432123', 'F');

-- 30. Insira um treinador apenas com nome e experiencia
select * from treinadores;
desc treinadores;
INSERT INTO treinadores (nome, experiencia_anos) VALUES ('Daniel', 12);

-- 31. insira um esporte sem status definido. 
desc esportes;
INSERT INTO esportes (nome) VALUES ('Peteca');

-- 32. insira um membro apenas com nome
desc membros;
INSERT INTO membros (nome) VALUES ('Wilson');

-- 33. insira treinador com salario_atual maior que salario_inicial
select * from treinadores;
INSERT INTO treinadores (nome, experiencia_anos, salario_inicial, salario_atual) VALUES
('Gislayndo', 30, 1000.00, 30000.00);

-- 34. insira membro com id_treinador null explicitamente
select * from treinadores;
INSERT INTO treinadores (id_treinador, nome, experiencia_anos, salario_inicial, salario_atual) VALUES
(null, 'Gislandir', 10, 1000.00, 10000.00);

-- 35. insira membro usando null ou default na posição da pk
desc membros;
INSERT INTO membros (nome, id_esporte, id_atleta, email, cpf, genero) VALUES 
('Pedro', 102, default, 'pedro@sptech.scholl', '97609009040', 'M');

-- 36. Atualize salario_atual onde experiencia_anos seja maior que 5 e menor 10
UPDATE treinadores
SET salario_atual = 35.000
WHERE experiencia_anos > 5 and experiencia_anos <10;

-- 37. atualize status para 'Ativo' onde id_modalidade seja maior 100 e menor 105
select * from esportes;
UPDATE esportes 
SET status = 'Ativo'
WHERE id_modalidade > 100 and id_modalidade < 105;

-- 38.  atualize genero para 'F' onde nome inicia com a letra P
select * from membros;
UPDATE membros
SET genero = 'F'
WHERE nome like 'P%';

-- 39. atualize salario_atual onde salario_atual > 8000
select * from treinadores;
UPDATE treinadores
SET salario_atual = 5000
WHERE salario_atual > 8000;

-- 40. atualize experiencia_anos para 20 onde experiencia_anos < 3
select * from treinadores;
UPDATE treinadores 
SET experiencia_anos = 20
WHERE experiencia_anos < 3;

-- 41. atualize id_esporte para 100 onde id_esporte seja 101 ou 102
select * from membros;
UPDATE membros 
SET id_esporte = 100
WHERE id_esporte = 101 and id_esporte = 102;

-- 42. atualize email onde id_atleta esteja entre 1 e 10.
UPDATE membros 
SET email = 'fulano@sptech.school'
WHERE id_atleta between 1 and 10;

-- 43. atualize status para 'Inativo' onde nome igual a Boxe ou Karate
select * from esportes;
INSERT INTO esportes (nome, status) VALUES 
('Boxe', 'Ativo'),
('Volei', 'Ativo');
UPDATE esportes
SET status = 'Inativo'
WHERE nome = 'Boxe';

-- 44. aumente salario_atual onde experiencia_anos > 10 and salario_atual < 9000.
select * from treinadores;
UPDATE treinadores 
SET salario_atual = 9000.00
WHERE experiencia_anos > 10 and salario_atual < 9000;

-- 45. atualize gênero para 'M' onde nome contenha Silva.
select * from membros;
INSERT INTO membros (nome, id_esporte, id_atleta, email, cpf, genero) VALUES 
('Arthur Silva', 102, default, 'arthur.silva@sptech.school', '87436236032', 'F' );
UPDATE membros 
SET genero = 'M'
WHERE nome like '%Silva%';

-- 46. atualize email onde genero = 'F' ou genero = 'M'
select * from membros;
UPDATE membros
SET email = 'ciclano@sptech.school'
WHERE genero = 'F' OR genero = 'M';

-- 47. atualize salario_atual onde salario_inicial entre 3000 e 6000
select * from treinadores;
UPDATE treinadores 
SET salario_atual = 6500
WHERE salario_inicial between 3000 and 6000;

-- 48. atualize status para 'Ativo' onde nome contenha  a letra i
select * from esportes;
UPDATE esportes
SET status = 'Ativo'
WHERE nome like '%i%';

-- 49. atualize id_treinador para 1 onde id_treinador for nulo
UPDATE treinadores 
SET id_treinador = 1
WHERE id_treinador = null;

-- 50. atualize salario_atual onde experiencia_anos > 5 or salario_atual < 4000.
UPDATE treinadores 
SET salario_atual = 6000
WHERE experiencia_anos > 5 or salario_atual < 4000;

-- 51. atualize experiencia_anos onde nome contenha a letra M
UPDATE treinadores 
SET experiencia_anos = 8
WHERE nome like '%M%';

-- 52. atualize id_esporte para nulo onde id_esporte > 105
desc membros;
UPDATE membros
SET id_esporte = null
WHERE id_esporte > 105;

-- 53. atualize status para 'Inativo' onde id_modalidade > 110. 
desc esportes;
UPDATE esportes
SET status = 'Inativo'
WHERE id_modalidade > 110;

-- 54. atualize salario_atual onde salario_atual esteja no intervalo 4000 e 7000
SELECT * FROM treinadores;


-- 55. atualize email para os nome Diego Torres , Larissa Gomes, o email deve ser o nome mais ‘@sptech.school’. 
-- 56. Liste o nome e o status dos esportes, exibindo o nome da coluna nome como modalidade. 
-- 57. Liste o nome dos membros e o email, exibindo o email com o alias correio_eletronico. 
-- 58.
-- 59.
-- 60.
-- 61.
-- 62.
-- 63.
-- 64.