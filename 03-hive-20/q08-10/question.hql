-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que para cada valor único de la columna `t0.c2,` 
-- calcule la suma de todos los valores asociados a las claves en la columna 
-- `t0.c6`.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
--
-- >>> Escriba su respuesta a partir de este punto <<<

DROP TABLE IF EXISTS tbl0;
CREATE TABLE tbl0 (
    c1 INT,
    c2 STRING,
    c3 INT,
    c4 DATE,
    c5 STRING, 
    c6 STRING
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- Cargar los datos en la tabla tbl0
LOAD DATA LOCAL INPATH 'tbl0.csv' INTO TABLE tbl0;

-- Crear la tabla para tbl1.csv si no existe
DROP TABLE IF EXISTS tbl1;
CREATE TABLE tbl1 (
    c1 INT,
    c2 INT,
    c3 STRING,
    c4 MAP<STRING, INT>
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';

-- Cargar los datos en la tabla tbl1
LOAD DATA LOCAL INPATH 'tbl1.csv' INTO TABLE tbl1;

-- Explodear la columna c6 en tbl0 para obtener las claves y valores separados
DROP TABLE IF EXISTS tbl0_exploded;
CREATE TABLE tbl0_exploded AS
SELECT
    t0.c2 AS letra,
    split(kv, '#')[0] AS clave,
    split(kv, '#')[1] AS valor_str
FROM tbl0 t0
LATERAL VIEW explode(split(t0.c6, ':')) exploded AS kv;

-- Convertir los valores a INT
DROP TABLE IF EXISTS tbl0_exploded_int;
CREATE TABLE tbl0_exploded_int AS
SELECT
    letra,
    clave,
    CAST(valor_str AS INT) AS valor
FROM tbl0_exploded;

-- Unir tbl0_exploded_int con tbl1 para obtener los valores correspondientes
DROP TABLE IF EXISTS tbl_final;
CREATE TABLE tbl_final AS
SELECT 
    t0.letra,
    t0.valor
FROM tbl0_exploded_int t0
JOIN tbl1 t1
ON t0.clave = t1.c3;

-- Sumar los valores por letra
INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT letra, SUM(valor) AS total_valor
FROM tbl_final
GROUP BY letra
ORDER BY letra;