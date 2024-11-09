package com.example.demo.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import com.example.demo.modelo.Cliente;

@Repository
public class ClienteRepository {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	public List<Cliente> obtenerClientes() {
		Query<Cliente> query = (Query<Cliente>) entityManager.createQuery("select c from Cliente c", Cliente.class);
		List<Cliente> listaCliente = query.getResultList();
		return listaCliente;
	}
	
	
}