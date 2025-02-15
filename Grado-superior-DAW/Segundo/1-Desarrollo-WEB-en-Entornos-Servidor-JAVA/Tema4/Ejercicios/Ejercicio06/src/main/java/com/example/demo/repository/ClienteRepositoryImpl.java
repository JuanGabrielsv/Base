package com.example.demo.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Repository;

import com.example.demo.model.Cliente;
import com.example.demo.model.Direccion;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Repository
public class ClienteRepositoryImpl implements ClienteRepository {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public void guardarCliente(Cliente cliente) {
		entityManager.persist(cliente);
	}

	@Override
	public void guardarDireccion(Direccion direccion) {
		entityManager.persist(direccion);
	}

	@Override
	public void asignarDireccion(Cliente cliente, Direccion direccion) {
		Cliente c = entityManager.find(Cliente.class, cliente.getId());
		Direccion d = entityManager.find(Direccion.class, direccion.getId());

		if (c != null && d != null) {
			c.setDireccion(d);
			entityManager.merge(c);
		}

	}

	@Override
	public List<Cliente> obtenerListaTodosClientes() {
		return entityManager.createQuery("SELECT c FROM Cliente c", Cliente.class).getResultList();

	}

	@Override
	public Cliente buscarClientePorId(Integer i) {
		return entityManager.find(Cliente.class, i);
	}

	@Override
	public void modificarCliente(Cliente cliente, String nuevoNombre) {
		Cliente c = entityManager.find(Cliente.class, cliente.getId());
		if (c != null) {
			c.setNombre(nuevoNombre);
			entityManager.merge(c);
		}

	}

	@Override
	public List<Cliente> buscarClientesPorCiudad(String ciudad) {
		String ciudadABuscar = ciudad.toLowerCase().trim();

		// Con for
		/*
		 * List<Cliente> listaTodosLosClientes = obtenerListaTodosClientes();
		 * List<Cliente> listaClientesPorciudad = new ArrayList<>();
		 * 
		 * for (int i = 0; i < listaTodosLosClientes.size(); i++) { Cliente cliente =
		 * listaTodosLosClientes.get(i); if
		 * (cliente.getDireccion().getCiudad().toLowerCase().trim().equals(ciudadABuscar
		 * )) { listaClientesPorciudad.add(cliente); } }
		 * 
		 * return listaClientesPorciudad;
		 */

		// Trayéndonos todos lo clientes y filtrando

		List<Cliente> todosLosClientes = new ArrayList<>();
		todosLosClientes = obtenerListaTodosClientes();
		List<Cliente> clientesPorCiudadFiltrados = todosLosClientes.stream()
				.filter(cliente -> ciudadABuscar.equals(cliente.getDireccion().getCiudad().toLowerCase().trim()))
				.collect(Collectors.toList());
		return clientesPorCiudadFiltrados;

		// Con consulta SQL
		/*
		 * return entityManager.createQuery(
		 * "SELECT c FROM Cliente c JOIN c.direccion d WHERE LOWER(TRIM(d.ciudad)) = :ciudad"
		 * , Cliente.class ) .setParameter("ciudad", ciudadABuscar) .getResultList();
		 */
	}

}
