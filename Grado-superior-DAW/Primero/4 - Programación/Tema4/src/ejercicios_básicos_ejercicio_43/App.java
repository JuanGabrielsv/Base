/*
EJERCICIO 43
Nota: utiliza lo que has aprendido de herencia y de clases abstractas.

Necesitamos programar una aplicación para gestionar una base de datos de películas. De cada
película recogeremos los siguientes datos (tendremos que tener métodos get() y set() para
ellos):

	• Año de estreno
	• Título
	• Lista de actores
	• Su guionista
	• Su director
	
Tanto actores como guionistas y directores se identifican por su nombre, año de nacimiento y
nacionalidad. Cada una de estas clases tendrá que tener:

	• Métodos get() y set() de todos esos atributos.
	• Método getSueldo(), que es constante para cada tipo:
		o Los actores cobran 100.000 euros
		o Los guionistas cobran 50.000 euros
		o Los directores cobran 200.000 euros.
		
Crea las clases necesarias para gestionar esta aplicación. Cuando termines, realiza un
programa que haga lo siguiente:

1. Crea 4 actores:
	a. Blas Blau de España nacido en 1983
	b. Laura Pozo de Italia nacida en 1981
	c. Marcel Cade de Suiza nacido en 2001
	d. Violeta Volo de Rusia nacida en 1999
	
2. Crea 1 directora:
	a. Sara Marea de Portugal nacida en 1994
	
3. Crea 2 guionistas:
	a. Marco Smith de Reino Unido nacido en 1988
	b. Cheng Shu de China nacido en 1977
	
4. Crea una película que se estrena en 2027 dirigida por Sara y con Marco como guionista. Actuarán Blas y Laura. Su título es “Do you know Joe Blas?”
5. Crea otra película con el mismo año de estreno y directora. El guionista es el chino, y participan todos los actores. Su título es “Muerte en la sombra”
6. Imprime la lista de actores de la primera película
7. Imprime el sueldo del guionista de la primera película y su nacionalidad
8. Borra al actor suizo de la segunda película y añádelo a la primera
9. Imprime los actores de las dos películas 
*/
package ejercicios_básicos_ejercicio_43;

public class App {

	public static void main(String[] args) {

		/* 1. Crea 4 actores: */
		// a. Blas Blau de España nacido en 1983
		// b. Laura Pozo de Italia nacida en 1981
		// c. Marcel Cade de Suiza nacido en 2001
		// d. Violeta Volo de Rusia nacida en 1999

		Actor actorA = new Actor("Blas Blau", "España", 1983);
		Actor actorB = new Actor("Laura Pozo", "Italia", 1981);
		Actor actorC = new Actor("Marcel Cade", "Suiza", 2001);
		Actor actorD = new Actor("Violeta Volo", "Rusia", 1999);

		/* 2. Crea 1 directora: */
		// a. Sara Marea de Portugal nacida en 1994

		Director directoraA = new Director("Sara Marea", "Portugal", 1994);

		/* 3. Crea 2 guionistas: */
		// a. Marco Smith de Reino Unido nacido en 1988
		// b. Cheng Shu de China nacido en 1977

		Guionista guionistaA = new Guionista("Marco Smith", "Reino Unido", 1988);
		Guionista guionistaB = new Guionista("Cheng Shu", "China", 1977);

		// 4. Crea una película que se estrena en 2027 dirigida por Sara y con Marco
		// como guionista.
		// Actuarán Blas y Laura. Su título es “Do you know Joe Blas?”

		Pelicula pelicula1 = new Pelicula();
		pelicula1.setAnoEstreno(2027);
		pelicula1.setDirector(directoraA);
		pelicula1.setGuionista(guionistaA);
		pelicula1.setTitulo("Do you know Joe Blas?");
		pelicula1.getListaActores().add(actorA);
		pelicula1.getListaActores().add(actorB);

		// 5. Crea otra película con el mismo año de estreno y directora. El guionista
		// es el chino, y participan todos los actores.
		// Su título es “Muerte en la sombra”.

		Pelicula pelicula2 = new Pelicula();
		pelicula2.setAnoEstreno(2027);
		pelicula2.setDirector(directoraA);
		pelicula2.setGuionista(guionistaB);
		pelicula2.setTitulo("Muerte en la sombra");
		pelicula2.getListaActores().add(actorA);
		pelicula2.getListaActores().add(actorB);
		pelicula2.getListaActores().add(actorC);
		pelicula2.getListaActores().add(actorD);

		// 6. Imprime la lista de actores de la primera película.

		System.out.println(pelicula1.getListaActores());

		// 7. Imprime el sueldo del guionista de la primera película y su nacionalidad.

		System.out.println(pelicula1.getGuionista().getSueldo() + " " + pelicula1.getGuionista().getNacionalidad());

		// 8. Borra al actor suizo de la segunda película y añádelo a la primera.

		pelicula2.getListaActores().remove(actorC);
		pelicula1.getListaActores().add(actorC);

		// 9. Imprime los actores de las dos películas.

		System.out.println(pelicula1.getListaActores());
		System.out.println(pelicula2.getListaActores());

	}

}
