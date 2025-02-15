package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Perfil;
import com.example.demo.model.Usuario;
import com.example.demo.repository.UsuarioRespository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class UsuarioServiceImpl implements UsuarioService {
	
	@Autowired
	private UsuarioRespository repositorio;

	@Override
	public List<Usuario> obtenerListaTodosUsuarios() {
		return repositorio.obtenerListaTodosUsuarios();
	}

	@Override
	public Usuario obtenerUsuarioPorId(Integer id) {		
		return repositorio.obtenerUsuarioPorId(id);
	}

	@Override
	public void insertarUsuario(Usuario usuario) {
		repositorio.insertarUsuario(usuario);
		
	}

	@Override
	public void actualizarDatosUsuario(Integer id, String nombre, String email, String bio, String estado) {
		repositorio.actualizarDatosUsuario(id, nombre, email, bio, estado);
		
	}

	@Override
	public Perfil obtenerPerfilUsuario(Integer id) {		
		return repositorio.obtenerPerfilUsuario(id);
	}

	@Override
	public List<Usuario> obtenerBioPorPalabraContenida(String palabra) {
		
		return repositorio.obtenerBioPorPalabraContenida(palabra);
	}

	@Override
	public Usuario mostrarPrimerUsuarioDisponible() {
		return repositorio.mostrarPrimerUsuarioDisponible();
		
	}

	@Override
	public List<Usuario> obtenerUsuariosNoDisponibles() {
		
		return repositorio.obtenerUsuariosNoDisponibles();
	}

	@Override
	public void eliminarUsuario(Integer id) {
		repositorio.eliminarUsuario(id);
		
	}
	
	

}
