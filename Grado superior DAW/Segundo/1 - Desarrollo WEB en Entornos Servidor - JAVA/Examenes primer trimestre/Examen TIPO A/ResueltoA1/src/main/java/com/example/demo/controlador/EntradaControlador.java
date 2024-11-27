package com.example.demo.controlador;

import java.util.List;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.demo.modelo.Entrada;
import com.example.demo.servicio.EntradaServicio;

@RestController
@RequestMapping("/api/entradas")
public class EntradaControlador {

	@Autowired
	private EntradaServicio entradaServicio;

// A)

	@PostMapping
	public ResponseEntity<Entrada> postNuevaCompraEntrada(@RequestBody Entrada nuevaEntrada) {
		Entrada entrada = postNuevaCompraEntrada
	}

// B)

	@GetMapping
	public ResponseEntity<List<Entrada>> getTodasLasEntradas() {
		List<Entrada> lEntradas = entradaServicio.getTodasLasEntradas();
		if (lEntradas.isEmpty()) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok(lEntradas);
	}

}
