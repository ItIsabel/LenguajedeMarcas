

drop table grades;
drop table student;
drop table teacher;
drop table subject;

create table teacher (
dni 	char(10) not null,
nombre 	char(35) not null,
constraint pk_teacher Primary Key (dni));

create table student ( 
dniStudent 	char(10) not null,
nombre 		char(35) not null,
regnumber 	int not null,
tutor 		char(10) null, 
constraint pk_student primary key (dniStudent),
constraint uq_student unique (regnumber),
constraint fk_student_tutor foreign key (tutor) references teacher (dni) on delete restrict on update restrict);

create table subject (
subjectCode char(4) not null,
nombre		char(35) not null,
constraint pk_subject primary key (subjectCode));

create table grades (
dniStudent 	char (10) not null,
subjectCode	char (4) not null,
fecha		date not null,
grades		tinyint not null,

constraint pk_grades Primary key (dniStudent, subjectCode, fecha), 
constraint fk_grades_student foreign key(dniStudent) references student(dniStudent) on delete restrict on update restrict,
constraint fk_grades_subject forign key(subjectCode) references subject(subjectCode) on delete restrict on update restrict);



