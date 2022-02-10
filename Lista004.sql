create database lista004;

use lista004;
-- Ex01
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
    nome varchar(50),
    id_editora int,
    constraint fk_editoralivro foreign key (id_editora) references editora (id_editora)
);

create table livro_autor(
	id_livro int,
    id_autor int,
    primary key(id_livro, id_autor),
    constraint fk_livroautor foreign key(id_livro) references livro (id_livro),
    constraint fk_autorlivro foreign key(id_autor) references autor (id_autor)
);

create table livro_categoria(
	id_livro int,
    id_categoria int,
    primary key(id_livro, id_categoria),
    constraint fk_livrocategoria foreign key(id_livro) references livro (id_livro),
    constraint fk_categorialivro foreign key(id_categoria) references categoria (id_categoria)
);

insert into editora (nome,id_editora)
values ("Abril", 1);

insert into editora (nome,id_editora)
values ("Arqueiro", 2);

insert into autor (nome, id_autor)
values("Nicolas Spark",1),
	  ("Daniel Goeleman",2);

insert into categoria (nome, id_categoria)
values("Ficção",1),
	  ("Romance",2);

insert into livro (nome,id_livro, id_editora)
values("Guia do mochileiro das galaxias",1,2),
	  ("A menina que roubava livros",2,1);

insert into livro_autor(id_livro, id_autor)
values(2,1),
	  (1,1);

insert into livro_categoria(id_livro, id_categoria)
values (2,1),
	   (2,2);

update categoria
set nome = "Fantasia"
where nome = "Romance";

update editora
set nome = "ABC"
where nome = "Abril";

update autor
set nome = "Bauer"
where nome = "Nicolas Spark";

update livro
set nome = "1964"
where nome = "A menina que roubava livros";

delete from livro
where nome = "A menina que roubava livros";

-- Ex02
create table aula(
	id_aula int primary key auto_increment,
    nome varchar(50)
);

create table professor(
	id_professor int primary key auto_increment,
    id_aula int not null,
    nome varchar(50),
    constraint fk_aula foreign key (id_aula) references aula (id_aula)
);

create table turma(
	id_turma int primary key auto_increment,
    nome varchar(50)
);

create table aluno(
	id_aluno int primary key auto_increment,
    id_turma int not null,
    nome varchar(50),
    constraint fk_turma foreign key (id_turma) references turma (id_turma)
);

create table turma_professor(
	id_professor int not null,
    id_turma int not null,
    primary key(id_professor, id_turma),
    constraint fk_profturma foreign key(id_professor) references professor (id_professor),
    constraint fk_turmaprof foreign key(id_turma) references turma (id_turma)
);

create table aluno_aula(
	id_aluno int not null,
    id_aula int not null,
    primary key(id_aluno, id_aula),
    constraint fk_aulaaluno foreign key(id_aula) references aula (id_aula),
    constraint fk_alunoaula foreign key(id_aluno) references aluno (id_aluno)
);

insert into aula (nome)
values ("Eng. Software"), ("Banco de Dados"), ("Estrutura de dados"), ("Dev web");

insert into turma(nome)
values ("Connect"), ("ADS");

insert into aluno (nome, id_turma)
values ("Suelen",1), ("Lorran",1), ("Tiago", 2), ("Nicolas", 1);

insert into professor (nome, id_aula)
values ("Daniele", 1), ("William",2), ("Leonardo",3);

insert into turma_professor (id_turma, id_professor)
values (1,1), (1,2), (2,1), (1,3);

insert into aluno_aula (id_aula, id_aluno)
values (1,1), (2,1), (4,2), (3,1);

update aula
set nome = "Desenvolvimento Web"
where nome = "Dev web";

update turma
set nome = "Analise e Desenvolvimento de Sistemas"
where nome = "ADS";

update aluno
set nome = "Lorran"
where nome = "Ramon";

update professor
set id_aula = 2
where id_professor = 1;

delete from aluno
where nome = "Nicolas";

delete from professor
where nome = "Leonardo";

-- Ex03
CREATE TABLE instrutores (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  valor_hora INTEGER UNSIGNED NULL,
  certificados VARCHAR(255) NULL,
  PRIMARY KEY(id)
);

