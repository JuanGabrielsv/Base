package com.example.demo.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.modelo.Cliente;
import com.example.demo.repository.ClienteRepository;

import jakarta.transaction.Transactional;

@Service
public class ClienteService {

	@Autowired
	private ClienteRepository repository;

	// getClientes: obtiene la lista de todos los clientes
	public List<Cliente> getClientes() {
		return repository.getClientes();
	}

	// getCliente: dado un id, obtiene sus datos de clientes.
	public Cliente getCliente(int id) {
		return repository.getCliente(id);
	}

	// insertaCliente: inserta los datos de un cliente.
	@Transactional
	public void insertarCliente(Cliente nuevoCliente) {
		repository.insertarCliente(nuevoCliente);
	}
	
	//deleteCliente: dado un id de un cliente, lo elimina.
	@Transactional
	public Boolean deleteCliente(Integer id) {
		return repository.deleteCliente(id);
	}

}
