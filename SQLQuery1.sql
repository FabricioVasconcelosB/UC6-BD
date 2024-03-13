--criando banco
create database Livraria;
--usando o banco criado
use Livraria;
--criando tabales e seus atributos
create table cliente (
	cod_cliente int primary key,
	nome nvarchar(30),
	email nvarchar(30),
	telefone_1 varchar(11),
	telefone_2 varchar(11),
	rua nvarchar (30),
	bairro nvarchar(30),
	cidade nvarchar(30),
	estado nvarchar(30)

);

create table pessoa_fisica (
	cod_cliente int ,
	foreign key (cod_cliente) references cliente (cod_cliente),
	rg nvarchar(20),
	cpf char(11) primary key

);

create table pessoa_juridica (
	cod_cliente int ,
	foreign key (cod_cliente) references cliente (cod_cliente),
	cnpj char(11) primary key,
	ie char(11)
	

);

create table pedido (
	cod_pedido int primary key,
	cod_cliente int ,
	foreign key (cod_cliente) references cliente (cod_cliente),
	data_hora datetime,
	valor_pedido decimal

);

create table editora (
	cod_editora int primary key,
	telefone_1 varchar(11),
	telefone_2 varchar(11),
	nome_contato nvarchar(30),
	email nvarchar(30)

);

create table livro (
	cod_livro int primary key,
	cod_editora int,
	foreign (cod_editora) references editora (cod_editora),
	valor decimal,
	ano_publi date,
	categoria nvarchar(30),
	titulo nvarchar(50),
	autor nvarchar(30)

);


create table item_pedido (
	cod_pedido int,
	foreign key (cod_pedido) references pedido,
	qtde_pedido decimal primary key,
	valor_pedido decimal,
	cod_livro int,
	foreign (cod_livro) references livro (cod_livro)

);


create table estoque (
	foreign (cod_editora) references editora (cod_editora),
	foreing (cod_editora) references livro (cod_livro),
	qtde_estoque decimal

);

insert into cliente(
	cod_cliente, --int primary key,
	nome, --nvarchar(30),
	email, --nvarchar(30),
	telefone_1, --varchar(11),
	telefone_2, --varchar(11),
	rua, --nvarchar (30),
	bairro, --nvarchar(30),
	cidade, --nvarchar(30),
	estado --nvarchar(30)

)
values
(1,'Daniel','daniel@mmm.com','84912345678','84912345671','Floresta','Pan','Amapa','MT'),
(2,'maria','maria@mmm.com','84912345674','84912345673','Flor','Dan','Guru','RJ');

insert into pessoa_fisica(
	cod_cliente, --int ,
	rg, --nvarchar(20),
	cpf --char(11) primary key

)

values
(1,'Daniel','98765432191','12345678901');

insert into pessoa_fisica(
	cod_cliente, --int ,
	rg, --nvarchar(20),
	cpf --char(11) primary key

)

values
(2,'maria','98765432145','19876543298');

insert into pessoa_juridica(
	cod_cliente, --int ,
	cnpj, --char(11) primary key,
	ie --char(11)

)

values
(2,'876543211234','123451234254');

insert into pedido(
	cod_pedido, --int primary key,
	cod_cliente, --int ,
	data_hora, --datetime,
	valor_pedido --decimal
	
)

values
(1,1,'2024-12-10 11:11:11','10,90'),
(1,2,'2024-12-12 12:12:12','15,90');



insert into livro(
	cod_livro, --int primary key,
	cod_editora, --int,
	valor, --decimal,
	ano_publi, --date,
	categoria, --nvarchar(30),
	titulo, --nvarchar(50),
	autor --nvarchar(30)
	
)

values
(1,1,'10,90','1990-10-10','Fantasia','tiulo-A','autor-A'),
(2,2,'10,90','1990-10-10','Ciência','tiulo-B','autor-B');

insert into item_pedido(
	cod_pedido, --int,
	qtde_pedido, --decimal primary key,
	valor_pedido, --decimal,
	cod_livro --int,
	
)

values
(1,'1,0','10,90',1),
(1,'1,0','15,90',2);
