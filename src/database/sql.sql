CREATE DATABASE postulante1;

use postulante1;

create table pais(
	pai_codigo smallint primary key auto_increment,
	pai_nombre varchar(150)
)

insert into pais(pai_nombre) values ('PERÚ');
insert into pais(pai_nombre) values ('ESPAÑA');
insert into pais(pai_nombre) values ('CHILE');
insert into pais(pai_nombre) values ('ARGENTINA');
insert into pais(pai_nombre) values ('BRASIL');
insert into pais(pai_nombre) values ('EE.UU.');

select * from pais;


create table artista(
	art_codigo smallint primary key auto_increment,
    art_nombre varchar(150),
	art_sexo  bit,
    pai_codigo smallint,
    art_vigencia bit,
    FOREIGN KEY (pai_codigo) REFERENCES pais(pai_codigo)
)

insert into artista(art_nombre, art_sexo, pai_codigo, art_vigencia) values ('Ricardo Montaner',1,1,1);
insert into artista(art_nombre, art_sexo, pai_codigo, art_vigencia) values ('Chester Benington',1,1,0);

select * from artista



create table album(
	alb_codigo tinyint primary key auto_increment,
    alb_nombre varchar(300),
	alb_nroCanciones  tinyint,
    alb_anioPublicacion varchar(4),
    art_codigo smallint,
    FOREIGN KEY (art_codigo) REFERENCES artista(art_codigo)
)

insert into album(alb_nombre, alb_nroCanciones, alb_anioPublicacion, art_codigo) values ('Baladas de Oro',15,'2020',1);

create table genero(
	gen_codigo tinyint primary key auto_increment,
    gen_nombre varchar(50)
)

insert into genero(gen_nombre) values ('SALSA');
insert into genero(gen_nombre) values ('ROCK');
insert into genero(gen_nombre) values ('POP');
insert into genero(gen_nombre) values ('BALADAS');
 

create table cancion(
	can_codigo smallint primary key auto_increment,
    can_nombre varchar(300),
	can_duracion  varchar(8),
    gen_codigo tinyint,
    alb_codigo tinyint,
    FOREIGN KEY (alb_codigo) REFERENCES album(alb_codigo),
	FOREIGN KEY (gen_codigo) REFERENCES genero(gen_codigo)
);


************ PROCEDURES ************
DELIMITER $$
create procedure listarGenero()
begin
	select *
    from genero;
     
end;


DELIMITER $$
create procedure listarArtista()
begin
	select art_codigo , art_nombre
    from artista;
     
end;

DELIMITER $$
create procedure listarAlbum()
begin
	select al.alb_codigo , a.art_codigo, art_nombre, p.pai_nombre, al.alb_nombre, alb_nroCanciones, alb_anioPublicacion
    from artista a
    inner join album al on al.art_codigo = a.art_codigo
    inner join pais p on p.pai_codigo = a.pai_codigo;
end;

call listarAlbum();

DELIMITER $$
create procedure insertAlbum(
    in _alb_nombre varchar(300),
	in _alb_nroCanciones  tinyint,
    in _alb_anioPublicacion varchar(4),
    in _art_codigo smallint
	)
begin
	 insert into album(alb_nombre, alb_nroCanciones, alb_anioPublicacion, art_codigo) 
     values (_alb_nombre,_alb_nroCanciones,_alb_anioPublicacion,_art_codigo);
end;


DELIMITER $$
create procedure getAlbum(
	in _codigo tinyint
)
begin
	select  a.art_nombre, al.alb_nombre
    from artista a
    inner join album al on al.art_codigo = a.art_codigo
    where alb_codigo = _codigo;     
end;

call getAlbum(1);

DELIMITER $$
create procedure insertCancion(
    in _can_nombre varchar(300),
	in _can_duracion varchar(8),
    in _gen_codigo tinyint,
    in _alb_codigo tinyint
	)
begin
	 insert into cancion(can_nombre, can_duracion, gen_codigo, alb_codigo) 
     values (_can_nombre,_can_duracion,_gen_codigo,_alb_codigo);
end;

DELIMITER $$
create procedure listarCanciones(
	in _codigo smallint
)
begin
	select *
    from cancion where alb_codigo = _codigo;
     
end;

call listarCanciones(1);