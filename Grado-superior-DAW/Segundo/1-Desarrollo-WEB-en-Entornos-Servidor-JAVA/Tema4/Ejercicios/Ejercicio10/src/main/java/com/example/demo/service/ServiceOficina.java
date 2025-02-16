package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.model.Oficina;

@Service
public interface ServiceOficina {

	void guardarOficina(Oficina oficina);

	void actualizarOficina(Oficina oficina);

	List<Oficina> consultarTodasLasOficinas();

	Oficina consultarOficinaPorId(Integer id);

	void eliminarOficinaPorId(Integer Id);

	List<Oficina> obtenerOficinasConMasDeNEmpleados(Integer numeroEmpleados);

	void actualizarTelefonoOficinaPorIdDeEmpleado(Integer id, String nuevoTelefono);	

}
