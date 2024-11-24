package com.example.demo.repositorio;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.example.demo.modelo.Reserva;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Repository
public class ReservaRepositorio {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	// B)
	
	public List<Reserva> getTodasLasReservas() {
		return entityManager.createQuery("SELECT r FROM Reserva r", Reserva.class).getResultList();
	}

}
