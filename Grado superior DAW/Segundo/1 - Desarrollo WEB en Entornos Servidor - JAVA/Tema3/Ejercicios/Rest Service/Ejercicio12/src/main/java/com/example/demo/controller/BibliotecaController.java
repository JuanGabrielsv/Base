package com.example.demo.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.modelo.Libro;

@RestController
@RequestMapping("/biblioteca")
public class BibliotecaController {

	private List<Libro> lLibros = new ArrayList<>();

	public BibliotecaController() {

		lLibros.add(new Libro(1, "Titulo1", "Autor1", "Editorial1", "Isbn1", 1977,
				List.of("genero1", "Novela", "genero3", "genero4")));
		lLibros.add(new Libro(2, "Titulo2", "Autor2", "Editorial2", "Isbn2", 1999,
				List.of("genero1", "genero2", "genero3", "genero4")));
		lLibros.add(new Libro(3, "Titulo3", "Autor3", "Editorial3", "Isbn3", 2021,
				List.of("genero1", "novela", "genero3", "genero4")));
		lLibros.add(new Libro(4, "Titulo4", "Autor4", "Editorial4", "Isbn4", 1983,
				List.of("genero1", "genero2", "genero3", "genero4")));
		lLibros.add(new Libro(5, "Titulo5", "Autor5", "Editorial5", "Isbn5", 2012,
				List.of("genero1", "genero2", "genero3", "genero4")));

	}

	// Mostrar todos los libros.
	@GetMapping
	public ResponseEntity<List<Libro>> getLibros() {
		return ResponseEntity.ok(lLibros);
	}

	// Consultar un libro por su título.
	@GetMapping("/consultar-libro-por-titulo")
	public ResponseEntity<Libro> getLibroPorTitulo(@RequestBody Libro parametroLibro) {
		for (Libro libro : lLibros) {
			if (libro.getTitulo().equalsIgnoreCase(parametroLibro.getTitulo())) {
				return ResponseEntity.ok(libro);
			}
		}

		return ResponseEntity.notFound().build();
	}

	// Crear un nuevo libro
	@PostMapping
	public ResponseEntity<Libro> setLibro(@RequestBody Libro parametroLibro) {
		for (Libro libro : lLibros) {
			if (libro.getId().equals(parametroLibro.getId())) {
				return null;
			}
		}

		lLibros.add(parametroLibro);

		for (Libro libro : lLibros) {
			if (libro.getId().equals(parametroLibro.getId())) {
				return ResponseEntity.ok(libro);
			}
		}

		return null;
	}

	// Modificar la información de un libro de manera parcial.
	@PatchMapping("/modificar-libro-parcial")
	public ResponseEntity<Libro> modificarLibroParcial(@RequestBody Libro parametroLibro) {

		for (Libro libro : lLibros) {
			if (libro.getId().equals(parametroLibro.getId())) {
				libro.setId(parametroLibro.getId());
				if (parametroLibro.getAnoPublicacion() != null) {
					libro.setAnoPublicacion(parametroLibro.getAnoPublicacion());
				}
				if (parametroLibro.getAutor() != null) {
					libro.setAutor(parametroLibro.getAutor());
				}
				if (parametroLibro.getEditorial() != null) {
					libro.setEditorial(parametroLibro.getEditorial());
				}
				if (parametroLibro.getIsbn() != null) {
					libro.setIsbn(parametroLibro.getIsbn());
				}
				if (parametroLibro.getTitulo() != null) {
					libro.setTitulo(parametroLibro.getTitulo());
				}
				if (!parametroLibro.getGeneros().isEmpty()) {
					libro.setGeneros(parametroLibro.getGeneros());
				}
				return ResponseEntity.ok(libro);
			}
		}

		return ResponseEntity.notFound().build();
	}

	// Modificar la información de un libro de manera total.
	@PutMapping("/modificar-libro-completo")
	public ResponseEntity<Libro> modificarLibroCompleto(@RequestBody Libro parametroLibro) {
		for (Libro libro : lLibros) {
			if (libro.getId().equals(parametroLibro.getId())) {
				libro.setId(parametroLibro.getId());
				libro.setAnoPublicacion(parametroLibro.getAnoPublicacion());
				libro.setAutor(parametroLibro.getAutor());
				libro.setEditorial(parametroLibro.getEditorial());
				libro.setGeneros(parametroLibro.getGeneros());
				libro.setIsbn(parametroLibro.getIsbn());
				libro.setTitulo(parametroLibro.getTitulo());
				return ResponseEntity.ok(libro);
			}
		}

		return ResponseEntity.notFound().build();
	}

	// Eliminar un libro por su ID.
	@DeleteMapping("/eliminar/{parametroId}")
	public ResponseEntity<List<Libro>> eliminarLibro(@PathVariable Integer parametroId) {
		Iterator<Libro> iterator = lLibros.iterator();
		while (iterator.hasNext()) {
			Libro libro = iterator.next();
			if (libro.getId().equals(parametroId)) {
				iterator.remove();
				return ResponseEntity.ok(lLibros);
			}
		}

		return ResponseEntity.notFound().build();
	}

	// ObtenerNovelas: Devuelve una lista de los libros cuyo genero sea novela.
	@GetMapping("/libros-genero-novela")
	public ResponseEntity<List<Libro>> librosGeneroNovela() {
		List<Libro> lLibroGeneroNovela = new ArrayList<>();
		for (Libro libro : lLibros) {
			for (String genero : libro.getGeneros()) {
				if (genero.equalsIgnoreCase("Novela")) {
					lLibroGeneroNovela.add(libro);
				}
			}
		}

		if (lLibroGeneroNovela.isEmpty()) {
			return ResponseEntity.notFound().build();
		} else {
			return ResponseEntity.ok(lLibroGeneroNovela);
		}
	}

	// ObtenerPorGenero: Dado un atributo género que se pasa por URL, devolver el
	// listado de libros que sean de dicho género.
	@GetMapping("/obtener-por-genero/{parametroGenero}")
	public ResponseEntity<List<Libro>> obtenerLibroPorGenero(@PathVariable String parametroGenero) {
		List<Libro> lLibroPorGenero = new ArrayList<>();
		for (Libro libro : lLibros) {
			for (String genero : libro.getGeneros()) {
				if (genero.equalsIgnoreCase(parametroGenero)) {
					lLibroPorGenero.add(libro);
				}
			}
		}

		if (lLibroPorGenero.isEmpty()) {
			return ResponseEntity.notFound().build();
		} else {
			return ResponseEntity.ok(lLibroPorGenero);
		}

	}

}
