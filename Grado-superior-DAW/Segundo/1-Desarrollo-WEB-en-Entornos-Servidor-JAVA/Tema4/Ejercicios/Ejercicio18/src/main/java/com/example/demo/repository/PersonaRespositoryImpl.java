package com.example.demo.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.model.Pasaporte;
import com.example.demo.model.Persona;
import com.example.demo.model.Proyecto;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Repository
public class PersonaRespositoryImpl implements PersonaRepository {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public void addPersona(Persona persona1) {
		entityManager.persist(persona1);
	}

	@Override
	public void guardarPasaporte(Pasaporte pasaporte1) {
		entityManager.persist(pasaporte1);
	}

	@Override
	public void guardarProyecto(Proyecto proyecto1) {
		entityManager.persist(proyecto1);
	}

	@Override
	public Persona buscarPersonaPorId(Integer id) {
		return entityManager.find(Persona.class, id);
	}

	@Override
	public Proyecto buscarProyectoPorId(Integer id) {
		return entityManager.find(Proyecto.class, id);
	}

	@Override
	public void asignarProyectoAPersona(Persona persona1, Proyecto proyecto1) {
		Persona p = buscarPersonaPorId(persona1.getId());
		Proyecto pr = buscarProyectoPorId(proyecto1.getId());

		if (p != null && pr != null) {
			p.agregarProyecto(pr);
			entityManager.merge(p);
		}

	}

	@Override
	public List<Persona> obtenerTodasLasPersonas() {

		return entityManager.createQuery("SELECT p FROM Persona p", Persona.class).getResultList();
	}

	@Override
	public void eliminarProyectoDePersona(Persona persona1, Proyecto proyecto2) {
		Persona p = buscarPersonaPorId(persona1.getId());
		Proyecto pr = buscarProyectoPorId(proyecto2.getId());

		if (p != null && pr != null) {
			p.eliminarProyecto(pr);
			entityManager.merge(p);
		}
	}

}
