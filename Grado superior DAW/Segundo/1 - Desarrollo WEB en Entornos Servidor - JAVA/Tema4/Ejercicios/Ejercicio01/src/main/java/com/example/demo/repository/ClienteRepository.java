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
	
	//getClientes: obtiene la lista de todos los clientes
	public List<Cliente> getClientes() {
		Query<Cliente> query = (Query<Cliente>) entityManager.createQuery("select c from Cliente c", Cliente.class);
		List<Cliente> listaCliente = query.getResultList();
		return listaCliente;
	}
	
	//getCliente: dado un id, obtiene sus datos de clientes.
	public Cliente getCliente(int id) {
		Cliente cliente = entityManager.find(Cliente.class, id);
		return cliente;
	}
	
	// insertaCliente: inserta los datos de un cliente.
	public void insertarCliente(Cliente nuevoCliente) {
		entityManager.persist(nuevoCliente);
		
	}
	
}