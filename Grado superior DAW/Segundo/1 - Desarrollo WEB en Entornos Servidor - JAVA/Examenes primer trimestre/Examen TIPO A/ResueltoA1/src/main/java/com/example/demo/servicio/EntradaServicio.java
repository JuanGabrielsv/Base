package com.example.demo.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repositorio.EntradaRepositorio;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class EntradaServicio {
	
	@Autowired
	private EntradaRepositorio entradaRepositorio;

}
