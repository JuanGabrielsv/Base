package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.model.Pasaporte;
import com.example.demo.model.Persona;
import com.example.demo.model.Proyecto;

@Service
public interface PersonaService {

	void addPersona(Persona persona1);

	void guardarPasaporte(Pasaporte pasaporte1);

	void guardarProyecto(Proyecto proyecto1);

	void asignarProyectoAPersona(Persona persona1, Proyecto proyecto1);

	List<Persona> obtenerTodasLasPersonas();

	void eliminarProyectoDePersona(Persona persona1, Proyecto proyecto2);

}
