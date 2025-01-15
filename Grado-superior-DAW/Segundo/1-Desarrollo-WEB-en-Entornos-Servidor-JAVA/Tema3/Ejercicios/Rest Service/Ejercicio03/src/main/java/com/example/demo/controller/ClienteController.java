package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import com.example.demo.modelo.Cliente;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
public class ClienteController {

	List<Cliente> clientes = new ArrayList<>();

	public ClienteController() {

		Cliente cliente1 = new Cliente(1, "Laura", "Laurita86", "654854");
		Cliente cliente2 = new Cliente(2, "Carmen", "Carmenlamejor", "85241");
		Cliente cliente3 = new Cliente(3, "Paula", "Divarock", "785823");
		Cliente cliente4 = new Cliente(4, "Jazmín", "HijadelaLuna", "845215");

		clientes.add(cliente1);
		clientes.add(cliente2);
		clientes.add(cliente3);
		clientes.add(cliente4);

	}

	@GetMapping("clientes")
	public List<Cliente> listaClientes() {
		return clientes;
	}

	@GetMapping("clientes/{username}")
	public ResponseEntity<Cliente> saberCliente(@PathVariable String username) {

		for (Cliente cliente : clientes) {
			if (cliente.getUsername().contains(username)) {
				return ResponseEntity.ok(cliente);
			}
		}

		return ResponseEntity.notFound().build();

	}

	/*
	 * # Ejercicio 3
	 * 
	 * Crear un nuevo endpoint en el controlador anterior para añadir un nuevo
	 * cliente a la lista de clientes. Utilizar una petición de tipo POST. El método
	 * debe devolver el nuevo cliente insertado. La petición es:
	 * localhost:8080/clientes
	 */

	@PostMapping("clientes")
	public Cliente introducirCliente(@RequestBody Cliente cliente) {
		clientes.add(cliente);
		return cliente;
	}

}