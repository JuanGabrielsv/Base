package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.model.Empleado;

@Service
public interface ServiceEmpleado {

	void guardarEmpleado(Empleado empleado);

	List<Empleado> consultarTodosLosEmpleados();

	Empleado consultarEmpleadoPorId(Integer id);

	void eliminarEmpleadoPorId(Integer id);

	List<Empleado> buscarEmpleadoConPuestoEspecifico(String puesto);

	

}
