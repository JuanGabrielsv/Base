# Solución problema de conectividad sqldeveloper y oracle xe

## Acciones a llevar a cabo

1. Acceder a sqldeveloper e intentar una conexión con el usuario SYSTEM, por ejemplo. La contraseña en los equipos es root para SYSTEM.
2. Se debe poder acceder con dicho usuario y clave desde sqlplus.
3. Buscar los ficheros listener.ora y tnsnames.ora dentro de la carpeta app y modificar, donde venga HOST=xxx por HOST=localhost.
4. Parar y arrancar listener abriendo un cmd como administrador y parando y arrancando el listener:

```
lsnrctl stop
lsnrctl start
```

Si ahora aparece un error diferente relacionado con el SID en el descriptor, entonces acceder mediante sqlplus y lanzar los siguientes comandos:

```
alter system set LOCAL_LISTENER='(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521))' scope=both;
alter system register;
```

Volver a probar la conexión en sqldeveloper.

## No se puede crear usuario por sqlplus

Lanzar el siguiente comando en sqlplus para permitirlo:

```
alter session set "_ORACLE_SCRIPT"=true;
```