 /*total de capitulos cadastrados*/
select mangas.nome, sum(capitulo.numero_capitulo)
from mangas, capitulo
where mangas.id_manga = capitulo.id_manga
group by capitulo.id_manga
order by nome;

select nome, sum(capitulo.numero_capitulo)
from mangas inner join capitulo
on mangas.id_manga = capitulo.id_manga
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

select * from mangas;
select * from autor_manga;
select * from categoria_manga;

select nome, id_autor
from mangas inner join autor_manga
on mangas.id_manga = autor_manga.id_manga
where mangas.id_manga = 1;
