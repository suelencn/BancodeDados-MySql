create database lista002;

use lista002;

create table alunos(
	codigo int,
    nome varchar(50),
    telefone varchar(50),
    cidade varchar(50)
);

desc alunos;

create table alunos2(
	codigo2 int,
    nome varchar(200),
    telefone varchar(50),
    cidade varchar(100)
);

desc alunos2;

create table funcionarios(
	nome varchar(200),
    endereço varchar(50),
    telefone int,
    cidade varchar(50),
    estado varchar(50),
    cep int,
    rg int,
	cpf int,
    salário decimal
);

desc funcionarios;

create table fornecedores(
	nome varchar(200),
	endereço varchar(50),
	telefone int, 
	cidade varchar(50), 
	estado varchar(50), 
	cep int,
	cnpj int,
	email varchar(50)
);

desc fornecedores;

create table livros(
	codigo int, 
    nome varchar(200), 
    categoria varchar(200), 
    resumo varchar(1000), 
    precocusto decimal, 
    precovenda decimal
);

desc livros;

create table estoque(
	nomedoproduto varchar(50), 
    categoria varchar(50), 
    quantidade int,
	fornecedor varchar(200)
);

desc estoque;

create table notas(
	codigo int, 
    nomedoaluno varchar(200),
    bim1 decimal, 
    bim2 decimal, 
    bim3 decimal, 
    bim4 decimal
);

desc notas;

create table caixa(
	cóodigo int,
    dataC int,
    descrição varchar(100),
    debito int,
    credito int
);

desc caixa;

create table contasAPagar(
	codigo int,
    data_conta int,
    descricao varchar(500),
    valor decimal,
    debito decimal,
    credito decimal
);

desc contasAPagar;

create table contasAReceber(
	codigo int,
    data_conta int,
    descricao varchar(500),
    valor decimal,
    data_recebimento int
);

desc contasAReceber;