-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Escriba una consulta que devuelva los cinco valores diferentes más pequeños 
-- de la tercera columna.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<

-- Crear una tabla para los datos
DROP TABLE IF EXISTS data_table;
CREATE TABLE data_table (
    letter STRING,
    record_date STRING,
    value INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';

-- Cargar los datos en la tabla
LOAD DATA LOCAL INPATH 'data.tsv' INTO TABLE data_table;

-- Seleccionar los 5 valores mínimos únicos de la tercera columna ordenados
DROP TABLE IF EXISTS min_values;
CREATE TABLE min_values AS
SELECT DISTINCT value
FROM data_table
ORDER BY value ASC
LIMIT 5;

-- Exportar el resultado a la carpeta output
INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\n'
SELECT value
FROM min_values;

