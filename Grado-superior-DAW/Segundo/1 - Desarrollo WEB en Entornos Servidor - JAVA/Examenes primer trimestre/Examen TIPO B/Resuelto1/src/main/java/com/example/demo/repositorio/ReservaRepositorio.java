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

	// A)

	public void crearNuevaReserva(Reserva nuevaReserva) {
		entityManager.persist(nuevaReserva);
	}

	// B)

	public List<Reserva> getTodasLasReservas() {
		return entityManager.createQuery("SELECT r FROM Reserva r", Reserva.class).getResultList();
	}

	// C)

	public Reserva buscarReservaPorId(Long id) {
		return entityManager.find(Reserva.class, id);
	}

	public Reserva actualizarReservaCompleta(Long id, Reserva reserva) {
		entityManager.merge(reserva);
		return entityManager.find(Reserva.class, id);
	}

	// D)

	public void borrarReservasCanceladas(Reserva reserva) {
		entityManager.remove(reserva);
	}

	// E)

	public Reserva modificarPrecioHabitacion(Long id, Reserva reservaAModificar) {
		entityManager.merge(reservaAModificar);
		return entityManager.find(Reserva.class, id);
	}

	// F) no procede

	// G)

	public Reserva patchClientePorNombreYNumeroNoches(Reserva reserva) {
		entityManager.merge(reserva);
		return buscarReservaPorId(reserva.getId());
	}

	// H) no procede

	// I) no procede

}