insert into instrutores (nome,  email, valor_hora, certificados) values
	("Ana", "teste1@gmail.com", 20, "certificado A"),
    ("Joana", "teste2@gmail.com", 30, "certificado A"),
    ("Paula", "teste3@gmail.com", 30, "certificado A"),
    ("Maria", "teste4@gmail.com", 30, "certificado A"),
    ("João", "teste5@gmail.com", 30, "certificado A");
    
update instrutores set nome = "Nicolas" where id = 2;
update instrutores set email = "mudar@email.com" where nome = "Nicolas";
delete from instrutores where id = 5 and id = 4;
select * from instrutores;
    
CREATE TABLE cursos (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  requisito VARCHAR(255) NULL,
  carga_horaria SMALLINT UNSIGNED NULL,
  preco DOUBLE UNSIGNED NULL,
  PRIMARY KEY(id)
);
insert into cursos (nome, requisito, carga_horaria, preco) values
	("ADM", "EM", 20, 450),
    ("TADS", "Superior", 30, 600),
    ("FARM", "EM", 30, 450),
    ("FIS", "EM", 30, 450),
    ("EDF", "EM", 30, 450);
    
update cursos set nome = "C&T" where id = 2;
update cursos set nome = "FISICA"  where nome = "FIS";
delete from cursos where id = 5 and id = 4;
select * from cursos;
 
CREATE TABLE alunos (
  id INT NOT NULL AUTO_INCREMENT,
  cpf CHAR(11) NOT NULL,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  fone CHAR(14) NOT NULL,
  data_nascimento DATE NULL,
  PRIMARY KEY(id)
);
insert into alunos (cpf, nome, email, fone) values
	("12345678901", "Ana", "teste@gmail.com", "45999111111"),
    ("12345678902", "Joana", "teste1@gmail.com", "45999111112"),
    ("12345678903", "Paula", "teste3@gmail.com", "45999111113"),
    ("12345678904", "Nicolas", "teste4@gmail.com", "45999111114"),
    ("12345678905", "João", "teste5@gmail.com", "45999111115");
    
update alunos set nome = "Patricia" where id = 1;
update alunos set nome = "Nicholas" where nome = "Nicolas";
delete from alunos where id = 5 and id = 4;
select * from alunos;

CREATE TABLE turmas (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  instrutores_id INT NOT NULL,
  cursos_id INTEGER UNSIGNED NOT NULL,
  data_inicio DATE NULL,
  data_final DATE NULL,
  carga_horaria SMALLINT UNSIGNED NULL,
  PRIMARY KEY(id),
  INDEX turmas_FKIndex1(cursos_id),
  INDEX turmas_FKIndex2(instrutores_id),
  CONSTRAINT CURSO_TURMA_FK FOREIGN KEY(cursos_id)
    REFERENCES cursos(id),
  CONSTRAINT INSTRUTOR_TURMA_FK FOREIGN KEY(instrutores_id)
    REFERENCES instrutores(id)
);
insert into turmas (instrutores_id, cursos_id, carga_horaria) values
	(1, 1, 420),
    (1, 1, 420),
    (2, 4, 420),
    (4, 3, 420), 
    (3, 5, 420);
update turmas set instrutores_id = 2 where cursos_id = 1;
update turmas set instrutores_id = 3 where cursos_id = 4;
delete from turmas where id = 5 and id = 4;
select * from turmas;

CREATE TABLE matriculas (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  turmas_id INTEGER UNSIGNED NOT NULL,
  alunos_id INT NOT NULL,
  data_matricula DATE NULL,
  PRIMARY KEY(id),
   CONSTRAINT ALUNO_MATRICULA_FK FOREIGN KEY(alunos_id)
    REFERENCES alunos(id),
  CONSTRAINT TURMA_MATRICULA_FK FOREIGN KEY(turmas_id)
    REFERENCES turmas(id)
);

insert into matriculas (turmas_id, alunos_id) values 
	(1, 1),
    (1, 2),
    (2, 1),
    (3, 3), 
    (3, 1);
update matriculas set turmas_id = 2 where id = 2;
delete from matriculas where id = 5 and id = 4;












