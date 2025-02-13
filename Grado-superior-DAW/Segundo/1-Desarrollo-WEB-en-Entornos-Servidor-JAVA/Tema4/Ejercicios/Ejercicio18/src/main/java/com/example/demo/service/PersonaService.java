package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.model.Pasaporte;
import com.example.demo.model.Persona;
import com.example.demo.model.Proyecto;

@Service
public interface PersonaService {

	void addPersona(Persona persona1);

	void guardarPasaporte(Pasaporte pasaporte1);

	void guardarProyecto(Proyecto proyecto1);

}
