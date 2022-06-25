/*

Pregunta
===========================================================================

Escriba una consulta que retorne para cada valor único de la columna `t0.c2`, 
los valores correspondientes de la columna `t0.c1`. 

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

*/

DROP TABLE IF EXISTS tbl0;
CREATE TABLE tbl0 (
    c1 INT,
    c2 STRING,
    c3 INT,
    c4 DATE,
    c5 ARRAY<CHAR(1)>, 
    c6 MAP<STRING, INT>
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'data0.csv' INTO TABLE tbl0;

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
LOAD DATA LOCAL INPATH 'data1.csv' INTO TABLE tbl1;

/*
    >>> Escriba su respuesta a partir de este punto <<<
*/

DROP TABLE IF EXISTS table1;
CREATE TABLE tabla1 (valor INT, letra STRING);
INSERT OVERWRITE TABLE tabla1 SELECT tbl0.c1, tbl0.c2  FROM tbl0;
DROP TABLE IF EXISTS solucion;
CREATE TABLE solucion (valor INT, letra STRING);
INSERT OVERWRITE TABLE solucion SELECT letra, concat_ws(':',collect_set(valor)) FROM tabla1 GROUP BY letra;

INSERT OVERWRITE LOCAL DIRECTORY './output' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' SELECT * FROM solucion;
