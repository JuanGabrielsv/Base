package com.example.demo.repositorio;

import org.springframework.stereotype.Repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Repository
public class EntradaRepositorio {
	
	@PersistenceContext
	private EntityManager entityManager;

}
