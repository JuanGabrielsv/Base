package com.example.demo.repository;

import java.util.List;

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

}
