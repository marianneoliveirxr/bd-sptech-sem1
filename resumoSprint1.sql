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
SET SQL_SAFE_UPDATES = 0;
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
desc treinadores;
UPDATE treinadores
SET salario_atual = 5000
WHERE salario_atual between 4000 and 7000;


-- 55. atualize email para os nome Diego Torres , Larissa Gomes, o email deve ser o nome mais ‘@sptech.school’
desc membros;

INSERT INTO membros (nome, id_esporte, id_atleta, email, cpf, genero) VALUES 
('Diego Torres', 103, null, 'diegotorres@gmail.com', '38684030001', 'M'),
('Larissa Gomes', 104, null, 'larissagomes@gmail.com', '63109896001', 'F');

UPDATE membros 
SET email = 'diegotorres@sptech.school'
WHERE nome = 'Diego Torres';

UPDATE membros 
SET email = 'larissagomes@sptech.school'
WHERE nome = 'Larissa Gomes';

SELECT * FROM membros;
 
-- 56. Liste o nome e o status dos esportes, exibindo o nome da coluna nome como modalidade. 
SELECT nome AS modalidade, status FROM esportes;

-- 57. Liste o nome dos membros e o email, exibindo o email com o alias correio_eletronico. 
SELECT nome, email AS correio_eletronico FROM membros;

-- 58. Liste o nome dos treinadores e o salário atual com alias salario
SELECT nome, salario_atual AS salario FROM treinadores;

-- 59. Liste nome e cpf dos membros cujo gênero seja igual a 'F'.
SELECT nome, cpf FROM membros WHERE genero = 'F';

-- 60. Liste nome e experiência dos treinadores cuja experiência seja maior que 10 anos
SELECT nome, experiencia_anos FROM treinadores WHERE experiencia_anos > 10;
desc treinadores;

-- 61. Liste nome e salário atual dos treinadores cujo salário atual seja menor que 4000
SELECT nome, salario_atual FROM treinadores WHERE salario_atual < 4000;

-- 62. Liste os membros cujo id_esporte esteja entre 100 e 105.
SELECT nome FROM membros WHERE id_esporte between 100 and 105;

-- 63. Liste os treinadores cuja experiência esteja entre 5 e 15 anos
SELECT nome FROM treinadores WHERE experiencia_anos between 5 and 15;

-- 64. Liste os esportes cujo nome comece com a letra 'B'.
SELECT nome FROM esportes WHERE nome LIKE 'B%';

-- 65. Liste os membros cujo nome termine com 'Silva'.
SELECT nome FROM membros WHERE nome LIKE '%Silva';

-- 66. Liste os membros cujo nome contenha a palavra 'Junior'.
INSERT INTO membros (nome, id_esporte, id_atleta, email, cpf, genero) 
VALUES ('Junior Gabriel', 104, null, 'juniorgabriel@sptech.school', '97648500060', 'M');

-- 67. Liste os esportes cujo status seja diferente de 'Ativo'.
SELECT * FROM esportes WHERE status != 'Ativo';


-- 68. Liste os treinadores cujo salário atual seja maior que 5000 e experiência maior que 8
-- anos.

SELECT * FROM treinadores WHERE salario_atual > 5000 and experiencia_anos > 8;

-- 69. Liste os membros cujo gênero seja 'F' ou id_esporte seja 101.
SELECT * FROM membros WHERE genero = 'F' OR id_esporte = 101;

-- 70. Liste os membros cujo gênero não seja 'M'
SELECT * FROM membros WHERE genero != 'M';

-- 71. Liste os membros cujo id_esporte esteja na lista (100, 101, 102).
SELECT * FROM membros WHERE id_esporte IN (100, 101, 102);

-- 72. Liste os treinadores cujo nome esteja na lista ('Carlos Silva', 'Marcelo Dias').
select * from treinadores;

INSERT INTO treinadores (nome, experiencia_anos, salario_inicial, salario_atual)
VALUES ('Carlos Silva', 4, 1300.00, 4000.00);

INSERT INTO treinadores (nome, experiencia_anos, salario_inicial, salario_atual)
VALUES ('Marcelo Dias', 8, 1200.00, 9000.00);

SELECT * FROM treinadores WHERE nome IN ('Carlos Silva','Marcelo Dias');

-- 73. Liste os membros cujo email seja nulo
SELECT * FROM membros WHERE email = null;

