# Primeros pasos con SQLDEVELOPER

## Conectarse como sysdba (también se puede usar el usuario SYSTEM / root)

1. Abrir cms
2. Acceder a la ruta dbhomeXE y conectarse a sqlplus como sysdba:

```
cd C:\app\[USUARIO]\product\[VERSION]\dbhomeXE
sqlplus / as sysdba
```

## Habilitar scripts

```
sql> alter session set "_ORACLE_SCRIPT"=true;
```

## Crear un usuario

```
sql> create user [NOMBRE_USUARIO] identified by [CLAVE_USUARIO]
```

## Asignarle permisos para conectarse, crear sesión y tablas como mínimo

```
sql> grant connect, create session, create table to [NOMBRE_USUARIO]
```

## Probar el acceso en sqldeveloper con dicho usuario y contraseña