package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.example.demo.model.Persona;
import com.example.demo.service.PersonaService;

@SpringBootApplication
public class Ejercicio18Application implements CommandLineRunner {

	public static void main(String[] args) {
		SpringApplication.run(Ejercicio18Application.class, args);

	}
	
	@Autowired
	private PersonaService personaService;

	@Override
	public void run(String... args) throws Exception {
		
		Persona persona1 = new Persona("juan perez", null, null);

		personaService.addPersona(persona1);
	}

}
