package com.example.demo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.example.demo.model.Perfil;
import com.example.demo.model.Usuario;
import com.example.demo.service.UsuarioService;

@SpringBootApplication
public class Ejercicio08Application implements CommandLineRunner {

	public static void main(String[] args) {
		SpringApplication.run(Ejercicio08Application.class, args);
	}

	@Autowired
	private UsuarioService service;

	public void run(String... args) throws Exception {

		Perfil perfilUsuario1 = new Perfil("perfildepepe", "DISPONIBLE");
		Perfil perfilUsuario2 = new Perfil("perfildeandres", "DISPONIBLE");
		Usuario usuario1 = new Usuario("Pepe Ruiz", "ppruiz@gmail.com", perfilUsuario1);
		Usuario usuario2 = new Usuario("Andrés Ramírez", "aramirez@gmail.com", perfilUsuario2);

		service.insertarUsuario(usuario1);
		service.insertarUsuario(usuario2);

		List<Usuario> listaTodosUsuarios = service.obtenerListaTodosUsuarios();
		listaTodosUsuarios.forEach(u -> {
			System.out.println(u.getId() + " " + u.getNombre() + " " + u.getEmail() + " " + u.getPerfil().getId() + " "
					+ u.getPerfil().getBio() + " " + u.getPerfil().getEstado());
		});

		Usuario usuarioAndres = service.obtenerUsuarioPorId(2);
		System.out.println(usuarioAndres.getNombre());

		service.actualizarDatosUsuario(1, null, "ppruiz2@gmail.com", null, "NO DISPONIBLE");

		List<Usuario> listaTodosUsuarios2 = service.obtenerListaTodosUsuarios();
		listaTodosUsuarios2.forEach(u -> {
			System.out.println(u.getId() + " " + u.getNombre() + " " + u.getEmail() + " " + u.getPerfil().getId() + " "
					+ u.getPerfil().getBio() + " " + u.getPerfil().getEstado());
		});

		Perfil perfilObtenido = service.obtenerPerfilUsuario(2);

		System.out.println(perfilObtenido.getId() + " " + perfilObtenido.getBio() + " " + perfilObtenido.getEstado());

		List<Usuario> listaUsuariosBioPorPalabra = service.obtenerBioPorPalabraContenida("perfil");

		listaUsuariosBioPorPalabra.forEach(u -> {
			System.out.println(u.getId() + " " + u.getNombre() + " " + u.getEmail() + " " + u.getPerfil().getId() + " "
					+ u.getPerfil().getBio() + " " + u.getPerfil().getEstado());
		});

		Usuario primerUsuarioDisponible = service.mostrarPrimerUsuarioDisponible();
		System.out.println(primerUsuarioDisponible.getNombre());

		List<Usuario> listaUsuariosNoDisponibles = service.obtenerUsuariosNoDisponibles();
		listaUsuariosNoDisponibles.forEach(u -> {
			System.out.println(u.getId() + " " + u.getNombre() + " " + u.getEmail() + " " + u.getPerfil().getId() + " "
					+ u.getPerfil().getBio() + " " + u.getPerfil().getEstado());
		});
		
		System.out.println("***************************** ELIMINAR USUARIO *****************************");
		service.eliminarUsuario(1);
		List<Usuario> listaTodosUsuarios3 = service.obtenerListaTodosUsuarios();
		listaTodosUsuarios3.forEach(u -> {
			System.out.println(u.getId() + " " + u.getNombre() + " " + u.getEmail() + " " + u.getPerfil().getId() + " "
					+ u.getPerfil().getBio() + " " + u.getPerfil().getEstado());
		});

	}

}
