package com.examenA.controlador;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.examenA.modelo.Entrada;
import com.examenA.servicio.EntradaServicio;

@RestController
@RequestMapping("/api/entradas")
public class EntradaControlador {

	@Autowired
	private EntradaServicio entradaServicio;

	@PostMapping
	public ResponseEntity<Entrada> crearEntrada(@RequestBody Entrada entrada) {

		entrada.setPrecioTotal(entrada.getNumeroEntradas() * entrada.getPrecioPorEntrada());
		Entrada nuevaEntrada = entradaServicio.crearEntrada(entrada);
		return ResponseEntity.ok(nuevaEntrada);
	}
	
	@GetMapping
	public ResponseEntity<List<Entrada>> obtenerEntradas() {
		List<Entrada> entradas = entradaServicio.obtenerEntradas();
		if (entradas.isEmpty()) {
			return ResponseEntity.noContent().build();
		}
		return ResponseEntity.ok(entradas);
	}

}
