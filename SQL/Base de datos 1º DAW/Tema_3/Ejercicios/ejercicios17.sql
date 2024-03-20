--EJERCICIOS
--ejercicio1
drop table categorias cascade constraints;
create table categorias(
    codigo int primary key,
    descripcion varchar2(100)
);
drop table productos cascade constraints;
create table productos(
    id int primary key,
    nombre varchar2(50),
    precio number(4,2)
);

--ejercicio2
drop table cuentas_bancarias cascade constraints;
create table cuentas_bancarias(
    numero int primary key,
    saldo number(9,2)
);
drop table transacciones cascade constraints;
create table transacciones(
    codigo int primary key,
    tipo varchar2(50),
    cantidad int,
    numero int,
    foreign key(numero) references cuentas_bancarias(numero)
);

--ejercicio3
drop table aulas cascade constraints;
create table aulas(
    numero int,
    planta int,
    situacion varchar2(50),
    primary key(numero,planta)
);
drop table estudiantes cascade constraints;
create table estudiantes(
    numero_matricula int primary key,
    nombre varchar2(50),
    direccion varchar2(100)
);
drop table asignaturas cascade constraints;
create table asignaturas(
    denominacion varchar2(50),
    ciclo varchar2(50),
    primary key(denominacion,ciclo)
);
drop table estudios cascade constraints;
create table estudios(
    numero int,
    planta int,
    numero_matricula int,
    denominacion varchar2(100),
    ciclo varchar2(50),
    hora varchar2(50),
    primary key(numero,planta,numero_matricula,denominacion,ciclo),
    foreign key(numero,planta) references aulas(numero,planta),
    foreign key(numero_matricula) references estudiantes(numero_matricula),
    foreign key(denominacion,ciclo) references asignaturas(denominacion,ciclo)
);

--ejercicio4
drop table aulas cascade constraints;
create table aulas(
    numero int,
    planta int,
    situacion varchar2(50),
    primary key(numero,planta)
);
drop table estudiantes cascade constraints;
create table estudiantes(
    numero_matricula int primary key,
    nombre varchar2(50),
    direccion varchar2(100)
);
drop table asignaturas cascade constraints;
create table asignaturas(
    denominacion varchar2(50),
    ciclo varchar2(50),
    primary key(denominacion,ciclo)
);
drop table estudios cascade constraints;
create table estudios(
    id int primary key,
    numero int,
    planta int,
    numero_matricula int,
    denominacion varchar2(100),
    ciclo varchar2(50),
    hora varchar2(50),
    foreign key(numero,planta) references aulas(numero,planta),
    foreign key(numero_matricula) references estudiantes(numero_matricula),
    foreign key(denominacion,ciclo) references asignaturas(denominacion,ciclo)
);

--ejercicio5
drop table representantes cascade constraints;
create table representantes(
    id_licencia int primary key,
    nombre varchar2(50)
);
drop table actores cascade constraints;
create table actores(
    id_carne int primary key,
    nombre_a varchar2(50),
    nombre_r varchar2(50),
    id_licencia_representante int,
    contrato int,
    foreign key(id_licencia_representante) references representantes(id_licencia)
);

--ejercicio6
drop table empleados cascade constraints;
create table empleados(
    dni char(9) primary key,
    nombre varchar2(50),
    dnisupervisor char(9),
    foreign key (dnisupervisor) references empleados(dni)
);

--ejercicio7
drop table piezas cascade constraints;
create table piezas(
    codigo int primary key,
    descripcion varchar2(50)
);
drop table compuestos cascade constraints;
create table compuestos(
    codigo int,
    codigo_c int,
    primary key(codigo,codigo_c),
    foreign key (codigo_c) references piezas(codigo)
);

--ejercicio8
drop table actores cascade constraints;
create table actores(
    identificador int primary key,
    nombre varchar2(50),
    identificadorPersonaje int
);
drop table personajes cascade constraints;
create table personajes(
    identificador int primary key,
    nombre varchar2(50),
    pelicula varchar2(50),
    identificadorActor int
);
alter table actores add foreign key(identificadorPersonaje) references personajes(identificador);
alter table personajes add foreign key(identificadorActor) references actores(identificador);

--ejercicio9
drop table directivos cascade constraints;
drop table comerciales cascade constraints;
drop table tecnicos cascade constraints;
create table directivos(
    dni char(9) primary key,
    nombre varchar2(50),
    puesto varchar2(50),
    departamento varchar2(50)
);
create table comerciales(
    dni char(9) primary key,
    nombre varchar2(50),
    puesto varchar2(50),
    comision number(5,2)
);
create table tecnicos(
    dni char(9) primary key,
    nombre varchar2(50),
    puesto varchar2(50),
    equipo varchar2(50)
);

