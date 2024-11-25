package com.example.demo.controlador;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
import com.example.demo.modelo.Reserva;
import com.example.demo.servicio.ReservaServicio;

@RestController
@RequestMapping("/api/reservas")
public class ReservaControlador {

	@Autowired
	private ReservaServicio reservaServicio;

	// A)

	@PostMapping
	public ResponseEntity<Void> crearNuevaReserva(@RequestBody Reserva nuevaReserva) {
		reservaServicio.crearNuevaReserva(nuevaReserva);
		return ResponseEntity.noContent().build();
	}

	// B)

	@GetMapping
	public ResponseEntity<List<Reserva>> getTodasLasReservas() {
		List<Reserva> lReservas = reservaServicio.getTodasLasReservas();
		if (lReservas.isEmpty()) {
			return ResponseEntity.noContent().build();
		}
		return ResponseEntity.ok(lReservas);
	}

	// C)

	@PutMapping("/{id}")
	public ResponseEntity<Reserva> actualizarReservaCompleta(@PathVariable Long id,
			@RequestBody Reserva reservaModificada) {
		if (reservaServicio.actualizarReservaCompleta(id, reservaModificada) == null) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok(reservaServicio.actualizarReservaCompleta(id, reservaModificada));
	}

	// D)

	@DeleteMapping("/cancelados")
	public ResponseEntity<String> borrarReservasCanceladas() {
		return ResponseEntity.ok(reservaServicio.borrarReservasCanceladas());
	}

	// E)

	@PatchMapping("/nuevoPrecio/{id}")
	public ResponseEntity<Reserva> modificarPrecioHabitacion(@PathVariable Long id,
			@RequestBody Reserva reservaPrecioModificado) {
		Reserva reservaAModificar = reservaServicio.buscarReservaPorId(id);
		if (reservaAModificar == null) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok(reservaServicio.modificarPrecioHabitacion(id, reservaPrecioModificado));
	}

	// F)

	@GetMapping("/reservasLargas/{noches}")
	public ResponseEntity<List<Reserva>> GetReservasPorNumeroNoches(@PathVariable Integer noches) {
		List<Reserva> lReservas = reservaServicio.GetReservasPorNumeroNoches(noches);
		if (lReservas.isEmpty()) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok(lReservas);
	}

	// G)

	@GetMapping("/mapaClientes")
	public ResponseEntity<Map<String, Integer>> getMapaClientes() {
		List<Reserva> lReservas = reservaServicio.getTodasLasReservas();
		Map<String, Integer> mapaClientes = lReservas.stream().filter(reserva -> reserva.getActiva() == true).collect(
				Collectors.groupingBy(Reserva::getTipoHabitacion, Collectors.summingInt(Reserva::getNumeroNoches)));
		return ResponseEntity.ok(mapaClientes);
	}

	// H)

	@PatchMapping("/modificarReserva/{id}/{nombreCliente}/{numNoches}")
	public ResponseEntity<Reserva> patchClientePorNombreYNumeroNoches(@PathVariable Long id,
			@PathVariable String nombreCliente, @PathVariable Integer numNoches) {
		Reserva reservaAModificar = reservaServicio.buscarReservaPorId(id);
		if (reservaAModificar == null) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok(reservaServicio.patchClientePorNombreYNumeroNoches(id, nombreCliente, numNoches));
	}

	// I)

	@GetMapping("/masBarata")
	public ResponseEntity<Reserva> getReservaMasBarata() {
		return ResponseEntity.ok(reservaServicio.getReservaMasBarata());
	}

	// J)

	@GetMapping("reservasPorHabitacion/{tipoHabitacion}")
	public ResponseEntity<List<String>> getReservasPorHabitacion(@PathVariable String tipoHabitacion) {
		return ResponseEntity.ok(reservaServicio.getReservasProHabitacion(tipoHabitacion));
	}

}
