create database Bd_alumnosVariosCentros;
use Bd_alumnosVariosCentros;
create table profesor_centro(
codCentro 	char(8)	not null,
idP			char(10) not null,
horasSemana tinyint  not null,
constraint pk_profesor_centro Primary key (codCentro, idP),
constraint chk_horasSemana check (horasSemana>=0 and horassemana<=37));

-- Ojo. MySQL no hace caso a la constraint check hasta la release ......


create table alumno_centro (
codCentro 	char(8) not null, 
nMat 		int 	not null,
fechaMat	date	not null,
codCentroProfesor	char(8) null, 
idProfesor			char(10) null,
constraint pk_alumno_centro primary key(codCentro, nmat), 
constraint fk_alumnoCentro_profesorCentro foreign key (codCentroProfesor, idProfesor) references
						profesor_Centro(codCentro, idp) on delete restrict on update restrict);

-- constraint fk1_alumnoCentro_profesorCentro foreign key (codCentroProfesor) references
-- 						profesor_Centro(codCentro) on delete restrict on update restrict),
--  constraint fk2alumnoCentro_profesorCentro foreign key (idProfesor) references
-- 						profesor_Centro(idP) on delete restrict on update restrict);
 
create table alumno (
id int not null,
nombre char(20) not null,
constraint pk_id_alumno primary key (id));

create table professor (
id char(10) not null primary key,
nombre char(20)not null);

create table centro (
codCentro char(8)not null primary key,
nombre char(20)not null);

Alter table profesor_centro
add constraint fk_professor_profesorCentro foreign key (idP) references professor(id),
add constraint fk_centro_profesorCentro foreign key (codCentro) references centro(codCentro);

alter table alumno_centro
add constraint fk_alumno_alumnoCentro foreign key (nMat) references alumno(id),
add constraint fk_centro_alumnoCentro foreign key (codCentroProfesor) references centro(codCentro);


