create database controledelivrosFinal;
use controledelivrosFinal;

create table autor(
id_autor int primary key,
nome varchar(50),
idade int,
valor_hr decimal(10,2)
);

create table editora(
id_editora int primary key,
nome varchar(50),
telefone varchar(12)
);

create table estilo(
id_estilo int primary key,
nome varchar(50)
);

create table livro(
id_livro int primary key,
titulo varchar(50),
id_editora int,
valor decimal(10,2),
constraint fk_livro_editora foreign key (id_editora) references editora(id_editora)
);

create table livro_autor(
	id_autor int not null,
    id_livro int not null,
    foreign key (id_autor) references autor(id_autor),
    foreign key (id_livro) references livro(id_livro)
    
);

create table livro_estilo(
	id_estilo int not null,
    id_livro int not null,
    foreign key (id_livro) references livro(id_livro),
    foreign key (id_estilo) references estilo(id_estilo)
    
);

insert into editora values
(1,'Abril','12334567'),
(2,'Globo','123345'),
(3,'Saraiva','1233451212'),
(4,'BBBBB','123345'),
(5,'CCCC','12334521312'),
(6,'EEEE','12334521312'),
(7,'FFF','12334521312'),
(8,'GGGG','12334521312');

insert into autor values
(1,'Paulo Coelho',70,120.3),
(2,'Agatha Christie',50,120.3),
(3,'J K Rowling',70,120.3),
(4,'Dan Brown',35,120.3),
(5,'J R R Tolkien',70,120.3),
(6,'João Abreu',25,5.3),
(7,'Pedro Maria',35,20.3);

insert into estilo values
(1,'Comédia'),
(2,'Drama'),
(3,'Ficção'),
(4,'Suspense'),
(5,'Romance'),
(6,'Ação'),
(7,'Terror');

insert into livro values
(1,'Livro - 123',1,1.5),
(2,'Livro - 234',2,2.5),
(3,'Livro - 333',3,5.5),
(4,'Livro - 444',4,12.5),
(5,'Livro - 555',5,15.5),
(6,'Livro - 566',5,20.5),
(7,'Livro - 544',5,10.5),
(8,'Livro - 666',5,15.5),
(9,'Livro - 777',5,20.5);

insert into livro_autor values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(2,6),
(5,7),
(5,8),
(5,9);

insert into livro_estilo values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(5,6),
(2,7),
(2,8),
(2,9);

-- EXERCICIOS

select l.titulo, e.nome, es.nome, a.nome from livro l 
join livro_autor la on l.id_livro = la.id_livro
join autor a on a.id_autor = la.id_autor
join livro_estilo le on l.id_livro = le.id_livro
join estilo es on es.id_estilo = le.id_estilo
join editora e on l.id_editora = e.id_editora;

select l.titulo, e.nome from livro l
join editora e on l.id_editora = e.id_editora
where e.telefone = '123345';

select l.titulo, a.nome from livro l
join livro_autor la on l.id_livro = la.id_livro
join autor a on a.id_autor = la.id_autor
where a.idade = 35;

select l.titulo, a.nome, e.nome from livro l
join editora e on l.id_editora = e.id_editora
join livro_autor la on l.id_livro = la.id_livro
join autor a on la.id_autor = a.id_autor
where a.nome = 'Dan Brown';

select l.titulo, a.nome, e.nome from livro l
join editora e on l.id_editora = e.id_editora
join livro_autor la on l.id_livro = la.id_livro
join autor a on la.id_autor = a.id_autor
where a.nome = 'Dan Brown' and a.idade = 35;

select l.titulo, a.nome, e.nome from livro l
join editora e on l.id_editora = e.id_editora
join livro_autor la on l.id_livro = la.id_livro
join autor a on la.id_autor = a.id_autor
where a.nome = 'Dan Brown' and e.telefone = '123345';

select l.titulo, es.nome from livro l
join livro_estilo le on l.id_livro = le.id_livro
join estilo es on le.id_estilo = es.id_estilo
where es.nome = 'Romance';

select l.titulo, es.nome from livro l
join editora e on l.id_editora = e.id_editora
join livro_estilo le on l.id_livro = le.id_livro
join estilo es on le.id_estilo = es.id_estilo
where e.nome = 'Globo';

select max(valor) from livro;

select min(valor) from livro;

select avg(valor) from livro;

select avg(valor_hr) from autor;

select count(l.id_livro) from livro l;

select e.nome, count(l.id_livro) from livro l
join editora e on e.id_editora = l.id_editora
where e.id_editora = 2;

select es.nome, count(l.id_livro) from livro l
join livro_estilo le on l.id_livro = le.id_livro
join estilo es on le.id_estilo = es.id_estilo
where es.id_estilo = 5;

select l.titulo, e.nome from livro l
join editora e on l.id_editora = e.id_editora;

select l.titulo, e.nome from livro l
join editora e on l.id_editora = e.id_editora
where e.nome like 'a%';

select a.nome from autor a
left join livro_autor la on la.id_autor = a.id_autor
where la.id_livro is null; 

select e.nome from editora e
left join livro l on e.id_editora = l.id_editora
where l.id_editora is null;

select es.nome from estilo es
left join livro_estilo le on le.id_estilo = es.id_estilo
where le.id_livro is null;

select a.nome, count(l.id_livro) from livro l
join livro_autor la on l.id_livro = la.id_livro
join autor a on la.id_autor = a.id_autor
group by a.id_autor;

select e.nome, count(l.id_livro) from livro l
join editora e on e.id_editora = l.id_editora
group by e.id_editora;

select e.nome, count(l.id_livro) from livro l
join editora e on e.id_editora = l.id_editora
where e.nome like 'CCCC'
group by e.id_editora;

select a.nome, count(l.id_livro) from livro l
join livro_autor la on l.id_livro = la.id_livro
join autor a on la.id_autor = a.id_autor
where a.nome like 'J R R Tolkien'
group by a.id_autor;







