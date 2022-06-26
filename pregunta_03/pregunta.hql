/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Escriba una consulta que devuelva los cinco valores diferentes más pequeños 
de la tercera columna.

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/
DROP TABLE IF EXISTS tabla1;
CREATE TABLE tabla1 (col1 STRING, col2 DATE, col3 INT) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';
LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE INTO TABLE tabla1;
CREATE TABLE sln3 AS SELECT DISTINCT(col3) FROM tabla1 ORDER BY col3 LIMIT 5;
INSERT OVERWRITE LOCAL DIRECTORY './output' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' SELECT * FROM sln3;
