package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Cliente;
import com.example.demo.model.Direccion;
import com.example.demo.repository.ClienteRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class ClienteServiceImpl implements ClienteService {
	
	@Autowired
	private ClienteRepository repositorio;

	@Override	
	public void guardarCliente(Cliente cliente) {
		repositorio.guardarCliente(cliente);		
	}

	@Override
	public void guardarDireccion(Direccion direccion) {
		repositorio.guardarDireccion(direccion);
		
	}

	@Override
	public void asignarDireccion(Cliente cliente, Direccion direccion) {
		repositorio.asignarDireccion(cliente, direccion);
		
	}

	@Override
	public List<Cliente> obtenerListaTodosClientes() {
		return repositorio.obtenerListaTodosClientes();
	}

	@Override
	public Cliente buscarClientePorId(Integer i) {
		return repositorio.buscarClientePorId(i);
		
	}

	@Override
	public void modificarCliente(Cliente cliente, String nuevoNombre) {
		repositorio.modificarCliente(cliente, nuevoNombre);
		
	}

}