-- 74. Liste os membros cujo id_treinador não seja nulo.
SELECT * FROM membros WHERE id_treinador != null;

-- 75. Liste nome e salário atual dos treinadores, exibindo 'Sem salário definido' quando o
-- salário atual for nulo.

SELECT nome, IFNULL(salario_atual, 'Sem salário definido') AS salario_atual FROM treinadores;

-- 76. Liste nome e cpf dos membros concatenando ambos em uma única coluna chamada identificacao.
SELECT CONCAT(nome, ' ', cpf) AS identificacao FROM membros;

-- 77. Liste nome e salário atual dos treinadores, exibindo uma coluna chamada
-- situacao_salarial, onde:
-- 'Alto' para salário > 8000
-- 'Médio' para salário entre 4000 e 8000
-- 'Baixo' para salário < 4000

SELECT nome, salario_atual, 
CASE WHEN salario_atual > 8000 THEN 'Alto'
WHEN salario_atual between 4000 and 8000 THEN 'Medio'
ELSE 'Baixo' 
END AS situacao_salarial 
FROM treinadores;

-- 78. Liste nome e status dos esportes, exibindo 'Disponível' quando status for 'Ativo' e
-- 'Indisponível' quando for 'Inativo'.
SELECT nome, status,
CASE WHEN status = 'Ativo' THEN 'Disponível'
	WHEN status = 'Inativo' THEN 'Indisponível'
END AS situacao_status
FROM esportes;

-- 79. Liste nome dos membros e uma coluna chamada possui_treinador, indicando 'Sim'
-- quando id_treinador não for nulo e 'Não' quando for nulo.

-- 80. Liste nome e salário atual dos treinadores cujo salário esteja entre 3000 e 7000 e
-- experiência maior que 5 anos.

SELECT nome, salario_atual FROM treinadores 
WHERE salario_atual between 3000 and 7000 
and experiencia_anos > 5;

-- 81. Liste nome dos membros cujo nome comece com 'A' e gênero seja 'F'
SELECT nome FROM membros WHERE nome LIKE 'A%' and genero = 'F';

-- 82. Liste nome dos membros cujo nome comece com 'A' ou 'B'.
SELECT nome FROM membros WHERE nome LIKE 'A%' or 'B%';

-- 83. Liste nome dos membros cujo nome não comece com 'C'.
SELECT nome FROM membros WHERE nome != 'C%';

-- 84. Liste nome e experiência dos treinadores cuja experiência seja maior que 5 e menor que 15
SELECT nome, experiencia_anos FROM treinadores WHERE experiencia_anos between 5 and 15;

-- 85. Liste nome e salário atual dos treinadores cujo salário atual seja maior que 5000 ou
-- experiência maior que 12 anos.
SELECT nome, salario_atual FROM treinadores WHERE salario_atual > 5000 or experiencia_anos > 12;

-- 86. Liste nome e cpf dos membros cujo cpf esteja entre '20000000000' e '50000000000'.
SELECT nome, cpf FROM membros WHERE cpf between 20000000000 and 50000000000;

-- 87. Liste nome dos membros cujo id_esporte não esteja na lista (100, 101).
SELECT nome FROM membros WHERE id_esporte != 100 OR 101;

-- 88. Liste nome e status dos esportes cujo nome contenha a letra 'e' e status seja 'Ativo'.
SELECT nome, status FROM esportes WHERE nome LIKE '%E%' and status = 'Ativo';

-- 89. Liste nome dos membros cujo email não seja nulo e gênero seja 'M'.
SELECT nome FROM membros WHERE email != null and genero = 'M';

-- 90. Liste nome e salário atual dos treinadores cujo salário atual seja diferente do salário inicial.
SELECT nome, salario_atual FROM treinadores WHERE salario_atual != salario_inicial;

-- 91. Liste nome dos membros e concatene o texto ' - Atleta' ao final do nome
SELECT CONCAT(nome, ' - Atleta') AS nome FROM membros;

-- 92. Liste nome dos membros e uma coluna chamada tipo_genero, onde:
-- 'Masculino' para 'M'
-- 'Feminino' para 'F'
-- 'Não informado' quando for nulo

SELECT nome,
CASE WHEN genero = 'M' THEN 'Masculino'
	WHEN genero = 'F' THEN 'Feminino'
	WHEN genero = NULL THEN 'Não informado'
END AS tipo_genero 
FROM membros;


