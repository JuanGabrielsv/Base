package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Empleado;
import com.example.demo.model.Oficina;
import com.example.demo.repository.RepositoryOficina;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class ServiceOficinaImpl implements ServiceOficina {

	@Autowired
	private RepositoryOficina repositorioOficina;

	@Override
	public void guardarOficina(Oficina oficina) {
		repositorioOficina.guardarOficina(oficina);
	}

	@Override
	public void actualizarOficina(Oficina oficina) {
		repositorioOficina.actualizarOficina(oficina);
	}

	@Override
	public List<Oficina> consultarTodasLasOficinas() {
		return repositorioOficina.consultarTodasLasOficinas();
	}

	@Override
	public Oficina consultarOficinaPorId(Integer id) {
		return repositorioOficina.consultarOficinaPorId(id);
	}

	@Override
	public void eliminarOficinaPorId(Integer id) {
		repositorioOficina.eliminarOficinaPorId(id);

	}

	@Override
	public List<Oficina> obtenerOficinasConMasDeNEmpleados(Integer numeroEmpleados) {
		List<Oficina> listaTodasLasOficinas = repositorioOficina.consultarTodasLasOficinas();
		return listaTodasLasOficinas.stream().filter(oficina -> oficina.getListaEmpleados().size() > numeroEmpleados)
				.toList();
	}

	@Override
	public void actualizarTelefonoOficinaPorIdDeEmpleado(Integer id, String nuevoTelefono) {
		List<Oficina> listaOficinas = repositorioOficina.consultarTodasLasOficinas();
		for (Oficina o : listaOficinas) {
			for (Empleado e : o.getListaEmpleados()) {
				if (e.getId() == id) {
					o.setTelefono(nuevoTelefono);
					repositorioOficina.actualizarOficina(o);
					return;
				}
			}
		}
	}

}
