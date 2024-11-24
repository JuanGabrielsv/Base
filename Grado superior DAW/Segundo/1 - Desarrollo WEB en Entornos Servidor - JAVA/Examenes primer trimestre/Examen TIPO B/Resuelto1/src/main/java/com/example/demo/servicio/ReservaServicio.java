package com.example.demo.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.example.demo.modelo.Reserva;
import com.example.demo.repositorio.ReservaRepositorio;

@Service
public class ReservaServicio {
	
	@Autowired
	private ReservaRepositorio reservaRepositorio;
	
	// B)
	
	public ResponseEntity<List<Reserva>> getTodasLasReservas() {
		List<Reserva> lReserva = reservaRepositorio.getTodasLasReservas();
		if (lReserva.isEmpty()) {
			return ResponseEntity.noContent().build();
		}
		return ResponseEntity.ok(lReserva);
	}

}