-- 93. Liste nome dos treinadores e uma coluna chamada faixa_experiencia, classificando:
-- 'Iniciante' até 5 anos
-- 'Intermediário' entre 6 e 10
-- 'Avançado' acima de 10
SELECT nome,
CASE WHEN experiencia_anos <= 5 THEN 'Iniciante'
	WHEN experiencia_anos between 6 and 10 THEN 'Intermediário'
    ELSE 'Avançado'
END AS faixa_experiencia
FROM treinadores;

-- 94. Liste nome e salário atual dos treinadores exibindo 0 quando o salário for nulo
SELECT * FROM treinadores;
INSERT INTO treinadores (nome, experiencia_anos, salario_inicial, salario_atual) VALUES
('Roberta Alves', 8, 1300.00, null);
SELECT nome, IFNULL(salario_atual, 0) AS salario_atual FROM treinadores;

-- 95. Liste nome dos membros cujo nome contenha a letra 'a' e não contenha a letra 'z'
SELECT * FROM membros;
INSERT INTO membros VALUES ('Aldalberto Zanata', 104, null, 'adalbertozanata@sptech.school', '9876542539', 'M');
SELECT nome FROM membros WHERE nome LIKE '%A%' and nome != '%Z%';

-- 96. Liste nome dos membros cujo id_atleta seja maior que 10 e menor que 50.


-- 97. Liste nome e salário atual dos treinadores cujo salário atual esteja entre 4000 e 9000 e não seja igual a 7000.
-- 98. Liste nome e status dos esportes cujo status seja 'Ativo' e id_modalidade maior que100.
-- 99. Liste nome dos membros cujo nome esteja na lista ('Ana Paula', 'Lucas Lima', 'Diego Torres').
-- 100. Liste nome e cpf dos membros cujo cpf não esteja na lista('11122233344','55566677788').
-- 101. Liste nome dos treinadores cujo nome comece com 'M' e experiência maior que 5.
-- 102. Liste nome dos membros cujo gênero seja 'F' e id_esporte entre 100 e 110.
-- 103. Liste nome e salário atual dos treinadores cujo salário atual seja maior que 3000 e
-- menor que 10000 e experiência diferente de 7.
-- 104. Liste nome dos esportes cujo nome termine com 'o' ou termine com 'e'.
-- 105. Liste nome dos membros e crie uma coluna chamada resumo, concatenando nome,
-- cpf e genero separados por hífen.
-- 106. Liste nome e salário atual dos treinadores cujo salário seja maior que 5000 e
-- experiência maior que 5, ou cujo salário seja maior que 8000 independentemente da
-- experiência.
-- 107. Liste nome dos membros cujo gênero seja 'F' e id_esporte esteja entre 100 e 105, ou
-- cujo nome comece com 'L'.
-- 108. Liste nome e cpf dos membros cujo cpf esteja entre dois valores e gênero seja 'M',
-- mas exclua aqueles cujo nome termine com 'Silva'.
-- 109. Liste nome dos esportes cujo status seja 'Ativo' e id_modalidade maior que 100, ou
-- cujo nome contenha a letra 'a' e status não seja 'Inativo'.
-- 110. Liste nome e salário atual dos treinadores cuja experiência esteja entre 5 e 15 anos e
-- salário maior que 4000, ou cuja experiência seja maior que 20.
-- 111. Liste nome dos membros cujo id_treinador não seja nulo e (gênero seja 'F' ou nome
-- comece com 'A').
-- 112. Liste nome dos membros cujo id_esporte esteja na lista (100,101) e gênero seja 'M',
-- ou cujo email seja nulo.
-- 113. Liste nome e salário atual dos treinadores cujo salário atual seja maior que o salário
-- inicial e experiência diferente de 10, e cujo nome não comece com 'R'.
-- 114. Liste nome dos esportes cujo nome contenha a letra 'e' e não contenha a letra 'i', ou
-- cujo status seja 'Inativo'.
-- 115. Liste nome dos membros cujo nome comece com 'A' ou 'B' e cujo gênero não seja
-- nulo, mas exclua aqueles cujo cpf esteja na lista ('00000000000','11111111111').
-- 116. Liste nome e salário atual dos treinadores cuja experiência seja maior que 5 e menor
-- que 15 e cujo salário não esteja entre 3000 e 6000.
-- 117. Liste nome dos membros cujo id_atleta seja maior que 10 e menor que 100 e cujo
-- id_esporte não esteja na lista (102,103).
-- 118. Liste nome dos treinadores cujo nome comece com 'M' ou 'C' e cuja experiência seja
-- maior que 8 e salário atual maior que 5000.
-- 119. Liste nome dos membros cujo email não seja nulo e (gênero seja 'F' e id_esporte
-- entre 100 e 110).
-- 120. Liste nome dos esportes cujo status seja 'Ativo' e id_modalidade entre 100 e 120 e
-- cujo nome não termine com 'o'.
-- 121. Liste nome e salário atual dos treinadores cuja experiência seja maior que 5 ou
-- salário maior que 7000, mas exclua aqueles cuja experiência seja menor que 3.
-- 122. Liste nome dos membros cujo gênero seja 'F' e nome contenha 'a', ou cujo gênero
-- seja 'M' e nome contenha 'o'.
-- 123. Liste nome dos treinadores cujo salário atual seja maior que 5000 e (experiência
-- maior que 10 ou salário maior que 9000).
-- 124. Liste nome dos membros cujo id_esporte esteja entre 100 e 110 e cujo nome não
-- contenha a letra 'r'.
-- 125. Liste nome e cpf dos membros cujo cpf esteja entre dois valores e (gênero seja 'F' ou
-- id_treinador não seja nulo).
-- 126. Apagar membros onde id_atleta entre 20 e 30.
-- 127. Apagar treinadores onde experiencia_anos < 2.
-- 128. Apagar esportes onde id_modalidade > 120.
-- 129. Apagar membros onde nome like 'A%'.
-- 130. Apagar treinadores onde salario_atual > 9000.
-- 131. Apagar esportes onde nome seja igual a Surf ou Ciclismo.
-- 132. Apagar membros onde genero = 'F' e id_esporte = 100.
-- 133. Apagar membros onde genero = 'M' OU id_esporte nulo.
-- 134. Apagar treinadores onde salario_inicial entre 2000 e 3000.
-- 135. Apagar esportes onde status = 'Inativo' e id_modalidade entre 100 e 110.
-- 136. Apagar membros onde id_esporte igual 100,101 e 102.
-- 137. Apagar treinadores onde nome contenha a palavra Dias
-- 138. Apagar esportes onde nome contenha a legra ‘e’.
-- 139. Apagar membros onde cpf seja '12312312399' ou '32132132188'.
-- 140. Apagar treinadores onde salario_atual < 3500 OU experiencia_anos > 20.
-- 141. Apagar membros onde id_atleta > 50.
-- 142. Apagar esportes onde id_modalidade < 100.
-- 143. Apagar treinadores onde experiencia_anos entre 8 e 12.
-- 144. Apagar membros onde nome contenha a palavra 'Junior'.
-- 145. Apagar esportes onde status seja 'Inativo'.
-- 146. remova todos os registros da tabela membros.
-- 147. remova todos os registros da tabela treinadores.
-- 148. remova todos os registros da tabela esportes.

