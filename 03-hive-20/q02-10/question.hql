-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Construya una consulta que ordene la tabla por letra y valor (3ra columna).
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

-- Crear una tabla para los datos ordenados sin duplicados
DROP TABLE IF EXISTS sorted_data;
CREATE TABLE sorted_data AS
SELECT letter, record_date, value
FROM data_table
GROUP BY letter, record_date, value
ORDER BY letter ASC, value ASC, record_date ASC;

-- Exportar el resultado a la carpeta output
INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT letter, record_date, value
FROM sorted_data;

