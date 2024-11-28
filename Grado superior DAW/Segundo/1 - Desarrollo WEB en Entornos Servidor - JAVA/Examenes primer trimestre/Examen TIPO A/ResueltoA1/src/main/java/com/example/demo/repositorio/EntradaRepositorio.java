package com.example.demo.repositorio;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.modelo.Entrada;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Repository
public class EntradaRepositorio {

	@PersistenceContext
	private EntityManager entityManager;

	// A)
	
	public Entrada postNuevaEntrada(Entrada nuevaEntrada) {
		entityManager.persist(nuevaEntrada);
		return nuevaEntrada;
	}

	// B)

	public List<Entrada> getTodasLasEntradas() {
		return entityManager.createQuery("SELECT e FROM Entrada e", Entrada.class).getResultList();
	}

}