--ejercicio10
drop table alumnos cascade constraints;
drop table empresas cascade constraints;
drop table cursos cascade constraints;
drop table tipos_de_cursos cascade constraints;
drop table profesores cascade constraints;
drop table asistencia cascade constraints;
create table empresas(
    cif char(9) primary key,
    nombre varchar2(50),
    descripcion varchar2(50),
    telefono int
);
create table alumnos(
    dni char(9) primary key,
    nombre varchar2(50),
    direccion varchar2(50),
    telefono int,
    edad int,
    cif char(9),
    foreign key(cif) references empresas(cif)
);
create table tipos_de_cursos (
    identificador int primary key,
    programa varchar2(50),
    horas_duracion int,
    titulo varchar2(50)
);
create table profesores(
    dni char(9) primary key,
    nombre varchar2(50),
    apellidos varchar2(100),
    direccion varchar2(100),
    telefono int
);
create table cursos(
    codigo int primary key,
    fecha_inicio date,
    fecha_fin date,
    identificador int,
    dni_profesor char(9),
    foreign key(identificador) references tipos_de_cursos(identificador),
    foreign key(dni_profesor) references profesores(dni)
);
create table asistencia(
    dni char(9),
    codigo int,
    nota number(4,2),
    primary key(dni,codigo),
    foreign key(dni) references alumnos(dni),
    foreign key(codigo) references cursos(codigo)
);

--ejercicio11
drop table socios cascade constraints;
drop table libros cascade constraints;
drop table prestamos cascade constraints;
create table socios(
    codigo_de_socio int,
    dni char(9),
    nombre varchar2(50),
    apellidos varchar2(100),
    direccion varchar2(100),
    telefono int,
    primary key (codigo_de_socio,dni)
);
create table libros(
    isbn char(13) primary key,
    titulo varchar2(100),
    editorial varchar2(100),
    anyo_publicacion int,
    autores varchar2(100),
    anyo_edicion int,
    deteriorado varchar2(50)
);
create table prestamos(
    codigo_de_socio int,
    dni char(9),
    isbn char(13),
    fecha_prestamo date,
    fecha_devolucion date,
    fecha_real_devolucion date,
    primary key (codigo_de_socio,dni,isbn),
    foreign key(codigo_de_socio,dni) references socios(codigo_de_socio,dni),
    foreign key(isbn) references libros(isbn)
);
--ejercicio12
drop table localidades cascade constraints;
drop table provincias cascade constraints;
drop table ccaas cascade constraints;
create table ccaas(
    nombre varchar2(50) primary key,
    poblacion varchar2(50),
    superfice int
);
create table provincias(
    dosDigitosCCPP number(2) primary key,
    nombre varchar2(50),
    poblacion varchar2(50),
    nombreCCAA varchar2(50),
    foreign key(nombreCCAA) references ccaas(nombre)
);
create table localidades(
    nombre varchar2(50) primary key,
    poblacion varchar2(50),
    dosDigitosCCPP number(2),
    nombreCCAA varchar2(50),
    esCapitalProvincia char(2),
    esCapitalCCAA char(2),
    foreign key(nombreCCAA) references ccaas(nombre),
    foreign key(dosDigitosCCPP) references provincias(dosDigitosCCPP)
);
--ejercicio13
drop table actores cascade constraints;
drop table personajes cascade constraints;
drop table peliculas cascade constraints;
drop table capitulos cascade constraints;
drop table planetas cascade constraints;
drop table naves cascade constraints;
drop table personajes_peliculas cascade constraints;
drop table personajes_capitulos cascade constraints;
drop table visitas cascade constraints;
create table actores(
    id int primary key,
    nombre_completo varchar2(100),
    fecha_nacimiento date,
    nacionalidad varchar2(50),
    id_personaje int
);
create table personajes(
    id int primary key,
    nombre varchar2(100),
    raza varchar2(50),
    graduacion_militar varchar2(50),
    id_actor int,
    id_personaje_superior int
);
create table peliculas(
    id int primary key,
    anyo_lanzamiento int,
    titulo varchar2(100),
    director varchar2(50),
    id_personaje_protagonista int
);
create table capitulos(
    temporada int,
    orden int,
    titulo varchar2(100),
    fecha_1a_emision date,
    primary key(temporada,orden)
);
create table planetas(
    codigo int primary key,
    nombre varchar2(50),
    galaxia varchar2(50)
);
create table naves(
    codigo int primary key,
    nombre varchar2(50),
    n_tripulantes int
);
create table personajes_peliculas(
    id_personaje int,
    id_pelicula int,
    primary key(id_personaje,id_pelicula)
);
create table personajes_capitulos(
    id_personaje int,
    temporada int,
    orden int,
    primary key(id_personaje,temporada,orden)
);
create table visitas(
    codigo_planeta int,
    codigo_nave int,
    temporada int,
    orden int,
    primary key(codigo_planeta,codigo_nave,temporada,orden)
);
alter table actores
    add foreign key (id_personaje) references personajes(id);
