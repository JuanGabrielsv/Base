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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PutMapping;

@RestController
@RequestMapping("/clientes")
public class ClienteController {

	List<Cliente> clientes = new ArrayList<>();

	public ClienteController() {

		Cliente cliente1 = new Cliente("1", "Laura", "Laurita86", "654854");
		Cliente cliente2 = new Cliente("2", "Carmen", "Carmenlamejor", "85241");
		Cliente cliente3 = new Cliente("3", "Paula", "Divarock", "785823");
		Cliente cliente4 = new Cliente("4", "Jazmín", "HijadelaLuna", "845215");

		clientes.add(cliente1);
		clientes.add(cliente2);
		clientes.add(cliente3);
		clientes.add(cliente4);

	}

	@GetMapping
	public List<Cliente> listaClientes() {
		return clientes;
	}

	@GetMapping("/{username}")
	public ResponseEntity<Cliente> saberCliente(@PathVariable String username) {

		for (Cliente cliente : clientes) {
			if (cliente.getUsername().equalsIgnoreCase(username)) {
				return ResponseEntity.ok(cliente);
			}
		}

		return ResponseEntity.notFound().build();

	}

	@PostMapping
	public ResponseEntity<Cliente> introducirCliente(@RequestBody Cliente parametroCliente) {
		for (Cliente cliente : clientes) {
			if (cliente.getId().equals(parametroCliente.getId())) {
				Cliente yaExiste = new Cliente("Ya existe cliente con ese id", null, null, null);

				return ResponseEntity.ok(yaExiste);
			}
		}

		clientes.add(parametroCliente);

		for (Cliente cliente : clientes) {
			if (cliente.getId().equalsIgnoreCase(parametroCliente.getId())) {
				return ResponseEntity.ok(cliente);
			}
		}

		return ResponseEntity.ok(parametroCliente);

	}

//* El método debe recibir el cliente y en caso de encontrar el id en la lista de clientes, actualizar sus datos.
	@PutMapping
	public ResponseEntity<Cliente> modificarCliente(@RequestBody Cliente parametroCliente) {

		for (Cliente cliente : clientes) {
			if (cliente.getId().equals(parametroCliente.getId())) {
				cliente.setId(parametroCliente.getId());
				cliente.setNombre(parametroCliente.getNombre());
				cliente.setPassword(parametroCliente.getPassword());
				cliente.setUsername(parametroCliente.getUsername());
				return ResponseEntity.ok(cliente);
			}
		}

		return ResponseEntity.notFound().build();

	}

//* Crear otro endpoint para que reciba el id del cliente a modificar, en el path: /clientes/123
	@PutMapping("/{id}")
	public ResponseEntity<Cliente> modificarClienteCompletoPorId(@PathVariable String id,
			@RequestBody Cliente clienteModificado) {
		for (Cliente cliente : clientes) {
			if (cliente.getId().equals(id)) {
				cliente.setId(clienteModificado.getId());
				cliente.setNombre(clienteModificado.getNombre());
				cliente.setUsername(clienteModificado.getUsername());
				cliente.setPassword(clienteModificado.getPassword());
				return ResponseEntity.ok(cliente);
			}
		}
		return ResponseEntity.notFound().build();
	}

}