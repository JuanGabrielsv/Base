package com.example.demo.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.model.Oficina;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Repository
public class RepositoryOficinaImpl implements RepositoryOficina {

	@PersistenceContext
	private EntityManager entity;

	@Override
	public void guardarOficina(Oficina oficina) {
		entity.persist(oficina);
	}

	@Override
	public void actualizarOficina(Oficina oficina) {
		entity.merge(oficina);
		
	}

	@Override
	public List<Oficina> consultarTodasLasOficinas() {
		return entity.createQuery("SELECT o FROM Oficina o", Oficina.class).getResultList();
	}

	@Override
	public Oficina consultarOficinaPorId(Integer id) {
		return entity.find(Oficina.class, id);
		
	}

	@Override
	public void eliminarOficinaPorId(Integer id) {
		Oficina oficinaParaEliminar = entity.find(Oficina.class, id);
		if ( oficinaParaEliminar != null) {
			entity.remove(oficinaParaEliminar);
		}
		
	}	

}
