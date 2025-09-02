create database marcado;
use mercado ;

create table tbdonos (
     cod_donos int ,
     nome_dono varchar (100),
     idade int default '18' ,
     constraint chekagem check(idade >= 18 ),
     constraint pk_donos primary key (cod_donos)
);


create table tbmercado (
    cod_mercado int ,
    nome_mercado varchar (100) not null ,
    endereco varchar (100),
    cod_dono int ,
    constraint pk_mercado primary key (cod_mercado),
    constraint fk_mercado foreign key (cod_dono) 
                          references  tbdonos(cod_donos)
);

create table tbgerente (
    cod_gerente int auto_increment,
    nome_gerente varchar (100) not null ,
    endereco_gerente varchar (100) ,
    email_gerente varchar (100) ,
    nacionalidade_gerentre varchar (100) default 'brasileiro',
    cod_meracado int,
    constraint pk_gerente primary key (cod_gernte),
    constraint fk_gerente foreign key(cod_mercado) 
                          references tbmercado (cod_mercado)
);

create table tbfornecedor(
      cod_fornecedor int ,
      nome_fornecedor varchar(100),
      cod_mercado int ,
      constraint pk_fornecedor primary key (cod_fornecedor),
      constraint fk_fornecedor foreign key(cod_mercado) 
                                 references tbmercado(cod_mercado)
); 


create table tbprodutos(
      cod_produtos int,
      nome_produtos varchar(100),
      fornecedor varchar (100),
      constraint pk_produtos primary key(cod_produtos),
      constraint fk_produtos foreign key(fornecedor) 
                               references tbfornecedor(cod_fornecedor)
);

create table tbpreços (
    nome_produto varchar(100),
    preço_produto decimal(4,2) ,
    cod_produto int,
    constraint pk_preços primary key(preço_produto),
    constraint fk_preços foreign key(cod_produto)
                         references tbprodutos(cod_produtos)
);

create table tbatendetes (
    cod_atedente int auto_increment,
    nome_atedente varchar (100),
    salario_atedente decimal(4,3),
    idade_atedente int,
    cod_gerente int,
    cod_mercado int,
    constraint pk_atedentes primary key(cod_atedente),
    constraint fk_atedentes foreign key(cod_gerente) 
						references tbgerebte (cod_gerente),
                            constraint checage check (cod_gerente >= 0 
                            and cod_gerente <= 100),
   constraint fk_atedentes2 foreign key(cod_mercado) 
						references tbmercado (cod_mecado),
                             check (salario_atedente >= 1500.00 and 
                             idade_atedente >= 18 )
                            
); 

create table clientes (
      cod_cliente int ,
      nome_cliente varchar (100) not null ,
      endereco_cliente varchar(100),
      cod_mercado int,
      cod_produto int,
      preço_produto decimal(4,2)
);


