package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.demo.modelo.Cliente;
import com.example.demo.service.ClienteService;

@RestController
@RequestMapping("/clientes")
public class ClienteController {
	
	@Autowired
	private ClienteService servicio;	
	
	//getClientes: obtiene la lista de todos los clientes
	@GetMapping
	public ResponseEntity<List<Cliente>> getClientes() {
		
		List<Cliente> listaClientes = servicio.getClientes();
		return ResponseEntity.ok(listaClientes);
	}
	
	//getCliente: dado un id, obtiene sus datos de clientes.
	@GetMapping("/{id}")
	public ResponseEntity<Cliente> getCliente(@PathVariable int id) {		
		Cliente cliente = servicio.getCliente(id);
		return ResponseEntity.ok(cliente);
	}
	
	//insertaCliente: inserta los datos de un cliente.
	@PostMapping
	public ResponseEntity<Void> insertarCliente(@RequestBody Cliente nuevoCliente) {
		servicio.insertarCliente(nuevoCliente);
		return ResponseEntity.noContent().build();
	}
	

}
