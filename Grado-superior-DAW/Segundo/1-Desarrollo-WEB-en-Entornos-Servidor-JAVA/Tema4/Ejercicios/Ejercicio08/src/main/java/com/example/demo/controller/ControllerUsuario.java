package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.Perfil;
import com.example.demo.model.Usuario;
import com.example.demo.service.UsuarioService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
@RequestMapping("/usuarios")
public class ControllerUsuario {
	
	@Autowired
	private UsuarioService service;
	
	@GetMapping
	public String cargarIndex(Model model) {
		return "index";
	}
	
	@GetMapping("/listausuarios")
	public String mostrarUsuarios(Model model) {
		model.addAttribute("listaUsuarios", service.obtenerListaTodosUsuarios());
		return "usuarios";
	}
	
	@GetMapping("/anadirusuario")
	public String nuevoUsuario(Model model) {
		Usuario usuario = new Usuario();
		Perfil perfil = new Perfil();		
		usuario.setPerfil(perfil);
		
		model.addAttribute("usuario", usuario);
		
		return "usuario-form";
	}
	
	@PostMapping
    public String guardarUsuario(@ModelAttribute Usuario usuario) {
    
        service.insertarUsuario(usuario);
        return "redirect:/usuarios/listausuarios";
    }
	
	@GetMapping("/primerusuariodisponible")
	public String pasarUsuario(Model model) {
		model.addAttribute("primerUsuarioDisponible", service.mostrarPrimerUsuarioDisponible());
		return "primerUsuario";
	}
	
	@GetMapping("/listausuarios/{id}")
	public String detalleId(@PathVariable Integer id, Model model) {
		Usuario usuario = service.obtenerUsuarioPorId(id);
		model.addAttribute("usuario", usuario);
		return "usuario-form";
	}	

}
