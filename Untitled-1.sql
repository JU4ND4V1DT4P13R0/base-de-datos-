/*
CREAR TABLA
*/
CREATE TABLE usuarios(
    /*ejecutar el codigo en maridb en mysql no null siempre haber datos null puede quedar vacio default para pasar un valor 
    */

    codigo        int(15) auto_increment no null,
    descripcion   varchar(50) no null,
    valor         decimal(10) no null,
    fecha         int(10) no null,
    password      varchar(255),
    constraint    pk_usuarios primary key(id) 
);