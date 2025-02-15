package com.example.demo.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.model.Perfil;
import com.example.demo.model.Usuario;

@Repository
public interface UsuarioRespository {

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
