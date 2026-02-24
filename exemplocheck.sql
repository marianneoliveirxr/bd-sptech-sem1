use aula_4;

drop table aluno;
-- CHECK CONSTRAINT
CREATE TABLE aluno (
  ra char(08) NOT NULL,
  nome  varchar(100) NOT NULL,
  situacao varchar(10) not null default 'Ativo',
  PRIMARY KEY (ra),
  constraint check(situacao in('Ativo', 'Inativo'))
);
select * from aluno;
insert into aluno(ra, nome)
values ('01241221', 'AMANDA'),
		('01241222', 'ANA CLAUDIA'),
		('01241223', 'BEATRIZ'),
		('01241224', 'BIANCA'),
		('01241225', 'BRUNA'),
		('01241226', 'FERNANDO'),
		('01241227', 'GIOVANA'),
		('01241228', 'GUILHERME'),
		('01241229', 'PAULO'),
		('01241230', 'PEDRO');
--
select * from aluno;    
--
-- alterar situação
update aluno set situacao = 'Não Sei' where ra = '01241226';

alter table aluno drop constraint aluno_chk_1;

ALTER TABLE aluno ADD CONSTRAINT aluno_chk_1 CHECK (situacao in('Ativo', 'Inativo'));
