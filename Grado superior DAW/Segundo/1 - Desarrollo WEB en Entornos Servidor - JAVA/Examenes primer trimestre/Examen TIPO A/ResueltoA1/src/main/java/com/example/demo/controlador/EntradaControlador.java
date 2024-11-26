package com.example.demo.controlador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.servicio.EntradaServicio;

@RestController
@RequestMapping("/api/entradas")
public class EntradaControlador {
	
	@Autowired
	private EntradaServicio entradaServicio;
	
	

}
