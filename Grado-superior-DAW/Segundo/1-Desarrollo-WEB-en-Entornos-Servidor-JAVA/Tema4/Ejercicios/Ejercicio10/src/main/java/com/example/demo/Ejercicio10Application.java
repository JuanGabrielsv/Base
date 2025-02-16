package com.example.demo;

import java.util.List;
import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.example.demo.model.Empleado;
import com.example.demo.model.Oficina;
import com.example.demo.service.ServiceEmpleado;
import com.example.demo.service.ServiceOficina;

import jakarta.transaction.Transactional;

@SpringBootApplication
public class Ejercicio10Application implements CommandLineRunner {

	public static void main(String[] args) {
		SpringApplication.run(Ejercicio10Application.class, args);
	}

	@Autowired
	private ServiceEmpleado serviceEmpleado;
	@Autowired
	private ServiceOficina serviceOficina;

	@Override
	@Transactional
	public void run(String... args) throws Exception {

		Empleado empleado1 = new Empleado("empleado1", "puesto1", "email1");
		Empleado empleado2 = new Empleado("empleado2", "puesto3", "email2");
		Empleado empleado3 = new Empleado("empleado3", "puesto3", "email3");
		Empleado empleado4 = new Empleado("empleado4", "puesto4", "email4");
		Empleado empleado5 = new Empleado("empleado5", "puesto5", "email5");

		Oficina oficina1 = new Oficina("ubicacion1", "telefono1");
		Oficina oficina2 = new Oficina("ubicacion2", "telefono2");

		oficina1.getListaEmpleados().add(empleado1);
		oficina1.getListaEmpleados().add(empleado2);
		oficina1.getListaEmpleados().add(empleado3);
		oficina2.getListaEmpleados().add(empleado4);
		oficina2.getListaEmpleados().add(empleado5);

		serviceEmpleado.guardarEmpleado(empleado1);
		serviceEmpleado.guardarEmpleado(empleado2);
		serviceEmpleado.guardarEmpleado(empleado3);
		serviceEmpleado.guardarEmpleado(empleado4);
		serviceEmpleado.guardarEmpleado(empleado5);

		serviceOficina.guardarOficina(oficina1);
		serviceOficina.guardarOficina(oficina2);

		System.out.println("\n/***************** CONSULTAR TODOS LOS EMPLEADOS *****************/");
		List<Empleado> listaTodosLosEmpleados = serviceEmpleado.consultarTodosLosEmpleados();
		listaTodosLosEmpleados.forEach(e -> {
			System.out.println("ID: " + e.getId() + " - NOMBRE: " + e.getNombre() + " - PUESTO: " + e.getPuesto()
					+ " - EMAIL: " + e.getEmail());
		});

		System.out.println("\n/******************* CONSULTAR EMPLEADO POR ID ******************/");
		Empleado empleadoBuscadoPorId = serviceEmpleado.consultarEmpleadoPorId(2);
		if (empleadoBuscadoPorId == null) {
			System.err.println("Empleado no encontrado");
		} else {
			System.out.println("ID: " + empleadoBuscadoPorId.getId() + " - NOMBRE: " + empleadoBuscadoPorId.getNombre()
					+ " - PUESTO: " + empleadoBuscadoPorId.getPuesto() + " - EMAIL: "
					+ empleadoBuscadoPorId.getEmail());
		}

		System.out.println("\n/************* ACTUALIZAR INFORMACIÓN DE EMPLEADO ***************/");
		empleado3.setNombre("nombre modificado");
		oficina2.getListaEmpleados().add(empleado3);
		serviceOficina.actualizarOficina(oficina2);

		System.out.println("\n/************* ELIMINAR EMPLEADO ***************/");
		serviceEmpleado.eliminarEmpleadoPorId(4);
		List<Empleado> listaTodosLosEmpleados2 = serviceEmpleado.consultarTodosLosEmpleados();
		listaTodosLosEmpleados2.forEach(e -> {
			System.out.println("ID: " + e.getId() + " - NOMBRE: " + e.getNombre() + " - PUESTO: " + e.getPuesto()
					+ " - EMAIL: " + e.getEmail());
		});

		System.out.println("\n/******* EMPLEADOS CON PUESTO ESPECÍFICO *******/");
		List<Empleado> listaEmpleadosConPuestoEspecifico = serviceEmpleado.buscarEmpleadoConPuestoEspecifico("to3");
		listaEmpleadosConPuestoEspecifico.forEach(e -> {
			System.out.println("ID: " + e.getId() + " - NOMBRE: " + e.getNombre() + " - PUESTO: " + e.getPuesto()
					+ " - EMAIL: " + e.getEmail());
		});

		System.out.println("\n/******* CONSULTAR TODAS LAS OFICINAS *******/");
		List<Oficina> listaTodasLasOficinas = serviceOficina.consultarTodasLasOficinas();
		listaTodasLasOficinas.forEach(o -> {
			System.out.println(
					"ID: " + o.getId() + " - UBICACIÓN: " + o.getUbicacion() + " - TELÉFONO: " + o.getTelefono());
		});

		System.out.println("\n/******* CONSULTAR OFICINA POR ID *******/");
		Oficina oficinaPorIdConsultada = serviceOficina.consultarOficinaPorId(2);
		if (oficinaPorIdConsultada == null) {
			System.err.println("Oficina no encontrada");
		} else {
			System.out.println("ID: " + oficinaPorIdConsultada.getId() + " - UBICACIÓN: "
					+ oficinaPorIdConsultada.getUbicacion() + " - TELÉFONO: " + oficinaPorIdConsultada.getTelefono());
		}

		System.out.println("\n/******* ELIMINAR OFICINA POR ID *******/");
		// serviceOficina.eliminarOficinaPorId(1);
		List<Oficina> listaTodasLasOficinas2 = serviceOficina.consultarTodasLasOficinas();
		listaTodasLasOficinas2.forEach(o -> {
			System.out.println(
					"ID: " + o.getId() + " - UBICACIÓN: " + o.getUbicacion() + " - TELÉFONO: " + o.getTelefono());
		});

		System.out.println("\n/******* CONTAR EL NÚMERO DE EMPLEADOS DE UNA OFICINA *******/");
		Oficina oficinaParaContar = serviceOficina.consultarOficinaPorId(2);
		Integer numeroEmpleados = oficinaParaContar.getListaEmpleados().size();
		System.out.println(numeroEmpleados);

		System.out.println("\n/******* MAPA DE OFICINAS/NÚMERO DE EMPLEADOS *******/");
		Map<Integer, Integer> mapaEmpleadosPorOficina = listaTodasLasOficinas2.stream()
				.collect(Collectors.toMap(Oficina::getId, oficina -> oficina.getListaEmpleados().size()));
		mapaEmpleadosPorOficina.forEach(
				(id, cantidad) -> System.out.println("Oficina ID: " + id + " - Número de empleados: " + cantidad));

		System.out.println("\n/******* OFICINAS CON MAS DE N EMPLEADOS *******/");
		List<Oficina> oficinasConMasDeNEmpleados = serviceOficina.obtenerOficinasConMasDeNEmpleados(1);
		oficinasConMasDeNEmpleados.forEach(o -> {
			System.out.println(
					"ID: " + o.getId() + " - UBICACIÓN: " + o.getUbicacion() + " - TELÉFONO: " + o.getTelefono());
		});

		System.out.println("\n/********* ACTUALIZAR NÚMERO TELÉFONO OFICINA CON ID EMPLEADO *********/");
		serviceOficina.actualizarTelefonoOficinaPorIdDeEmpleado(2, "telefono modificado");
		List<Oficina> listaTodasLasOficinas3 = serviceOficina.consultarTodasLasOficinas();
		listaTodasLasOficinas3.forEach(o -> {
			System.out.println(
					"ID: " + o.getId() + " - UBICACIÓN: " + o.getUbicacion() + " - TELÉFONO: " + o.getTelefono());
		});

	}

}
