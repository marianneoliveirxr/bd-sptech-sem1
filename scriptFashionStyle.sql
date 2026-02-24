create database FashionStore;
use FashionStore;

create table produto(
	id int primary key auto_increment not null,
    nome varchar(100) not null,
    categoria varchar(50) not null,
    preco decimal(10,2) not null,
    tamanho varchar(5),
    data_cadastro datetime,
    disponivel tinyint,
    constraint chkTamanho 
    check (tamanho in ('P', 'M', 'G', 'GG'))
);

INSERT INTO produto 
(nome, categoria, preco, tamanho, data_cadastro, disponivel) VALUES 
('Camiseta vermelha', 'camiseta', 59.90, 'P', '2025-12-25 13:30:45', 1),
('Blusa preta tricô', 'blusa', 195.10, 'G', '2025-08-15 09:40:39', 0),
('Calça jeans clara', 'calça', 239.90, 'M', '2025-06-05 10:49:50', 0),
('Short jeans cargo', 'short', 149.90, 'G', '2025-08-10 11:30:48', 1),
('Jaqueta Jeans Couro', 'jaqueta', 269.99, 'GG', '2025-10-03 12:13:16', 1),
('Camiseta azul', 'camiseta', 19.90, 'M', '2025-04-12 18:30:48', 1);

-- Listar os produtos que contenham a palavra "Camiseta" no nome
SELECT * FROM produto WHERE nome LIKE '%Camiseta%';

-- Listar os produtos que não sejam do tamanho 'M'
SELECT * FROM produto WHERE tamanho != 'M';

-- Exibir apenas os produtos cadastrados depois de 18 de agosto de 2025
SELECT * FROM produto WHERE data_cadastro > '2025-08-18 00:00:00';

-- Listar os produtos disponíveis cuja categoria seja "Camiseta" ou "Blusa".
SELECT * FROM produto where categoria = 'Camiseta' 
and categoria = 'Blusa' like disponivel = 1;

-- Exibir o nome do produto concatenado com seu preço, com o alias 'produto_preco'.
SELECT CONCAT(nome, ' ',preco) AS produto_preco FROM produto;

-- Listar os produtos cujo nome NÃO contenha a palavra "Blusa".
SELECT * FROM produto where nome not like '%Blusa%';

-- Listar todos os produtos com uma coluna adicional chamada 'status' 
-- que mostre "Disponível" se disponivel = 1 e "Indisponível" caso contrário
SELECT *, CASE WHEN disponivel = 1 THEN 'Disponível' 
ELSE 'Indisponível' END AS statusProduto FROM produto;

-- Liste os produtos da categoria "Calça" com preço maior que 100 reais.
SELECT * FROM produto where categoria = 'Calça' and preco > 100;

--  Liste os produtos com nome que não contenha a palavra "Camiseta".
SELECT * FROM produto WHERE nome NOT LIKE '%Camiseta%';

-- Exiba os produtos cujo id seja 1, 3 ou 5.
SELECT * FROM produto where id in(1, 3, 5);

--  Liste os produtos com tamanho diferente de 'P' e 'M'.
SELECT * FROM produto where tamanho NOT IN ('P', 'M');

-- Liste os produtos cadastrados antes de 18 de agosto de 2025.
SELECT * FROM produto where data_cadastro < '2025-08-18 00:00:00';

-- Liste o nome e preço de todos os produtos, com um alias chamado produto_valor.
SELECT CONCAT(nome,' ', preco) AS produto_valor FROM produto;

-- Mostre todos os produtos com uma coluna chamada info_completa que junte nome, categoria e preço.
SELECT CONCAT(nome, ' ', categoria, ' ', preco) AS info_completa FROM produto;
