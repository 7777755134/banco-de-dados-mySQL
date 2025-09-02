create database mercado;
use mercado ;

create table produtos(
     codproduto int not null auto_increment ,
     nomeproduto varchar(100) not null,
     valorproduto int not null default '1000',
	 fornecedor varchar (190),
     constraint produtos check( codproduto >= 0 ),
     constraint pkpdrutos primary key (codproduto)

);

create table cliente (
    cpfcliente int not null ,
    nomecliente varchar(100) not null ,
    sexo varchar(1),
    rua varchar (100) ,
    bairro varchar (100),
    nacionalidade varchar(100) not null default 'brasil',
    constraint pkcliente primary key (cpfcliente)
);

create table fucionario (
        codfucionario int not null auto_increment ,
        nomefucionario varchar(100) not null ,
        nacionalidade varchar(100) default 'brasil',
        sexo char(1) ,
        salario float(4,3) default '1000',
        cargo varchar(50),
        constraint fucionario check(codfucionario >= 0),
        constraint pkfucionario primary key(codfucionario)

); 

