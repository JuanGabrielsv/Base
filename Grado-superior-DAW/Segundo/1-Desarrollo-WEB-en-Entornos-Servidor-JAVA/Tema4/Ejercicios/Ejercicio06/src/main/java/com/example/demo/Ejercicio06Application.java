package com.example.demo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.example.demo.model.Cliente;
import com.example.demo.model.Direccion;
import com.example.demo.service.ClienteService;

@SpringBootApplication
public class Ejercicio06Application implements CommandLineRunner {

	public static void main(String[] args) {
		SpringApplication.run(Ejercicio06Application.class, args);
	}
	
	@Autowired
	private ClienteService service;

	@Override
	public void run(String... args) throws Exception {
		
		Direccion direccion1 = new Direccion("Calle1", "Ciudad1");
		Direccion direccion2 = new Direccion("Calle2", "Ciudad2");
		Direccion direccion3 = new Direccion("Calle3", "Ciudad3");
		Direccion direccion4 = new Direccion("Calle4", "Ciudad4");
		Direccion direccion5 = new Direccion("Calle5", "Ciudad5");
		
		Cliente cliente1 = new Cliente("Cliente1", null);
		Cliente cliente2 = new Cliente("Cliente2", null);
		Cliente cliente3 = new Cliente("Cliente3", null);
		Cliente cliente4 = new Cliente("Cliente4", null);
		Cliente cliente5 = new Cliente("Cliente5", null);		
		
		service.guardarCliente(cliente1);
		service.guardarCliente(cliente2);		
		service.guardarCliente(cliente3);		
		service.guardarCliente(cliente4);		
		service.guardarCliente(cliente5);		
		
		service.guardarDireccion(direccion1);
		service.guardarDireccion(direccion2);
		service.guardarDireccion(direccion3);
		service.guardarDireccion(direccion4);
		service.guardarDireccion(direccion5);
		
		service.asignarDireccion(cliente1, direccion3);
		service.asignarDireccion(cliente2, direccion4);
		service.asignarDireccion(cliente3, direccion5);
		service.asignarDireccion(cliente4, direccion2);
		service.asignarDireccion(cliente5, direccion1);
		
		Cliente clienteBuscado = service.buscarClientePorId(3);
		
		service.modificarCliente(cliente1, "nombre");		
		
		List<Cliente> listaClientes = service.obtenerListaTodosClientes();		
		listaClientes.forEach(c -> {
			System.out.println(c.getId() + " " + c.getNombre() + " " + c.getDireccion().getCalle() + " " + c.getDireccion().getCiudad());
		});
		
		System.out.println(clienteBuscado.getDireccion().getCalle());
		
		
		
	}

}
