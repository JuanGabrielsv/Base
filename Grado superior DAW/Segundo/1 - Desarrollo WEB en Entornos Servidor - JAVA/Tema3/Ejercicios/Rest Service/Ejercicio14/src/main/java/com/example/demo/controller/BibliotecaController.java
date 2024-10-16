
package com.example.demo.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.modelo.Actor;
import com.example.demo.modelo.Cliente;
import com.example.demo.modelo.Pelicula;

@RestController
public class BibliotecaController {
	
	List<Pelicula> listaPeliculas = new ArrayList<>();
	List<Actor> listaActores1 = new ArrayList<>();
	List<Actor> listaActores2 = new ArrayList<>();
	List<Actor> listaActores3 = new ArrayList<>();
	List<Actor> listaActores4 = new ArrayList<>();
	List<Actor> listaActores5 = new ArrayList<>();
	
	public BibliotecaController() {
		
		Actor actor1 = new Actor("1","Pepito","Uruguayo");
		Actor actor2 = new Actor("1","Manolito","Español");
		Actor actor3 = new Actor("1","Laura","Francesa");
		Actor actor4 = new Actor("1","Maria","Alemana");
		Actor actor5 = new Actor("1","Herminio","Americana");
		
		listaActores1.add(actor1);
		listaActores2.add(actor2);
		listaActores3.add(actor3);
		listaActores4.add(actor4);
		listaActores5.add(actor5);		
		
		Pelicula pelicula1 = new Pelicula( "1", "E.T", "Steven Spielberg", LocalDate.of(1988, 5, 15), 90, listaActores1);
		Pelicula pelicula2 = new Pelicula( "2", "WakaWaka", "Steven Spielberg", LocalDate.of(2005, 3, 11), 100,listaActores2);
		Pelicula pelicula3 = new Pelicula( "3", "Hola Caracola", "Steven Spielberg", LocalDate.of(1988, 8, 1), 110,listaActores3);
		Pelicula pelicula4 = new Pelicula( "4", "Que hace rayos lase", "Steven Spielberg", LocalDate.of(1988, 1, 25), 60,listaActores4);
		Pelicula pelicula5 = new Pelicula( "5", "E.T2", "Steven Spielberg", LocalDate.of(1988, 3, 29), 120,listaActores5);
		
		listaPeliculas.add(pelicula1);
		listaPeliculas.add(pelicula2);
		listaPeliculas.add(pelicula3);
		listaPeliculas.add(pelicula4);
		listaPeliculas.add(pelicula5);
		
	}
	
	@GetMapping("clientes")
	public List<Pelicula> listaPeliculas(){
		return listaPeliculas;
	}
	

}
