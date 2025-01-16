package com.example.demo.servicio;

import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.modelo.Reserva;
import com.example.demo.repositorio.ReservaRepositorio;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class ReservaServicio {

	@Autowired
	private ReservaRepositorio reservaRepositorio;

	// A)

	public void crearNuevaReserva(Reserva nuevaReserva) {
		nuevaReserva.setPrecioTotal(nuevaReserva.getPrecioHabitacion() * nuevaReserva.getNumeroNoches());
		if (nuevaReserva.getTipoHabitacion().equalsIgnoreCase("Familiar")) {
			nuevaReserva.setPrecioTotal(nuevaReserva.getPrecioTotal() * 0.97);
		}
		reservaRepositorio.crearNuevaReserva(nuevaReserva);
	}

	// B)

	public List<Reserva> getTodasLasReservas() {
		return reservaRepositorio.getTodasLasReservas();
	}

	// C)

	public Reserva buscarReservaPorId(Long id) {
		return reservaRepositorio.buscarReservaPorId(id);
	}

	public Reserva actualizarReservaCompleta(Long id, Reserva reservaModificada) {
		Reserva reservaAModificar = reservaRepositorio.buscarReservaPorId(id);
		if (reservaAModificar != null) {
			reservaModificada
					.setPrecioTotal(reservaModificada.getPrecioHabitacion() * reservaModificada.getNumeroNoches());
			if (reservaModificada.getTipoHabitacion().equalsIgnoreCase("Familiar")) {
				reservaModificada.setPrecioTotal(reservaModificada.getPrecioTotal() * 0.97);
			}
			reservaModificada.setId(id);
			return reservaRepositorio.actualizarReservaCompleta(id, reservaModificada);
		}
		return reservaAModificar;
	}

	// D)

	public String borrarReservasCanceladas() {
		List<Reserva> lReservas = reservaRepositorio.getTodasLasReservas();
		Boolean existe = false;

		for (Reserva reserva : lReservas) {
			if (reserva.getActiva() == true) {
				existe = true;
			}
		}

		if (existe) {
			for (Reserva reserva : lReservas) {
				if (reserva.getActiva() == true) {
					reservaRepositorio.borrarReservasCanceladas(reserva);
				}
			}
			String mensaje = "Entradas borradas";
			return mensaje;
		} else {
			String mensaje = "No se ha podido eliminar ninguna entrada";
			return mensaje;
		}

	}

	// E)

	public Reserva modificarPrecioHabitacion(Long id, Reserva reservaPrecioModificado) {
		Reserva reservaAModificar = reservaRepositorio.buscarReservaPorId(id);
		reservaAModificar.setPrecioHabitacion(reservaPrecioModificado.getPrecioHabitacion());
		reservaAModificar.setPrecioTotal(reservaAModificar.getPrecioHabitacion() * reservaAModificar.getNumeroNoches());
		if (reservaAModificar.getTipoHabitacion().equalsIgnoreCase("Familiar")) {
			reservaAModificar.setPrecioTotal(reservaAModificar.getPrecioTotal() * 0.97);
		}
		return reservaRepositorio.modificarPrecioHabitacion(id, reservaAModificar);
	}

	// F)

	public List<Reserva> GetReservasPorNumeroNoches(Integer noches) {
		List<Reserva> lReservas = reservaRepositorio.getTodasLasReservas();
		List<Reserva> lReservasFiltradas = lReservas.stream().filter(reserva -> reserva.getNumeroNoches() > noches)
				.collect(Collectors.toList());
		return lReservasFiltradas;

	}

	// G) no procede

	// H)

	public Reserva patchClientePorNombreYNumeroNoches(Long id, String nombreCliente, Integer numNoches) {
		Reserva reservaAModificar = reservaRepositorio.buscarReservaPorId(id);
		reservaAModificar.setNombreCliente(nombreCliente);
		reservaAModificar.setNumeroNoches(numNoches);
		reservaAModificar.setPrecioTotal(reservaAModificar.getPrecioHabitacion() * reservaAModificar.getNumeroNoches());
		if (reservaAModificar.getTipoHabitacion().equalsIgnoreCase("Familiar")) {
			reservaAModificar.setPrecioTotal(reservaAModificar.getPrecioTotal() * 0.97);
		}
		return reservaRepositorio.patchClientePorNombreYNumeroNoches(reservaAModificar);
	}

	// I)

	public Reserva getReservaMasBarata() {
		List<Reserva> lReservas = reservaRepositorio.getTodasLasReservas();
		Reserva reservaMasBarata = lReservas.get(0);
		for (Reserva reserva : lReservas) {
			if (reserva.getPrecioTotal() < reservaMasBarata.getPrecioTotal()) {
				reservaMasBarata = reserva;
			}
		}
		return reservaMasBarata;
	}

	// J)

	public List<String> getReservasProHabitacion(String tipoHabitacion) {
		List<Reserva> lReservas = reservaRepositorio.getTodasLasReservas();

		List<Reserva> lReservasFiltradas = lReservas.stream().filter(
				reserva -> reserva.getActiva() == true && reserva.getTipoHabitacion().equalsIgnoreCase(tipoHabitacion))
				.collect(Collectors.toList());

		lReservasFiltradas.forEach(System.out::println);

		return lReservas.stream()
				.filter(reserva -> reserva.getActiva() == true
						&& reserva.getTipoHabitacion().equalsIgnoreCase(tipoHabitacion))
				.limit(3).map(Reserva::toString).toList();

	}

}