-- 149. Identifique o erro:
INSERT INTO treinadores (nome, experiencia_anos, salario_inicial, salario_atual) VALUES ('Marcos Rocha', 10, 4500.00, 5500.00);

-- 150. Identifique o erro:
INSERT INTO membros (nome, cpf, genero) VALUES ('Ana Silva', '12345678901', 'F');

-- 151. Identifique o erro :
-- UPDATE esportes SET status = 'Cancelado' WHERE id_modalidade = 101;
-- 152. Identifique o erro :
-- INSERT INTO membros (email, id_esporte) VALUES ('contato@email.com', 100);
-- 153. Identifique o erro :
-- INSERT INTO membros (nome, cpf) VALUES ('Carlos Souza', '11111111111');
-- 154. Identifique o erro :
-- UPDATE treinadores SET experiencia_anos = 12 salario_atual = 6000.00 WHERE id_treinador
-- = 1;
-- 155. Identifique o erro :
-- INSERT INTO treinadores (nome, salario_inicial, salario_atual) VALUES ('Paula Lima',
-- 2500,50, 3000,00);
-- 156. Identifique o erro :
-- SELECT nome, telefone FROM membros WHERE id_atleta = 5;
-- 157. Identifique o erro :
-- INSERT INTO esportes VALUES ('Vôlei', 'Ativo'); -- (Dica: a tabela espera 3 colunas: nome,
-- id_modalidade, status)
-- 158. Identifique o erro :
-- UPDATE treinadores SET salario_inicial = -100.00 WHERE id_treinador = 2;