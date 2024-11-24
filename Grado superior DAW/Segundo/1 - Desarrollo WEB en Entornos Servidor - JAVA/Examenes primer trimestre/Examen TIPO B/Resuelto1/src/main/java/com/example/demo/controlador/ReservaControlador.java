package com.example.demo.controlador;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.modelo.Reserva;
import com.example.demo.servicio.ReservaServicio;

@RestController
@RequestMapping("/api/reservas")
public class ReservaControlador {
	
	@Autowired
	private ReservaServicio reservaServicio;
	
	// B)
	
	@GetMapping
	public ResponseEntity<List<Reserva>> getTodasLasReservas() {
		return reservaServicio.getTodasLasReservas();
	}

}
