package com.example.demo.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.model.Oficina;

@Repository
public interface RepositoryOficina {

	void guardarOficina(Oficina oficina);

	void actualizarOficina(Oficina oficina);

	List<Oficina> consultarTodasLasOficinas();

	Oficina consultarOficinaPorId(Integer id);

	void eliminarOficinaPorId(Integer id);
	

}
