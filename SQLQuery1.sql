-- criando o banco de dados Livraria
create database Livraria;

-- usando o banco de dados criado
use Livraria;

-- criando tabela cliente
create table cliente (
    cod_cliente int primary key,
    nome nvarchar(30),
    email nvarchar(30),
    telefone_1 varchar(11),
    telefone_2 varchar(11),
    rua nvarchar(30),
    bairro nvarchar(30),
    cidade nvarchar(30),
    estado nvarchar(30)
);

-- criando tabela pessoa_fisica
create table pessoa_fisica (
    cod_cliente int,
    foreign key (cod_cliente) references cliente (cod_cliente),
    rg nvarchar(20),
    cpf char(11) primary key
);

-- criando tabela pessoa_juridica
create table pessoa_juridica (
    cod_cliente int,
    foreign key (cod_cliente) references cliente (cod_cliente),
    cnpj char(14) primary key,
    ie varchar(20)
);

-- criando tabela pedido
create table pedido (
    cod_pedido int primary key,
    cod_cliente int,
    foreign key (cod_cliente) references cliente (cod_cliente),
    data_hora datetime,
    valor_pedido decimal(10,2)
);

-- criando tabela editora
create table editora (
    cod_editora int primary key,
    telefone_1 varchar(11),
    telefone_2 varchar(11),
    nome_contato nvarchar(30),
    email nvarchar(30)
);

-- criando tabela livro
create table livro (
    cod_livro int primary key,
    cod_editora int,
    foreign key (cod_editora) references editora (cod_editora),
    valor decimal(10,2),
    ano_publi date,
    categoria nvarchar(30),
    titulo nvarchar(50),
    autor nvarchar(30)
);

-- criando tabela item_pedido
create table item_pedido (
    cod_pedido int,
    foreign key (cod_pedido) references pedido (cod_pedido),
    qtde_pedido decimal(10,2),
    valor_pedido decimal(10,2),
    cod_livro int,
    foreign key (cod_livro) references livro (cod_livro),
    primary key (cod_pedido, cod_livro)
);

-- criando tabela estoque
create table estoque (
    cod_editora int,
    foreign key (cod_editora) references editora (cod_editora),
    cod_livro int,
    foreign key (cod_livro) references livro (cod_livro),
    qtde_estoque decimal(10,2),
    primary key (cod_editora, cod_livro)
);

-- inserindo valores nas tabelas
insert into cliente (cod_cliente,
	nome,
	email,
	telefone_1,
	telefone_2,
	rua, bairro,
	cidade,
	estado
)
values
(1, 'Daniel', 'daniel@mmm.com', '84912345678', '84912345671', 'Floresta', 'Pan', 'Amapa', 'MT'),
(2, 'Maria', 'maria@mmm.com', '84912345674', '84912345673', 'Flor', 'Dan', 'Guru', 'RJ');

insert into pessoa_fisica (
	cod_cliente,
	rg,
	cpf
)
values
(1, '1234567890', '98765432191'),
(2, '0987654321', '98765432145');

insert into pessoa_juridica (
	cod_cliente,
	cnpj,
	ie
)
values
(2, '12345678901234', '123451234254');

insert into editora (
	cod_editora,
	telefone_1,
	telefone_2,
	nome_contato,
	email
)
values
(1, '4219767282', '1287762319', 'Contato Editora 1', 'editora1@example.com'),
(2, '8921633718', '1235678321', 'Contato Editora 2', 'editora2@example.com');

insert into livro (
	cod_livro,
	cod_editora,
	valor,
	ano_publi,
	categoria,
	titulo,
	autor
)
values
(1, 1, 10.90, '1990-10-10', 'Fantasia', 'Título A', 'Autor A'),
(2, 2, 15.90, '1990-10-10', 'Ciência', 'Título B', 'Autor B');

insert into pedido (
	cod_pedido,
	cod_cliente,
	data_hora,
	valor_pedido
)
values
(1, 1, '2024-12-10 11:11:11', 10.90),
(2, 2, '2024-12-12 12:12:12', 15.90);

insert into item_pedido (
	cod_pedido,
	qtde_pedido,
	valor_pedido,
	cod_livro
)
values
(1, 1, 10.90, 1),
(2, 1, 15.90, 2);

insert into estoque (
	cod_editora,
	cod_livro,
	qtde_estoque
)
values
(1, 1, 100),
(2, 2, 150);

select * from cliente;
select * from pessoa_fisica;
select * from pessoa_juridica;
select * from editora;
select * from livro;
select * from item_pedido;
select * from estoque;
