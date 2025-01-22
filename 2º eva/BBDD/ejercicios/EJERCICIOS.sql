-- **DB ALUMNO** --
-- PROYECCIÓN --
-- ejercicio 1 --
select nombre,concat(apellido1," ",apellido2) as apellidos from alumno;
-- ejercicio 2 --
select nombre,edad from alumno;
-- ejercicio 3 --
select ciclo, curso, nombre from asignatura;
-- ejercicio 4 --
select nombre from profesor;

-- ORDENACION --
-- ejercicio 5 --
select nombre, edad from alumno
order by edad asc;
-- ejercicio 6 --
select nombre,concat(apellido1," ",apellido2) as apellidos, provNacimiento from alumno
order by apellidos asc,nombre asc;
-- ejercicio 7--
select nombre from asignatura
order by curso asc;
-- ejercicio 8--
select * from asignatura
order by nombre desc;
-- ejercicio 9--
select ciclo, curso, nombre from asignatura
order by ciclo desc, curso asc;

-- COMODIN--
-- ejercicio 10 --
select * from alumno;

-- ALIAS,COLUMNAS CALCULADAS Y TOP --
-- ejercicio 11 --
select nombre,apellido1 "primer_Apellido",apellido2 as "segundo_Apellido" from profesor;
-- ejercicio 12 --
select nombre,(edadPadre-edad) as diferenciaEdad from alumno;
-- ejercicio 13 --
select apellido1,apellido2 from alumno
order by apellido1 asc
limit 1;
-- ejercicio 14 --
select apellido1,apellido2 from alumno
order by apellido1 desc
limit 1;

-- SELECTION--
-- ejercicio 15 --
select nombre, apellido1,apellido2 from alumno
where edad<21;

-- ejercicio 16--
select * from asignatura
where curso=1;

-- ejercicio 17--
select * from asignatura
where curso=2 and ciclo='DAI';

-- ejercicio 18--
select * from asignatura
where ciclo='DAI';

-- ejercicio 19--
select * from alumno
where provNacimiento='Madrid';

-- ejercicio 20--
select* from alumno
where provNacimiento='Madrid' and edad<21;

-- ejercicio 21 --
select * from alumno 
where edad<20 or edad>25
order by edad asc;

-- ejercicio 22--
select * from asignatura
where (ciclo='DAI' or ciclo='ASI') and curso=1
order by ciclo asc;

-- ejercicio 23--
select * from alumno
where (edadPadre-edad)<27;


-- ejercicio 24--
select * from alumno
order by edad asc
limit 1;
select min(edad) from alumno;
select * from alumno where edad=(select min(edad) from alumno);

-- ejercicio 25--
select * from alumno
order by edad desc
LIMIT 1;

-- ejercicio 26 -- 
select * from alumno 
where dirección is null;

-- ejercicio 27 --
select * from alumno
where  nombre like "%Alberto%";

-- ejercicio 28--
select * from profesor
where nombre like "A%";

-- ejercicio 29 --
select* from asignatura
where nombre like "%red%";

-- DISTINCT--
-- ejercicio 30--
select distinct apellido1 from profesor;

-- ejercicio 31--
select distinct ciclo from asignatura;

-- UNION--
-- ejercicio 32--
select nombre , apellido1 ,apellido2 from alumno
union
(select nombre, apellido1, apellido2 from profesor)
order by nombre;

-- ejercicio 33--
select nombre , apellido1 ,apellido2, 'estudiante' as id  from alumno
union
(select nombre, apellido1, apellido2,'profesor' as id from profesor);

-- ejercicio 34 --
select nombre , apellido1 ,apellido2, 'estudiante' as id from alumno
union
(select nombre, apellido1, apellido2,'profesor' as id from profesor)
order by apellido1, apellido2;

-- ejercicio 35--
select nombre , apellido1 ,apellido2, 'estudiante' as id from alumno
union
(select nombre, apellido1, apellido2,'profesor' as id from profesor)
order by id;

-- PRODUCTO CARTESIANO --
-- ejercicio 36--
select profesor.nombre nombreProf,asignatura.nombre nombreAsig from profesor,asignatura; 

-- INNER JOIN --
-- ejercicio 37--
select count(asignatura.nombre), profesor.nombre from asignatura, profesor
where asignatura.dniProfesor=profesor.dni;

-- ejercicio 38--
select asignatura.nombre, profesor.nombre from asignatura, profesor
where asignatura.dniProfesor=profesor.dni
order by profesor.nombre;

-- ejercicio 39--
select asignatura.ciclo, asignatura.curso, asignatura.nombre, profesor.nombre from asignatura, profesor
where asignatura.dniProfesor=profesor.dni
order by asignatura.ciclo desc, curso asc;

-- ejercicio 40--
select alumno.nombre,estudian.nota from alumno,estudian
where alumno.dni=estudian.dniAlumno;

-- ejercicio 41--
select alumno.nombre,estudian.nota, asignatura.nombre from alumno
inner join estudian on alumno.dni=estudian.dniAlumno
inner join asignatura on estudian.codAsig=asignatura.codAsig;

-- ejercicio 42--
select alumno.nombre,estudian.nota, asignatura.nombre from alumno
inner join estudian on alumno.dni=estudian.dniAlumno
inner join asignatura on estudian.codAsig=asignatura.codAsig
order by asignatura.nombre, estudian.nota;

-- LEFT Y RIGHT JOIN--
-- ejercicio 43--
select alumno.nombre, estudian.nota, asignatura.nombre from alumno
left outer join estudian on alumno.dni=estudian.dniAlumno
left outer join asignatura on asignatura.codAsig= estudian.codAsig;

-- ejercicio 44--
select alumno.nombre, estudian.nota, asignatura.nombre from alumno
left outer join estudian on alumno.dni=estudian.dniAlumno
right outer join asignatura on asignatura.codAsig= estudian.codAsig;

-- ejercicio 45
select count(*) from alumno;


-- ejercicio 46
select provNacimiento from alumno;

-- ej 48
select provnacimiento, count(*) from alumno;

-- ej 49
select provnacimiento, count(*) from alumno
group by provnacimiento
having count(*);

-- ej 52--
select codAsig, max(mark) from estudian
group by codAsig;

select a.nombre, max(e.nota) as notaMax from asignatura a 
left outer join estudian e on a.codAsig=e.codAsig
group by a.nombre, a.codAsig;

select estudian.dniAlumno,count(*)  from estudian
inner join asignatura on estudian.codAsig=asignatura.codAsig
group by dniAlumno;

select provnacimiento, count(*) from alumno
group by provnacimiento
having min(edad) >=18;

describe asignatura;
select * from estudian;