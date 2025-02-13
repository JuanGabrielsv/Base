package com.example.demo.repository;

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

}
