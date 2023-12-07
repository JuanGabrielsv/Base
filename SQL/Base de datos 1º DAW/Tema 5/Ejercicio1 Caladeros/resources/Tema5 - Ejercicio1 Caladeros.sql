CREATE TABLE barcos (
    matricula VARCHAR2(100) PRIMARY KEY,
    nombre VARCHAR2(100),
    clase VARCHAR2(100),
    armador VARCHAR2(100),
    capacidad INT,
    nacionalidad VARCHAR2(100)
    );
    
CREATE TABLE lotes (
    codigo_lotes INT PRIMARY KEY,
    matricula VARCHAR2(100),