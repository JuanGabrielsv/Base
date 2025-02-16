package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Empleado;
import com.example.demo.repository.RepositoryEmpleado;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class ServiceEmpleadoImpl implements ServiceEmpleado {	
	
	@Autowired
	private RepositoryEmpleado repositorioEmpleado;

	@Override
	public void guardarEmpleado(Empleado empleado) {
		repositorioEmpleado.guardarEmpleado(empleado);
		
	}

	@Override
	public List<Empleado> consultarTodosLosEmpleados() {
		
		return repositorioEmpleado.consultarTodosLosEmpleados();
	}

	@Override
	public Empleado consultarEmpleadoPorId(Integer id) {
		
		return repositorioEmpleado.consultarEmpleadoPorId(id);
	}

	@Override
	public void eliminarEmpleadoPorId(Integer id) {
		repositorioEmpleado.eliminarEmpleadoPorId(id);		
		
	}

	@Override
	public List<Empleado> buscarEmpleadoConPuestoEspecifico(String puesto) {

		return repositorioEmpleado.buscarEmpleadoConPuestoEspecifico(puesto);
	}


}
