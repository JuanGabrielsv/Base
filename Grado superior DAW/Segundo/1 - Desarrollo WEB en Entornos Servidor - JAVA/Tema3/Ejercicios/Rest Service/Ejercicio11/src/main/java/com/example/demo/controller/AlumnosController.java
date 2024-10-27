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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.modelo.Alumno;
import com.example.demo.modelo.Direccion;

import org.springframework.web.bind.annotation.PutMapping;

@RestController
@RequestMapping("/alumnos")
public class AlumnosController {

	List<Alumno> lAlumnos = new ArrayList<>();

	public AlumnosController() {

		lAlumnos.add(
				new Alumno(1, "nombre1", "email1", 17, "curso1", new Direccion("calle1", "codigoPostal1", "ciudad1")));
		lAlumnos.add(
				new Alumno(2, "nombre2", "email2", 22, "curso2", new Direccion("calle2", "codigoPostal2", "ciudad2")));
		lAlumnos.add(
				new Alumno(3, "nombre3", "email3", 46, "curso3", new Direccion("calle3", "codigoPostal3", "ciudad3")));
		lAlumnos.add(
				new Alumno(4, "nombre4", "email4", 18, "curso4", new Direccion("calle4", "codigoPostal4", "ciudad4")));

	}

	// Mostrar todos los alumnos
	@GetMapping
	public ResponseEntity<List<Alumno>> mostrarTodosLosAlumnos() {
		return ResponseEntity.ok(lAlumnos);
	}

	// Consultar un alumno por su email
	@GetMapping("/{parametroEmail}")
	public ResponseEntity<Alumno> consultarAlumnoPorEmail(@PathVariable String parametroEmail) {

		for (Alumno alumno : lAlumnos) {
			if (alumno.getEmail().equalsIgnoreCase(parametroEmail)) {
				return ResponseEntity.ok(alumno);
			}
		}

		return ResponseEntity.notFound().build();
	}

	// Crear un nuevo alumno
	@PostMapping("/crear")
	public ResponseEntity<List<Alumno>> crearAlumno(@RequestBody Alumno parametroAlumno) {

		for (Alumno alumno : lAlumnos) {
			if (alumno.getId().equals(parametroAlumno.getId())) {
				return null;
			}
		}

		lAlumnos.add(parametroAlumno);
		return ResponseEntity.ok(lAlumnos);

	}

	// Modificar la información de manera parcial.
	@PatchMapping
	public ResponseEntity<Alumno> modificarParcialmente(@RequestBody Alumno parametroAlumno) {

		for (Alumno alumno : lAlumnos) {
			if (alumno.getId().equals(parametroAlumno.getId())) {
				if (parametroAlumno.getCurso() != null) {
					alumno.setCurso(parametroAlumno.getCurso());
				}
				if (parametroAlumno.getEdad() != null) {
					alumno.setEdad(parametroAlumno.getEdad());
				}
				if (parametroAlumno.getEmail() != null) {
					alumno.setEmail(parametroAlumno.getEmail());
				}
				if (parametroAlumno.getNombre() != null) {
					alumno.setNombre(parametroAlumno.getNombre());
				}
				return ResponseEntity.ok(alumno);
			}
		}

		return ResponseEntity.notFound().build();
	}

	// Modificar la información de un alumno de manera total.
	@PutMapping
	public ResponseEntity<Alumno> modificarTotalmente(@RequestBody Alumno parametroAlumno) {

		for (Alumno alumno : lAlumnos) {
			if (alumno.getId().equals(parametroAlumno.getId())) {
				alumno.setId(parametroAlumno.getId());
				alumno.setCurso(parametroAlumno.getCurso());
				alumno.setEdad(parametroAlumno.getEdad());
				alumno.setEmail(parametroAlumno.getEmail());
				alumno.setNombre(parametroAlumno.getNombre());
				return ResponseEntity.ok(alumno);
			}
		}

		return ResponseEntity.notFound().build();
	}

	// Eliminar un alumno por su id.
	@DeleteMapping
	public ResponseEntity<Alumno> eliminarAlumno(@RequestBody Alumno parametroAlumno) {
		Iterator<Alumno> iterator = lAlumnos.iterator();
		while (iterator.hasNext()) {
			Alumno alumno = iterator.next();
			if (alumno.getId().equals(parametroAlumno.getId())) {
				iterator.remove();
				return ResponseEntity.ok(alumno);
			}
		}

		return ResponseEntity.notFound().build();

	}

	// Añade un método getDirecciones, que devuelva la lista de todas las
	// direcciones de todos los alumnos.
	@GetMapping("/direcciones")
	public ResponseEntity<List<Direccion>> getDirecciones() {
		List<Direccion> direcciones = new ArrayList<>();
		for (Alumno alumno : lAlumnos) {
			direcciones.add(alumno.getDireccion());
		}
		return ResponseEntity.ok(direcciones);
	}
	
	// Añade un método obtenerDireccionesPorCodigoPostal, que devuelva la lista de todas las 
	// direcciones de los alumnos que coincidan con un código postal que se pasa por URL.
	@GetMapping("/direcciones-por-codigo-postal/{parametroCodigoPostal}")
	public ResponseEntity<List<Direccion>> obtenerDireccionesPorCodigoPostal(@PathVariable String parametroCodigoPostal) {
		List<Direccion> direccionesPorCodigoPostal = new ArrayList<>();
		for (Alumno alumno : lAlumnos) {
			if(alumno.getDireccion().getCodigoPostal().equalsIgnoreCase(parametroCodigoPostal)) {
				direccionesPorCodigoPostal.add(alumno.getDireccion());
			}
		}
		
		if(direccionesPorCodigoPostal.isEmpty()) {
			return ResponseEntity.notFound().build();
		}
		
		return ResponseEntity.ok(direccionesPorCodigoPostal);
		
	}
	
	// Añade un método contarAlumnosPorCiudad, que dada una ciudad, devuelva el número de alumnos de dicha ciudad.
	@GetMapping("/contar-alumnos-por-ciudad/{parametroCiudad}")
	public ResponseEntity<Integer> contarAlumnosPorCiudad(@PathVariable String parametroCiudad) {
		Integer contador = 0;
		for (Alumno alumno : lAlumnos) {
			if(alumno.getDireccion().getCiudad().equalsIgnoreCase(parametroCiudad)) {
				contador++;
			}
		}		
		
		return ResponseEntity.ok(contador);
	}
}
