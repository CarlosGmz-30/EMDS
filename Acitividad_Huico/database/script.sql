DROP database IF EXISTS sigcat;
CREATE DATABASE sigcat;
USE sigcat;

CREATE TABLE tienditas
(
    id_tiendita varchar(5) not null primary key,
    nombre varchar(100) not null
);

CREATE TABLE encuestas
(
    id_encuesta varchar(5) not null primary key,
    nombre varchar(100) not null
);

CREATE TABLE preguntas
(
    id_pregunta varchar(5) not null primary key,
    nombre varchar(100) not null
);

CREATE TABLE respuestas
(
    id_respuesta int not null auto_increment primary key,
    id_tiendita varchar(5) not null,
    id_encuesta varchar(5) not null,
    id_pregunta varchar(5) not null,
    valor int not null,
    foreign key (id_tiendita)
        references tienditas(id_tiendita),
    foreign key (id_encuesta)
        references encuestas(id_encuesta),
    foreign key (id_pregunta)
        references preguntas(id_pregunta)
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
values ('E01', '2023A');
insert into encuestas
values ('E02', '2024A');

insert into preguntas
values ('P01', 'Funcionalidad');
insert into preguntas
values ('P02', 'Confiabilidad');
insert into preguntas
values ('P03', 'Usabilidad');
insert into preguntas
values ('P04', 'Rendimiento');
insert into preguntas
values ('P05', 'Mantenimiento');
insert into preguntas
values ('P06', 'Portabilidad');
insert into preguntas
values ('P07', 'Seguridad');
insert into preguntas
values ('P08', 'Compatibilidad');
/*
insert into respuestas
values ('R01', 'TDD01', 'E01', 'P01', 1);
insert into respuestas
values ('R02', 'TDD01', 'E01', 'P02', 3);
insert into respuestas
values ('R03', 'TDD01', 'E01', 'P03', 4);
insert into respuestas
values ('R04', 'TDD01', 'E01', 'P04', 2);
insert into respuestas
values ('R05', 'TDD01', 'E01', 'P05', 3);
insert into respuestas
values ('R06', 'TDD01', 'E01', 'P06', 1);
insert into respuestas
values ('R07', 'TDD01', 'E01', 'P07', 5);
insert into respuestas
values ('R08', 'TDD01', 'E01', 'P08', 4);
insert into respuestas
values ('R09', 'TDA02', 'E01', 'P01', 1);
insert into respuestas
values ('R10', 'TDA02', 'E01', 'P02', 1);
insert into respuestas
values ('R11', 'TDA02', 'E01', 'P03', 2);
insert into respuestas
values ('R12', 'TDA02', 'E01', 'P04', 3);
insert into respuestas
values ('R13', 'TDA02', 'E01', 'P05', 5);
insert into respuestas
values ('R14', 'TDA02', 'E01', 'P06', 1);
insert into respuestas
values ('R15', 'TDA02', 'E01', 'P07', 2);
insert into respuestas
values ('R16', 'TDA02', 'E01', 'P08', 3);
 */


select *
from tienditas;
select *
from encuestas;
select *
from preguntas;
select *
from respuestas;

/*
-- consulta especifica con ID tiendita
SELECT t.nombre AS 'Tiendita', e.nombre AS 'Encuesta', p.nombre AS 'Pregunta', r.valor AS 'Respuesta'
FROM tienditas t
JOIN respuestas r ON t.id_tiendita = r.id_tiendita
JOIN encuestas e ON r.id_encuesta = e.id_encuesta
JOIN preguntas p ON r.id_pregunta = p.id_pregunta
WHERE t.id_tiendita = 'TDA02';
-- Lo mismo de arriba pero con id
SELECT t.id_tiendita, t.nombre AS 'Tiendita', e.id_encuesta, e.nombre AS 'Encuesta', p.id_pregunta, p.nombre AS 'Pregunta', r.valor AS 'Respuesta'
FROM tienditas t
JOIN respuestas r ON t.id_tiendita = r.id_tiendita
JOIN encuestas e ON r.id_encuesta = e.id_encuesta
JOIN preguntas p ON r.id_pregunta = p.id_pregunta
WHERE t.id_tiendita = 'TDD01';

-- prueba id encuesta //ESTE SE VA A OCUPAR
SELECT t.nombre AS 'Tiendita', e.nombre AS 'Encuesta', p.nombre AS 'Pregunta', r.valor AS 'Respuesta'
FROM tienditas t
JOIN respuestas r ON t.id_tiendita = r.id_tiendita
JOIN encuestas e ON r.id_encuesta = e.id_encuesta
JOIN preguntas p ON r.id_pregunta = p.id_pregunta
WHERE t.id_tiendita = 'TDD01' AND e.id_encuesta = 'E01';

-- Consulta general de todas las tienditas
SELECT t.nombre AS 'Tiendita', e.nombre AS 'Encuesta', p.nombre AS 'Pregunta', r.valor AS 'Respuesta'
FROM tienditas t
JOIN respuestas r ON t.id_tiendita = r.id_tiendita
JOIN encuestas e ON r.id_encuesta = e.id_encuesta
JOIN preguntas p ON r.id_pregunta = p.id_pregunta;


-- Calcular el promedio de respuestas por tiendita y encuesta en porcentaje
SELECT
    t.id_tiendita,
    t.nombre AS 'Tiendita',
    e.id_encuesta,
    e.nombre AS 'Encuesta',
    AVG(r.valor / 5.0) * 100 AS 'PromedioRespuestasPorcentaje'
FROM
    tienditas t
JOIN respuestas r ON t.id_tiendita = r.id_tiendita
JOIN encuestas e ON r.id_encuesta = e.id_encuesta
GROUP BY
    t.id_tiendita, e.id_encuesta;

--
--
--
--
-- Calcular el promedio de respuestas por tiendita y encuesta en porcentaje (escala 0-4)
SELECT
    t.id_tiendita,
    t.nombre AS 'Tiendita',
    e.id_encuesta,
    e.nombre AS 'Encuesta',
    AVG((r.valor - 1) / 4.0) * 100 AS 'PromedioRespuestasPorcentaje'
FROM
    tienditas t
        JOIN respuestas r ON t.id_tiendita = r.id_tiendita
        JOIN encuestas e ON r.id_encuesta = e.id_encuesta
GROUP BY
    t.id_tiendita, e.id_encuesta;
-- Calcular el promedio de respuestas por tiendita para la encuesta(E01) en porcentaje (escala 0-4)
SELECT
    t.id_tiendita,
    t.nombre AS 'Tiendita',
    e.id_encuesta,
    e.nombre AS 'Encuesta',
    AVG((r.valor - 1) / 4.0) * 100 AS 'PromedioRespuestasPorcentaje'
FROM
    tienditas t
        JOIN respuestas r ON t.id_tiendita = r.id_tiendita
        JOIN encuestas e ON r.id_encuesta = e.id_encuesta
WHERE
        e.id_encuesta = 'E01'
GROUP BY
    t.id_tiendita, e.id_encuesta;
--
SELECT
    t.id_tiendita,
    t.nombre AS 'Tiendita',
    e.id_encuesta,
    e.nombre AS 'Encuesta',
    AVG((r.valor - 1) / 4.0) * 100 AS 'PromedioRespuestasPorcentaje'
FROM
    tienditas t
        JOIN respuestas r ON t.id_tiendita = r.id_tiendita
        JOIN encuestas e ON r.id_encuesta = e.id_encuesta
WHERE
        t.id_tiendita = 'TDA02' -- Puedes cambiar 'TDD01' por la variable o parámetro que desees
  AND e.id_encuesta = 'E02'; -- Agrega esta línea para filtrar por id_encuesta específico
GROUP BY
    t.id_tiendita, e.id_encuesta;

--
SELECT
    t.id_tiendita,
    t.nombre AS 'Tiendita',
    e.id_encuesta,
    e.nombre AS 'Encuesta',
    AVG((r.valor - 1) / 4.0) * 100 AS 'PromedioRespuestasPorcentaje'
FROM
    tienditas t
        JOIN respuestas r ON t.id_tiendita = r.id_tiendita
        JOIN encuestas e ON r.id_encuesta = e.id_encuesta
WHERE
        t.id_tiendita = 'TDD01' AND e.id_encuesta = 'E01'
GROUP BY
    t.id_tiendita, e.id_encuesta;
--
SELECT t.nombre AS 'Tiendita', e.nombre AS 'Encuesta', p.nombre AS 'Pregunta', r.valor AS 'Respuesta'
FROM tienditas t
         JOIN respuestas r ON t.id_tiendita = r.id_tiendita
         JOIN encuestas e ON r.id_encuesta = e.id_encuesta
         JOIN preguntas p ON r.id_pregunta = p.id_pregunta
WHERE t.id_tiendita = 'TDA02' AND e.id_encuesta = 'E01';

 */