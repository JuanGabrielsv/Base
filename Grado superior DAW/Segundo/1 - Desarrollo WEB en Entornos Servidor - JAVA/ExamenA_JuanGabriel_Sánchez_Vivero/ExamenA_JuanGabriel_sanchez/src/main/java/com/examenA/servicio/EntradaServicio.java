package com.examenA.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.examenA.modelo.Entrada;
import com.examenA.repositorio.EntradaRepositorio;

import jakarta.transaction.Transactional;

@Service
public class EntradaServicio {
	
	@Autowired
	private EntradaRepositorio entradaRepositorio;
	
	@Transactional
	public Entrada crearEntrada(Entrada entrada) {
		return entradaRepositorio.crearEntrada(entrada);
	}
	
	public List<Entrada> obtenerEntradas() {
		return entradaRepositorio.obtenerEntradas();
		
	}

}
