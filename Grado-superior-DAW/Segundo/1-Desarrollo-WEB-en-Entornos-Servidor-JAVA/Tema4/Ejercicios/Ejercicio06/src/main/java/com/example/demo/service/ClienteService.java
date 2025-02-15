package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.model.Cliente;
import com.example.demo.model.Direccion;

@Service
public interface ClienteService {

	void guardarCliente(Cliente cliente);

	void guardarDireccion(Direccion direccion);

	void asignarDireccion(Cliente cliente, Direccion direccion);

	List<Cliente> obtenerListaTodosClientes();

	Cliente buscarClientePorId(Integer i);

	void modificarCliente(Cliente cliente, String nuevoNombre);

	List<Cliente> buscarClientesPorCiudad(String ciudad);

}
