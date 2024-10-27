package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.modelo.Alumno;

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
	
	//1 Mostrar todos los alumnos
	@GetMapping
	public ResponseEntity<List<Alumno>> mostrarTodosLosAlumnos(){		
		return ResponseEntity.ok(lAlumnos);
	}
	
	//2 Consultar un alumno por su email
	@GetMapping("/{parametroEmail}")
	public ResponseEntity<Alumno> consultarAlumnoPorEmail(@PathVariable String parametroEmail){
		
		for (Alumno alumno : lAlumnos) {
			if(alumno.getEmail().equalsIgnoreCase(parametroEmail)) {
				return ResponseEntity.ok(alumno);
			}
		}
		
		return ResponseEntity.notFound().build();
	}
	
	//3 Crear un nuevo alumno
	@PostMapping("/crear")
	public ResponseEntity<List<Alumno>> crearAlumno(@RequestBody Alumno parametroAlumno){
		
		for (Alumno alumno : lAlumnos) {
			if(alumno.getId().equals(parametroAlumno.getId())) {
				return null;
			} 
		}
		
		lAlumnos.add(parametroAlumno); 
		return ResponseEntity.ok(lAlumnos);
		
	}

}
