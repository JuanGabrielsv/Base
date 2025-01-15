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
import org.springframework.web.bind.annotation.PutMapping;

@RestController
@RequestMapping("/alumnos")
public class AlumnosController {

	List<Alumno> lAlumnos = new ArrayList<>();

	public AlumnosController() {

		lAlumnos.add(new Alumno(1, "nombre1", "email1", 17, "curso1"));
		lAlumnos.add(new Alumno(2, "nombre2", "email2", 22, "curso2"));
		lAlumnos.add(new Alumno(3, "nombre3", "email3", 46, "curso3"));
		lAlumnos.add(new Alumno(4, "nombre4", "email4", 18, "curso4"));

	}

	// 1 Mostrar todos los alumnos
	@GetMapping
	public ResponseEntity<List<Alumno>> mostrarTodosLosAlumnos() {
		return ResponseEntity.ok(lAlumnos);
	}

	// 2 Consultar un alumno por su email
	@GetMapping("/{parametroEmail}")
	public ResponseEntity<Alumno> consultarAlumnoPorEmail(@PathVariable String parametroEmail) {

		for (Alumno alumno : lAlumnos) {
			if (alumno.getEmail().equalsIgnoreCase(parametroEmail)) {
				return ResponseEntity.ok(alumno);
			}
		}

		return ResponseEntity.notFound().build();
	}

	// 3 Crear un nuevo alumno
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

	// 4 Modificar la información de manera parcial.
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

	// 4.1 Modificar la información de un alumno de manera total.
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

	// 5 Eliminar un alumno por su id.
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
}
