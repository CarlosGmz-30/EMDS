DROP database IF EXISTS sigcat;
CREATE DATABASE sigcat;
USE sigcat;

CREATE TABLE tienditas
(
    id_tiendita varchar(5)   not null primary key,
    descripcion varchar(100) not null
);

CREATE TABLE encuestas
(
    id_encuesta varchar(5)   not null primary key,
    descripcion varchar(100) not null
);

-- id_tiendita varchar(5) not null,
-- foreign key (id_tiendita)
-- references tienditas(id_tiendita)

insert into tienditas
values ('TDD01', 'Abarrotes Diego');
insert into tienditas
values ('TDA02', 'Abarrotes Alan');
insert into tienditas
values ('TDC03', 'Abarrotes Charly');
insert into tienditas
values ('TDN04', 'Abarrotes Nori');
insert into tienditas
values ('TDG05', 'Abarrotes Gil');

insert into encuestas
values ('2023', 'Encuesta anual del año 2023');
insert into encuestas
values ('2024', 'Encuesta anual del año 2024');

select *
from tienditas;
select *
from encuestas;