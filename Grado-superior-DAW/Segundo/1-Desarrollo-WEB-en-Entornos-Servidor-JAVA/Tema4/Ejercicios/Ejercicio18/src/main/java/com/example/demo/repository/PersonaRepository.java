package com.example.demo.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.model.Pasaporte;
import com.example.demo.model.Persona;
import com.example.demo.model.Proyecto;

@Repository
public interface PersonaRepository {

	void addPersona(Persona persona1);

	void guardarPasaporte(Pasaporte pasaporte1);

	void guardarProyecto(Proyecto proyecto1);

	void asignarProyectoAPersona(Persona persona1, Proyecto proyecto1);

	Persona buscarPersonaPorId(Integer id);

	Proyecto buscarProyectoPorId(Integer id);

	List<Persona> obtenerTodasLasPersonas();

	void eliminarProyectoDePersona(Persona persona1, Proyecto proyecto2);

}
