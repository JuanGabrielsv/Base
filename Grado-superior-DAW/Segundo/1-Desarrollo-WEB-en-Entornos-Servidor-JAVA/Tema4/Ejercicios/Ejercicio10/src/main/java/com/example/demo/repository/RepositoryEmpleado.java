package com.example.demo.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.model.Empleado;

@Repository
public interface RepositoryEmpleado {

	void guardarEmpleado(Empleado empleado);

	List<Empleado> consultarTodosLosEmpleados();

	Empleado consultarEmpleadoPorId(Integer id);

	void eliminarEmpleadoPorId(Integer id);

	List<Empleado> buscarEmpleadoConPuestoEspecifico(String puesto);

	

}
