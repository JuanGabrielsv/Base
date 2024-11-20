package com.examenA.repositorio;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.examenA.modelo.Entrada;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Repository
public class EntradaRepositorio {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	public Entrada crearEntrada(Entrada entrada) {
		entityManager.persist(entrada);
		return entrada;
	}
	
	public List<Entrada> obtenerEntradas() {
		
			 return entityManager.createQuery("SELECT e FROM Entrada e", Entrada.class).getResultList();
			
	}
	
	

}
