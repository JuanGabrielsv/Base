package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.demo.modelo.Cliente;
import com.example.demo.service.ClienteService;

@RestController
@RequestMapping("/clientes")
public class ClienteController {
	
	@Autowired
	private ClienteService servicio;
	
	@GetMapping
	public ResponseEntity<List<Cliente>> obtenerClientes() {
		
		List<Cliente> listaClientes = servicio.obtenerClientes();
		return ResponseEntity.ok(listaClientes);
	}

}