alter table personajes
    add foreign key (id_actor) references actores(id);
alter table personajes
    add foreign key (id_personaje_superior) references personajes(id);
alter table peliculas
    add foreign key (id_personaje_protagonista) references personajes(id);
alter table personajes_peliculas
    add foreign key (id_personaje) references personajes(id);
alter table personajes_peliculas
    add foreign key (id_pelicula) references peliculas(id);
alter table personajes_capitulos
    add foreign key (id_personaje) references personajes(id);
alter table personajes_capitulos
    add foreign key (temporada,orden) references capitulos(temporada,orden);
--ejercicio14
drop table personajes cascade constraints;
create table personajes(
    codigo int primary key,
    nombre varchar2(50),
    graduacion varchar2(50),
    raza varchar2(50),
    fecha_nacimiento date,
    ciudad varchar2(50),
    nombre_mentor varchar2(50),
    fecha_graduacion date,
    planeta_natal varchar2(50),
    fecha_ult_combate date
);
--ejercicio15
drop table accidentes_geograficos cascade constraints;
drop table paises cascade constraints;
drop table localidades cascade constraints;
drop table localizaciones cascade constraints;
drop table pasos_rios cascade constraints;
create table accidentes_geograficos(
    posicion_horizontal number(8,4),
    posicion_vertical number(8,4),
    nombre varchar2(50),
    tipo varchar2(50),
    longitud number(5,2),
    altura number(5,2),
    extension number(5,2),
    primary key(posicion_horizontal,posicion_vertical)
);
create table paises(
    id int primary key,
    nombre varchar2(50),
    extension number(5,2),
    poblacion int
);
create table localidades(
    nombre varchar2(100),
    id int,
    primary key (nombre)
);
create table localizaciones(
    posicion_horizontal number(8,4),
    posicion_vertical number(8,4),
    id_pais int,
    primary key(posicion_horizontal,posicion_vertical,id_pais)
);
create table pasos_rios(
    posicion_horizontal number(8,4),
    posicion_vertical number(8,4),
    nombre_localidad varchar2(100),
    id_pais int,
    primary key(posicion_horizontal,posicion_vertical,nombre_localidad,id_pais)
);
alter table localizaciones
    add foreign key(posicion_horizontal,posicion_vertical) references accidentes_geograficos(posicion_horizontal,posicion_vertical);
alter table localizaciones
    add foreign key(id_pais) references paises(id);
alter table pasos_rios
    add foreign key(posicion_horizontal,posicion_vertical) references accidentes_geograficos(posicion_horizontal,posicion_vertical);
alter table pasos_rios
    add foreign key(nombre_localidad) references localidades(nombre);
alter table pasos_rios
    add foreign key(id_pais) references paises(id);
--ejercicio16
drop table empleados cascade constraints;
drop table clientes cascade constraints;
drop table tratamientos cascade constraints;
drop table servicios cascade constraints;
create table empleados(
    dni char(9) primary key,
    nombre varchar2(50),
    experiencia int
);
create table clientes(
    dni char(9) primary key,
    nombre varchar2(50),
    profesion varchar2(50),
    telefono int,
    direccion varchar2(100)
);
create table tratamientos(
    id int primary key,
    nombre varchar2(50),
    tipo varchar2(50)
);
create table servicios(
    dni_empleado char(9),
    dni_cliente char(9),
    id_tratamiento int,
    fecha date,
    primary key(dni_empleado,dni_cliente,id_tratamiento),
    foreign key(dni_empleado) references empleados(dni),
    foreign key(dni_cliente) references clientes(dni),
    foreign key(id_tratamiento) references tratamientos(id)
);
--ejercicio17
drop table trabajadores cascade constraints;
drop table platos cascade constraints;
drop table ingredientes cascade constraints;
drop table elaboraciones cascade constraints;
drop table recetas cascade constraints;
create table trabajadores(
    dni char(9) primary key,
    nombre varchar2(50),
    apellidos varchar2(100),
    telefono int,
    experiencia int,
    fecha_incorporacion date,
    puesto varchar2(50),
    dni_jefe char(9),
    foreign key(dni_jefe) references trabajadores(dni)
);
create table platos(
    id int primary key,
    nombre varchar2(50),
    tipo varchar2(50)
);
create table ingredientes(
    id int primary key,
    nombre varchar2(50)
);
create table elaboraciones(
    dni char(9),
    id_plato int,
    primary key(dni,id_plato),
    foreign key(dni) references trabajadores(dni),
    foreign key(id_plato) references platos(id)
);
create table recetas(
    id_plato int,
    id_ingrediente int,
    primary key(id_plato,id_ingrediente),
    foreign key(id_plato) references platos(id),
    foreign key(id_ingrediente) references ingredientes(id)
);