
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.modelo.Actor;
import com.example.demo.modelo.Pelicula;

@RestController
@RequestMapping("biblioteca")
public class BibliotecaController {
		
	private List<Pelicula> listaPeliculas;	

	public BibliotecaController() {
		
		listaPeliculas = new ArrayList<>();
		
		List<Actor> listaActores1 = new ArrayList<>();
		List<Actor> listaActores2 = new ArrayList<>();
		List<Actor> listaActores3 = new ArrayList<>();
		List<Actor> listaActores4 = new ArrayList<>();
		List<Actor> listaActores5 = new ArrayList<>();

		listaActores1.add(new Actor("1", "Pepito", "Uruguayo"));
		listaActores2.add(new Actor("2", "Manolito", "Español"));
		listaActores3.add(new Actor("3", "Laura", "Francesa"));
		listaActores4.add(new Actor("4", "Maria", "Alemana"));
		listaActores5.add(new Actor("5", "Herminio", "Americana"));

		listaPeliculas.add(new Pelicula("1", "E.T", "Director1", LocalDate.of(1988, 5, 15), 90, listaActores1));
		listaPeliculas.add(new Pelicula("2", "WakaWaka", "Director2", LocalDate.of(2005, 3, 11), 100, listaActores2));
		listaPeliculas.add(new Pelicula("3", "Hola Caracola", "Director3", LocalDate.of(1988, 8, 1), 110, listaActores3));
		listaPeliculas.add(new Pelicula("4", "Que hace rayos lase", "Director4", LocalDate.of(1988, 1, 25), 60,
				listaActores4));
		listaPeliculas
				.add(new Pelicula("5", "E.T2", "Director4", LocalDate.of(1988, 3, 29), 120, listaActores5));
	}

	// CONSULTAR todas las películas.
	@GetMapping("/todaslaspeliculas")
	public ResponseEntity<List<Pelicula>> consultarTodasPeliculas() {
		return ResponseEntity.ok(listaPeliculas);
	}

	// CONSULTAR una película por su título.
	@GetMapping("/{titulo}")
	public ResponseEntity<Pelicula> consultarPeliculaPorTitulo(@PathVariable String titulo) {

		for (Pelicula pelicula : listaPeliculas) {
			if (pelicula.getTitulo().equalsIgnoreCase(titulo)) {
				return ResponseEntity.ok(pelicula);
			}
		}
		return ResponseEntity.notFound().build();
	}

	// CREAR una nueva película.
	@PostMapping("/meterpelicula")
	public ResponseEntity<List<Pelicula>> crearNuevaPelicula(@RequestBody Pelicula pelicula) {
		listaPeliculas.add(pelicula);
		return ResponseEntity.ok(listaPeliculas);
	}

	// MODIFICAR la información de una película de manera parcial y total.
	@PutMapping("/modificarpelicula")
	public ResponseEntity<Pelicula> modificarPelicula(@RequestBody Pelicula pelicula) {

		for (Pelicula peli : listaPeliculas) {			
			if (peli.getId().equals(pelicula.getId())) {				
				peli.setDirector(pelicula.getDirector());
				peli.setDuracion(pelicula.getDuracion());
				peli.setFechaLanzamiento(pelicula.getFechaLanzamiento());
				peli.setListaActores(pelicula.getListaActores());
				peli.setTitulo(pelicula.getTitulo());
				
				return ResponseEntity.ok(pelicula);				
			} 
		}

		return ResponseEntity.notFound().build();
	}

}
