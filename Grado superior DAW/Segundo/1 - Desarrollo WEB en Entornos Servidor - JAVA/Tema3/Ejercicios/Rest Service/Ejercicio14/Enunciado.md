# Ejercicio 14
Crear una aplicación para gestionar una biblioteca de películas. 
Cada película consta de:
un id, titulo, director, fecha de lanzamiento, duración (en minutos), y una lista de actores. 
De cada actor guardaremos su id, nombre y nacionalidad. Se pide obtener los siguientes CRUD
endpoints:

* Mostrar todas las películas
* Consultar una película por su título
* Crear una nueva película
* Modificar la información de una película de manera parcial y total
* Eliminar una película por su id
* Obtener todas las películas por un director específico
* Obtener todas las películas de los últimos 5 años
* Obtener la película con la mayor duración
* Obtener un mapa con los directores con más de X películas, donde la clave es el nombre del
  director y la clave el número de películas.
* Obtener la lista de todos los actores sin repetir ninguno. ¿Qué estructura de datos
  podemos usar?
* ObtenerPeliculasPorActor. Este método obtiene una lista de todas las películas en las que
  ha participado un actor específico, dado su nombre.
* ObtenerActoresPorNacionalidad. Este método obtiene todos los actores que tienen una
  nacionalidad específica dada por parámetro.