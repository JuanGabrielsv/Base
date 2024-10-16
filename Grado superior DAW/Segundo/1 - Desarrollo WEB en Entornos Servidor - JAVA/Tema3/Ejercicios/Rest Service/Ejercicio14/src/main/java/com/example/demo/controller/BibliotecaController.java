
package com.example.demo.controller;

import java.time.LocalDate;

import com.example.demo.modelo.Pelicula;

public class BibliotecaController {
	
	public BibliotecaController() {		
		
		Pelicula pelicula1 = new Pelicula( "1", "E.T", "Steven Spielberg", LocalDate.of(1988, 5, 15), 90);
		Pelicula pelicula2 = new Pelicula( "2", "WakaWaka", "Steven Spielberg", LocalDate.of(2005, 3, 11), 100);
		Pelicula pelicula3 = new Pelicula( "3", "Hola Caracola", "Steven Spielberg", LocalDate.of(1988, 8, 1), 110);
		Pelicula pelicula4 = new Pelicula( "4", "Que hace rayos lase", "Steven Spielberg", LocalDate.of(1988, 1, 25), 60);
		Pelicula pelicula5 = new Pelicula( "5", "E.T2", "Steven Spielberg", LocalDate.of(1988, 3, 29), 120);
		
	}
	

}
