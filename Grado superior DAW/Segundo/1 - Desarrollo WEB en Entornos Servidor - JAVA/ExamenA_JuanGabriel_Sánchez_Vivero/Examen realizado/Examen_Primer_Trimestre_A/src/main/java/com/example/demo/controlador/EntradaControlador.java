package com.example.demo.controlador;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.demo.modelo.Entrada;
import com.example.demo.servicio.EntradaServicio;

@RestController
@RequestMapping("/api/entradas")
public class EntradaControlador {

	@Autowired
	public EntradaServicio entradaServicio;

	// A)

	@PostMapping
	public ResponseEntity<Entrada> crearEntrada(@RequestBody Entrada nuevaEntrada) {
		return ResponseEntity.ok(entradaServicio.crearEntrada(nuevaEntrada));
	}

	// B)

	@GetMapping
	public ResponseEntity<List<Entrada>> obtenerEntradas() {
		List<Entrada> entradas = entradaServicio.obtenerEntradas();
		return ResponseEntity.ok(entradas);
	}

	// C)

	@PutMapping("/{id}")
	public ResponseEntity<Void> actualizarEntradaCompleta(@PathVariable Long id,
			@RequestBody Entrada entradaActualizada) {
		return entradaServicio.actualizarEntradaCompleta(id, entradaActualizada);
	}

	// D)

	@GetMapping("/noTaquilla")
	public ResponseEntity<List<Entrada>> entradasNoRevisadasTaquilla() {
		return ResponseEntity.ok(entradaServicio.entradasNoRevisadasTaquilla());
	}

	// E)

	@PatchMapping("/nuevasEntradas/{id}")
	public ResponseEntity<Entrada> modificarEntradaNumeroEntradas(@PathVariable Long id,
			@RequestBody Entrada entradaModificada) {
		return ResponseEntity.ok(entradaServicio.modificarEntradaNumeroEntradas(id, entradaModificada));
	}

	// F)

	@DeleteMapping("/{nombreComprador}")
	public ResponseEntity<String> borrarEntradasPorNombreComprador(@PathVariable String nombreComprador) {
		return ResponseEntity.ok(entradaServicio.borrarEntradasPorNombreComprador(nombreComprador));
	}

	// G)

	@PatchMapping("/{id}/modificarEntrada/{pelicula}/{horario}")
	public ResponseEntity<String> modificarPeliculaPorVariables(@PathVariable Long id, @PathVariable String pelicula,
			@PathVariable String horario) {
		return ResponseEntity.ok(entradaServicio.modificarPeliculaPorVariables(id, pelicula, horario));
	}
	
	// H)
	
	@GetMapping("/mapaClientes")
	public ResponseEntity<Map<String, Integer>> obtenerMapaNombreCliente() {		 
		List<Entrada> entradas = entradaServicio.obtenerEntradas();
		Map<String, Integer> mapaNombreClienteCantidad = new HashMap<>();
		
		return ResponseEntity.ok(mapaNombreClienteCantidad);
	}

}
