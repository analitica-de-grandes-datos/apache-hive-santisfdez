/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Compute la cantidad de registros por cada letra de la columna 1.
Escriba el resultado ordenado por letra. 

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/

DROP TABLE IF EXISTS tabla1;
CREATE TABLE tabla1 (col1 STRING, col2 STRING, col3 INT) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';
LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE INTO TABLE tabla1;
SELECT col1, COUNT(col1) FROM tabla1 GROUP BY col1;
INSERT OVERWRITE LOCAL DIRECTORY '/output' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';
