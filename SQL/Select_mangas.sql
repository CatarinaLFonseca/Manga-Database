 /*total de capitulos cadastrados*/
select manga.nome, sum(capitulo.numero_capitulo)
from manga, capitulo
where manga.id_manga = capitulo.id_manga
group by capitulo.id_manga
order by nome;

select nome, sum(capitulo.numero_capitulo)
from manga inner join capitulo
on manga.id_manga = capitulo.id_manga
where nome = 'Fairy tail'
group by capitulo.id_manga
order by nome;

/* Mostre o todas as paginas do segundo capitulo do manga: fairy tail. 1*/
select numero_capitulo, id_pagina
from capitulo right join pagina
on capitulo.id_capitulo = pagina.id_capitulo
where capitulo.id_capitulo = '5';

/* Mostre o todas as paginas do segundo capitulo do manga: fairy tail. 2*/
select id_capitulo, id_pagina 
from pagina
where id_capitulo = '5';

select * from manga;
select * from autor_manga;
select * from categoria_manga;

select nome, id_autor
from manga inner join autor_manga
on manga.id_manga = autor_manga.id_manga
where manga.id_manga = 1;
