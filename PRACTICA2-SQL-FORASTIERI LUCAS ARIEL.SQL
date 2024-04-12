CREATE DATABASE EmpresaDevJav;
USE EmpresaDevJav;

CREATE TABLE empleados (
	id_empleado INT (10) UNSIGNED NOT NULL PRIMARY KEY,
	e_nombre VARCHAR (30) NOT NULL,
	e_apellido VARCHAR (30) NOT NULL,
	sexo CHAR NOT NULL,
	fecha_nac DATE,
    fecha_ing DATE,
	salario FLOAT,
	comision FLOAT,
	cargo VARCHAR (30), 
    id_departamento INT (10) UNSIGNED NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES departamentos (id_departamento)
);

CREATE TABLE departamentos (
	id_departamento INT (10) UNSIGNED NOT NULL PRIMARY KEY,
    d_nombre VARCHAR (30) NOT NULL,
    d_ciudad VARCHAR (30) NOT NULL,
    director INT (10)
);
 
-- Insert para creación de departamentos:

 INSERT INTO departamentos (id_departamento, d_nombre, d_ciudad, director)
	VALUES (1000, "Recursos Humanos", "Córdoba", 1548742);
    
 INSERT INTO departamentos (id_departamento, d_nombre, d_ciudad, director)
	VALUES (1001, "Innovación y Desarrollo", "Buenos Aires", 4578754);

 INSERT INTO departamentos (id_departamento, d_nombre, d_ciudad, director)
	VALUES (1002, "Liquidación de Sueldos", "Mar del Plata", 4147852);

 INSERT INTO departamentos (id_departamento, d_nombre, d_ciudad, director)
	VALUES (1004, "Asuntos Jurídicos", "Buenos Aires", 1489237);

 INSERT INTO departamentos (id_departamento, d_nombre, d_ciudad, director)
	VALUES (1005, "Compras", "Córdoba", 9687541);
    
 
-- Insert para empleados:

INSERT INTO empleados (id_empleado, e_nombre, e_apellido, sexo, fecha_nac, fecha_ing, salario, comision, cargo, id_departamento)
	VALUES (311178145, 'María', 'González', 'F', '1990-05-15', '2016-02-20', 450000, 40000, 'Supervisor', 1001);

INSERT INTO empleados (id_empleado, e_nombre, e_apellido, sexo, fecha_nac, fecha_ing, salario, comision, cargo, id_departamento)
	VALUES (311178146, 'Juan', 'Martínez', 'M', '1985-09-20', '2014-07-10', 480000, 45000, 'Analista', 1002);

INSERT INTO empleados (id_empleado, e_nombre, e_apellido, sexo, fecha_nac, fecha_ing, salario, comision, cargo, id_departamento)
	VALUES (311178147, 'Sofía', 'Rodríguez', 'F', '1988-12-03', '2013-11-05', 520000, 55000, 'Abogado', 1004);

INSERT INTO empleados (id_empleado, e_nombre, e_apellido, sexo, fecha_nac, fecha_ing, salario, comision, cargo, id_departamento)
	VALUES (311178148, 'Pedro', 'López', 'M', '1995-03-28', '2018-09-15', 430000, 38000, 'Analista', 1005);

INSERT INTO empleados (id_empleado, e_nombre, e_apellido, sexo, fecha_nac, fecha_ing, salario, comision, cargo, id_departamento)
	VALUES (311178149, 'Laura', 'Fernández', 'F', '1991-08-10', '2017-04-25', 490000, 48000, 'Supervisor', 1000);

INSERT INTO empleados (id_empleado, e_nombre, e_apellido, sexo, fecha_nac, fecha_ing, salario, comision, cargo, id_departamento)
	VALUES (311178150, 'Diego', 'Pérez', 'M', '1987-11-22', '2012-08-30', 510000, 52000, 'Supervisor', 1001);
    
 INSERT INTO empleados (id_empleado, e_nombre, e_apellido, sexo, fecha_nac, fecha_ing, salario, comision, cargo, id_departamento)
	VALUES (311178151, 'Andrea', 'López', 'F', '1990-10-01', '2013-01-30', 500000, 51000, 'Supervisor', 1001);   

-- Chequeo carga de datos    
SELECT *
FROM empleados;

SELECT *
FROM departamentos;

    
-- Obtener los nombres de los empleados
SELECT e_nombre, e_apellido 
FROM empleados;

-- Mostrar los datos completos de los departamentos
SELECT * 
FROM departamentos;

-- Obtener los datos de empleados con cargo
SELECT * 
FROM empleados 
WHERE cargo = "Supervisor";

-- Mostrar la cantidad de empleados registrados
SELECT COUNT(*) 
AS "Cantidad Empleados"
FROM empleados;
 
-- Sacar un promedio de salarios de empleados
SELECT ROUND(AVG(salario),2) 
AS "Salario Promedio"
FROM empleados; 

-- Lista los nombres de los departamentos ordenados por ciudad
SELECT d_ciudad, d_nombre 
FROM departamentos ORDER BY d_ciudad;

-- Muestra un listado de salarios y comisiones de los empleados del departamento
SELECT e.e_nombre, e.e_apellido, e.salario, e.comision, d.d_nombre AS nombre_departamento
FROM empleados e
INNER JOIN departamentos d 
ON e.id_departamento = d.id_departamento
WHERE d.d_nombre = 'Innovación y Desarrollo';

/*Calcular el valor a pagar a cada empleado si se realiza un incremento del 25%
en su salario más una bonificación de $20000, muestre una columna con el
salario actual, otra con el incremento y otra con la suma de todo*/

SELECT e_nombre, e_apellido, salario AS "Salario Actual", 
(salario * 0.25) AS Aumento,
20000 AS Bonificación,
(salario * 1.25 + 20000) AS "Salario Total"
FROM empleados;

-- Editar el salario realizando el incremento del punto anterior
UPDATE empleados 
SET salario = (salario * 1.25 + 20000)
WHERE cargo = "Analista"; -- Lo impacto sólo a los analistas para no modificar toda la tabla y poder corroborar las querys"

-- Modificar la ciudad _____ a la nueva ciudad
UPDATE departamentos
SET d_ciudad = "Buenos Aires"
WHERE d_ciudad = "Mar del Plata";

-- Hallar el salario del empleado con identificación
SELECT id_empleado, e_nombre, e_apellido, salario 
FROM empleados
WHERE id_empleado = 311178147;

-- Muestre empleados donde el nombre empiece con la letra A
SELECT * 
FROM empleados
WHERE e_nombre LIKE 'A%';