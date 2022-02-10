-- Aluna Suelen Caroline do Nascimento

create database lista003;

use lista003;
-- Ex01
create table item(
	id_item int not null primary key,
    nome varchar(50),
    valor float
);

create table cliente(
	id_cliente int not null primary key,
    nome varchar(50),
    cpf char(11)
);

create table pedido(
	id_pedido int not null primary key,
    id_cliente int,
    constraint fkpedido_cliente foreign key (id_cliente) references cliente (id_cliente)
);

create table pedido_item(
	id_item int,
    id_pedido int,
    qtd_itens int,
    primary key(id_item, id_pedido),
    foreign key(id_item) references item (id_item),
    foreign key(id_pedido) references pedido (id_pedido)
);
-- Ex02
create table editora(
	id_editora int not null primary key,
    nome varchar(50)
);

create table autor(
	id_autor int not null primary key,
    nome varchar(50)
);

create table categoria(
	id_categoria int not null primary key,
    nome varchar(50)
);

create table livro(
	id_livro int not null primary key,
    id_autor int,
    id_editora int,
    edicao int,
    ano char(4),
    foreign key (id_autor) references autor (id_autor),
    foreign key (id_editora) references editora (id_editora)
);

create table livro_categoria(
	id_livro int,
    id_categoria int,
    primary key(id_livro, id_categoria),
    foreign key (id_livro) references livro (id_livro),
    foreign key (id_categoria) references categoria (id_categoria)
);
-- Ex03
create table departamento(
	id_departamento int not null primary key,
    setor varchar(50)
);

create table funcionario(
	id_funcionario int not null primary key,
    id_departamento int,
    nome varchar(50),
    salario float,
    telefone varchar(15),
    foreign key (id_departamento) references departamento (id_departamento)
);

create table deposito(
	id_deposito int not null primary key,
    endereco varchar (50)
);

create table fornecedor(
	id_fornecedor int not null primary key,
    endereco varchar(50)
);

create table peca(
	id_peca int not null primary key,
    peso float,
    cor varchar(20),
    id_deposito int,
    foreign key (id_deposito) references deposito (id_deposito)
);

create table peca_fornecedor(
	id_peca int,
    id_fornecedor int,
    primary key (id_peca, id_fornecedor),
    foreign key (id_peca) references peca (id_peca),
    foreign key (id_fornecedor) references fornecedor (id_fornecedor)
);

create table projeto(
	id_projeto int not null primary key,
    orcamento float
);

create table peca_projeto(
	id_peca int,
    id_projeto int,
    primary key (id_peca, id_projeto),
    foreign key (id_peca) references peca (id_peca),
    foreign key (id_projeto) references projeto (id_projeto)
);

create table funcionario_projeto(
	id_funcionario int,
    id_projeto int,
    primary key(id_funcionario, id_projeto),
    foreign key(id_funcionario) references funcionario (id_funcionario),
    foreign key (id_projeto) references projeto (id_projeto)
);
-- Ex04
create table escola(
	id_escola int not null primary key,
    nome varchar(50)
);

create table sala(
	id_sala int not null primary key,
    nome varchar(50)
);

create table turmas(
	id_turma int not null primary key,
    id_sala int,
    id_escola int,
    foreign key (id_sala) references sala (id_sala),
    foreign key (id_escola) references escola (id_escola)
);

create table professor(
	id_professor int not null primary key,
    nome varchar(50)
);

create table professor_turma(
	id_professor int,
    id_turma int,
    primary key(id_professor, id_turma),
    foreign key (id_professor) references professor (id_professor),
    foreign key (id_turma) references turmas (id_turma)
);
-- Ex05
create database eleicao;
use eleicao;

create table cargo(
	id_cargo int not null unique,
    nome_cargo varchar (30) unique not null,
    check (nome_cargo <> 'prefeito' and nome_cargo <> 'vereador'),
    salario float not null default 1700,
    numero_vagas int not null unique
);

create table partido(
	id_partido int unique not null,
    sigla char(5) unique not null,
    nome varchar(40) unique not null,
    numero int unique not null
);
 
 create table candidato(
	id_candidato int unique not null,
    nome varchar(40) unique not null,
    id_cargo int not null,
    id_partido int not null,
    foreign key(id_cargo) references cargo (id_cargo),
    foreign key(id_partido) references partido (id_partido)
 );
 
  create table eleitor(
	titulo varchar(30),
    zona char(5) not null,
    sessao char (5) not null,
    nome varchar(40) not null
  );
  
  create table voto(
	id_voto int not null,
	titulo varchar (30) unique not null,
    id_candidato int not null,
    foreign key(id_candidato) references candidato (id_candidato)
  );
 



