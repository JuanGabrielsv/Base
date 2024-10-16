
package com.example.demo.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.modelo.Actor;
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
		
		listaActores1.add(new Actor("1","Pepito","Uruguayo"));
		listaActores2.add(new Actor("1","Manolito","Español"));
		listaActores3.add(new Actor("1","Laura","Francesa"));
		listaActores4.add(new Actor("1","Maria","Alemana"));
		listaActores5.add(new Actor("1","Herminio","Americana"));				
		
		listaPeliculas.add(new Pelicula( "1", "E.T", "Steven Spielberg", LocalDate.of(1988, 5, 15), 90, listaActores1));
		listaPeliculas.add(new Pelicula( "2", "WakaWaka", "Steven Spielberg", LocalDate.of(2005, 3, 11), 100,listaActores2));
		listaPeliculas.add(new Pelicula( "3", "Hola Caracola", "Steven Spielberg", LocalDate.of(1988, 8, 1), 110,listaActores3));
		listaPeliculas.add(new Pelicula( "4", "Que hace rayos lase", "Steven Spielberg", LocalDate.of(1988, 1, 25), 60,listaActores4));
		listaPeliculas.add(new Pelicula( "5", "E.T2", "Steven Spielberg", LocalDate.of(1988, 3, 29), 120,listaActores5));		
	}
	
	// Mostrar todas las películas.
	@GetMapping("todaslaspeliculas")
	public List<Pelicula> listaPeliculas(){
		return listaPeliculas;
	}
	
	//Consultar una película por su título.
	@GetMapping("{titulo}")
	public ResponseEntity<Pelicula> consultarPeliculaPorTitulo(@PathVariable String titulo) {
		
		for (Pelicula pelicula : listaPeliculas) {
			if (pelicula.getTitulo().equals(titulo)) {
				return ResponseEntity.ok(pelicula);				
			}			
		}		
		return ResponseEntity.notFound().build();
	}
	
	//Crear una nueva película.
	@PostMapping("meterpelicula")
	public ResponseEntity<List<Pelicula>> introducirCliente(@RequestBody Pelicula pelicula) {		
		listaPeliculas.add(pelicula);		
		return ResponseEntity.ok(listaPeliculas);
	}
	
	//Modificar la información de una película de manera parcial y total.
	@PutMapping("path/{id}")
	public String putMethodName(@PathVariable String id, @RequestBody String entity) {
		//TODO: process PUT request
		
		return entity;
	}
	
	
	
	

}
