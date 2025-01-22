alter table estudian 
	add constraint pk_estudian primary key (codAsig, dniAlumno);
alter table profesor 
	add constraint pk_profesor primary key (dni);
alter table alumno 
	add constraint pk_alumno primary key(dni);
alter table asignatura 
	add constraint fk_profesor foreign key (dniProfesor) references profesor(dni)
	on delete restrict
	on update restrict;

alter table estudian
	add constraint fk_asignatura foreign key (codAsig) references asignatura(codAsig)
    on delete restrict 
    on update restrict;
	
alter table estudian
	add constraint fk_alumno foreign key (dniAlumno) references alumno(dni)
	on delete restrict
	on update restrict;
	
	
