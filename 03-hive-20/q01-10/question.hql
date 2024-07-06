-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Compute la cantidad de registros por cada letra de la columna 1.
-- Escriba el resultado ordenado por letra. 
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<

-- Crear una tabla para los datos
CREATE TABLE IF NOT EXISTS data_table (
    letter STRING,
    record_date STRING,
    value INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';

-- Cargar los datos en la tabla
LOAD DATA LOCAL INPATH 'data.tsv' INTO TABLE data_table;

-- Computar la cantidad de registros por cada letra de la columna 1
CREATE TABLE IF NOT EXISTS output_table AS
SELECT letter, COUNT(*) AS count
FROM data_table
GROUP BY letter
ORDER BY letter;

-- Exportar el resultado a la carpeta output
INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT letter, count
FROM output_table;


