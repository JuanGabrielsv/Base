package com.example.demo.servicio;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.modelo.Entrada;
import com.example.demo.repositorio.EntradaRepositorio;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class EntradaServicio {
	
	@Autowired
	private EntradaRepositorio entradaRepositorio;
	
// A)
	
	public Entrada postNuevaEntrada(Entrada nuevaEntrada) {		
		nuevaEntrada.calcularPrecioTotal();
		return entradaRepositorio.postNuevaEntrada(nuevaEntrada);
	}

// B)
	
	public List<Entrada> getTodasLasEntradas() {		
		return entradaRepositorio.getTodasLasEntradas();
	}

}
