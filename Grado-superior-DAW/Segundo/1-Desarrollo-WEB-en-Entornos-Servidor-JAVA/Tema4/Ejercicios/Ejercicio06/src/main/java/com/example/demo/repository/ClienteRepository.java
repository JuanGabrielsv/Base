package com.example.demo.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.model.Cliente;
import com.example.demo.model.Direccion;

@Repository
public interface ClienteRepository {

	void guardarCliente(Cliente cliente);

	void guardarDireccion(Direccion direccion);

	void asignarDireccion(Cliente cliente, Direccion direccion);

	List<Cliente> obtenerListaTodosClientes();

	Cliente buscarClientePorId(Integer i);

	void modificarCliente(Cliente cliente, String nuevoNombre);

	List<Cliente> buscarClientesPorCiudad(String ciudad);

}
