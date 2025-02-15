package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.model.Perfil;
import com.example.demo.model.Usuario;

@Service
public interface UsuarioService {

	List<Usuario> obtenerListaTodosUsuarios();

	Usuario obtenerUsuarioPorId(Integer id);

	void insertarUsuario(Usuario usuario);

	void actualizarDatosUsuario(Integer id, String nombre, String email, String bio, String estado);

	Perfil obtenerPerfilUsuario(Integer id);

	List<Usuario> obtenerBioPorPalabraContenida(String palabra);

	Usuario mostrarPrimerUsuarioDisponible();

	List<Usuario> obtenerUsuariosNoDisponibles();

	void eliminarUsuario(Integer id);

	
}
