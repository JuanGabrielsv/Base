package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.example.demo.model.Pasaporte;
import com.example.demo.model.Persona;
import com.example.demo.model.Proyecto;
import com.example.demo.service.PersonaService;

@SpringBootApplication
public class Ejercicio18Application implements CommandLineRunner {

	public static void main(String[] args) {
		SpringApplication.run(Ejercicio18Application.class, args);

	}

	@Autowired
	private PersonaService service;

	@Override
	public void run(String... args) throws Exception {

		Persona persona1 = new Persona("juan perez", null, null);
		Persona persona2 = new Persona("Ana Lopez", null, null);		

		service.addPersona(persona1);
		service.addPersona(persona2);
		
		Pasaporte pasaporte1 = new Pasaporte("ABC123", null);
		Pasaporte pasaporte2 = new Pasaporte("XYZ456", null);
		
		service.guardarPasaporte(pasaporte1);
		service.guardarPasaporte(pasaporte2);
		
		Proyecto proyecto1 = new Proyecto("Proyecto Alpha", null);
		
		service.guardarProyecto(proyecto1);
		
		persona1.setPasaporte(pasaporte1);
		persona2.setPasaporte(pasaporte2);
		
		
		
	}

}
