package com.example.demo.repositorio;

import java.util.List;

import org.springframework.stereotype.Repository;
import com.example.demo.modelo.Entrada;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Transactional
@Repository
public class EntradaRepositorio {

	@PersistenceContext
	private EntityManager entityManager;

	public Entrada crearEntrada(Entrada nuevaEntrada) {
		entityManager.persist(nuevaEntrada);
		return nuevaEntrada;
	}

	public List<Entrada> obtenerEntradas() {
		return entityManager.createQuery("SELECT e FROM Entrada e", Entrada.class).getResultList();
	}

	public Void actualizarEntradaCompleta(Long id, Entrada entradaActualizada) {
		Entrada entradaAModificar = entityManager.find(Entrada.class, id);
		entradaActualizada.setId(entradaAModificar.getId());
		entityManager.merge(entradaActualizada);
		return null;
	}

	public List<Entrada> entradasNoRevisadasTaquilla() {
		return entityManager.createQuery("SELECT e FROM Entrada e WHERE e.taquilla = false", Entrada.class)
				.getResultList();
	}

	public Entrada modificarEntradaNumeroEntradas(Long id, Entrada entradaModificada) {
		Entrada entradaAModificar = entityManager.find(Entrada.class, id);
		if (entradaAModificar == null) {
			return null;
		}
		entradaAModificar.setNumeroEntradas(entradaModificada.getNumeroEntradas());
		entradaAModificar
				.setPrecioTotal(entradaAModificar.getPrecioPorEntrada() * entradaAModificar.getNumeroEntradas());
		if (entradaAModificar.getTaquilla() == false) {
			entradaAModificar.setPrecioTotal(entradaAModificar.getPrecioTotal() * 1.02);
		}
		entityManager.merge(entradaAModificar);
		return entradaAModificar;
	}

	public String borrarEntradasPorNombreComprador(String nombreComprador) {
		List<Entrada> entradasABorrar = entityManager
				.createQuery("SELECT e FROM Entrada e WHERE e.nombreComprador = :nombreComprador", Entrada.class)
				.setParameter("nombreComprador", nombreComprador).getResultList();
		Integer cantidadDeEntradasBorradas = entradasABorrar.size();
		entityManager.createQuery("DELETE FROM Entrada e WHERE e.nombreComprador = :nombreComprador")
				.setParameter("nombreComprador", nombreComprador).executeUpdate();
		return "Se han borrado " + cantidadDeEntradasBorradas + " entradas";
	}
	
	public String modificarPeliculaPorVariable(Long id, String pelicula, String horario) {
		Entrada entradaAModificar = entityManager.find(Entrada.class, id);
		entradaAModificar.setId(id);
		entradaAModificar.setPelicula(pelicula);
		entradaAModificar.setHorario(horario);
		entityManager.merge(entradaAModificar);
		String peliculaModificada = entityManager.find(Entrada.class, id).getPelicula();
		return peliculaModificada;
	}
}
