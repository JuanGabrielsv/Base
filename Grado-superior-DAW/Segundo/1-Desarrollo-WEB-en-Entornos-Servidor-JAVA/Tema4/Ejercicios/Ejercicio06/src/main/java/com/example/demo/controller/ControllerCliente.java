package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.demo.model.Cliente;
import com.example.demo.service.ClienteService;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class ControllerCliente {
	
	@Autowired
	private ClienteService service;
	
	@GetMapping("/clientes")
	public String cargarIndex(Model model) {		
		
		model.addAttribute("listaCliente", service.obtenerListaTodosClientes());		
		return "index";
	}
	
	@GetMapping("/clientedetalle/{id}")
	public String detalleCliente(Model model, @PathVariable Integer id) {
		
		model.addAttribute("detalleCliente", service.buscarClientePorId(id));
		
		return "cliente-detalle";
	}
	
	@GetMapping("/clienteformulario")
	public String formularioCliente(Model model) {
		model.addAttribute("cliente", new Cliente());
		return "cliente-formulario";
	}
	
	@PostMapping("/clienteformulario")
	public String formularioCliente(@ModelAttribute Cliente cliente) {
		service.guardarCliente(cliente);
		
		return "redirect:/clientes";
	}
	
	

}
