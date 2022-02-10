use sakila_db;

select c.primeiro_nome from cliente c
join aluguel a on a.cliente_id = c.cliente_id
where data_de_aluguel = '2005-05-30 23:47:56';

select f.primeiro_nome, 


