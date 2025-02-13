package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Pasaporte;
import com.example.demo.model.Persona;
import com.example.demo.model.Proyecto;
import com.example.demo.repository.PersonaRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class PersonaServiceImpl implements PersonaService {

	@Autowired
	private PersonaRepository repositorio;

	@Override	
	public void addPersona(Persona persona1) {
		repositorio.addPersona(persona1);
	}

	@Override
	public void guardarPasaporte(Pasaporte pasaporte1) {
		repositorio.guardarPasaporte(pasaporte1);		
	}

	@Override
	public void guardarProyecto(Proyecto proyecto1) {
		repositorio.guardarProyecto(proyecto1);

		
	}

}
