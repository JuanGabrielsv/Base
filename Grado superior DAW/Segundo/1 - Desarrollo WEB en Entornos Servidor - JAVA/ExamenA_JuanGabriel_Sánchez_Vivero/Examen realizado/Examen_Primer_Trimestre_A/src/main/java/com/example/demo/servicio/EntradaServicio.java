package com.example.demo.servicio;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import com.example.demo.modelo.Entrada;
import com.example.demo.repositorio.EntradaRepositorio;

@Service
public class EntradaServicio {

	@Autowired
	private EntradaRepositorio entradaRepositorio;

	public Entrada crearEntrada(Entrada nuevaEntrada) {
		nuevaEntrada.setPrecioTotal(nuevaEntrada.getPrecioPorEntrada() * nuevaEntrada.getNumeroEntradas());
		if (nuevaEntrada.getTaquilla() == false) {
			nuevaEntrada.setPrecioTotal(nuevaEntrada.getPrecioTotal() * 1.02);
		}
		return entradaRepositorio.crearEntrada(nuevaEntrada);
	}

	public List<Entrada> obtenerEntradas() {
		return entradaRepositorio.obtenerEntradas();
	}

	public ResponseEntity<Void> actualizarEntradaCompleta(Long id, Entrada entradaActualizada) {
		entradaActualizada
				.setPrecioTotal(entradaActualizada.getPrecioPorEntrada() * entradaActualizada.getNumeroEntradas());
		if (entradaActualizada.getTaquilla() == false) {
			entradaActualizada.setPrecioTotal(entradaActualizada.getPrecioTotal() * 1.02);
		}
		List<Entrada> entradas = entradaRepositorio.obtenerEntradas();
		Boolean existe = false;
		for (Entrada entrada : entradas) {
			if (entrada.getId() == id) {
				existe = true;
			}
		}
		if (existe) {
			entradaRepositorio.actualizarEntradaCompleta(id, entradaActualizada);
			return ResponseEntity.ok().build();
		} else {
			return ResponseEntity.notFound().build();
		}
	}

	public List<Entrada> entradasNoRevisadasTaquilla() {
		return entradaRepositorio.entradasNoRevisadasTaquilla();
	}

	public Entrada modificarEntradaNumeroEntradas(Long id, Entrada entradaModificada) {
		return entradaRepositorio.modificarEntradaNumeroEntradas(id, entradaModificada);
	}

	public String borrarEntradasPorNombreComprador(String nombreComprador) {
		List<Entrada> entradas = entradaRepositorio.obtenerEntradas();
		for (Entrada entrada : entradas) {
			if (entrada.getNombreComprador().equals(nombreComprador)) {
				return entradaRepositorio.borrarEntradasPorNombreComprador(nombreComprador);
			}
		}
		return "No se encuentra el nombre del comprador";
	}

	public String modificarPeliculaPorVariables(@PathVariable Long id, String pelicula, String horario) {
		List<Entrada> entradas = entradaRepositorio.obtenerEntradas();
		for (Entrada entrada : entradas) {
			if (entrada.getId().equals(id)) {
				return entradaRepositorio.modificarPeliculaPorVariable(id, pelicula, horario);
			}
		}
		return "No se encuentra ninguna entrada con el id: " + id;
	}

	// I)

	public Entrada masCara() {
		List<Entrada> entradas = entradaRepositorio.obtenerEntradas();
		Entrada entradaMasCara = entradas.get(0);
		for (Entrada entrada : entradas) {
			if (entrada.getPrecioTotal() > entradaMasCara.getPrecioTotal()) {
				entradaMasCara = entrada;
			}
		}
		return entradaMasCara;
	}

	// J)

	public List<String> obtenerEntradasMultiples(Integer numEntradas) {
		List<Entrada> entradas = entradaRepositorio.obtenerEntradas(); // Nos traemos todas las entradas de la BD.

		List<Entrada> entradasFiltradas = entradas.stream() // Iniciamos el Stream devolverá todas las entradas.
				.filter(e -> e.getNumeroEntradas() > numEntradas && e.getTaquilla() == true).toList(); // Aplicamos el filtro con sus condiciones
		
		entradasFiltradas.forEach(System.out::println); // Mostrar todas las entradas por consola.
		
		

		return entradasFiltradas.stream()
				.limit(2) // Limitamos la busque a las dos primeras
				.map(Entrada::toString)
				.toList();

	}

}
