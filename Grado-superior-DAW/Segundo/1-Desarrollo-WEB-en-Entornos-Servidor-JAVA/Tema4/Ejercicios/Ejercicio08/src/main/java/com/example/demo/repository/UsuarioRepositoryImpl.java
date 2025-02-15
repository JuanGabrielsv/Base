package com.example.demo.repository;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.example.demo.model.Perfil;
import com.example.demo.model.Usuario;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Repository
public class UsuarioRepositoryImpl implements UsuarioRespository {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<Usuario> obtenerListaTodosUsuarios() {
		return entityManager.createQuery("SELECT u FROM Usuario u", Usuario.class).getResultList();
	}

	@Override
	public Usuario obtenerUsuarioPorId(Integer id) {
		return entityManager.find(Usuario.class, id);
	}

	@Override
	public void insertarUsuario(Usuario usuario) {
		entityManager.persist(usuario);
	}

	@Override
	public void actualizarDatosUsuario(Integer id, String nombre, String email, String bio, String estado) {
		if (obtenerUsuarioPorId(id) != null) {
			Usuario u = obtenerUsuarioPorId(id);

			if (nombre != null) {
				u.setNombre(nombre);
			}
			if (email != null) {
				u.setEmail(email);
			}
			if (bio != null) {
				u.getPerfil().setBio(bio);
			}
			if (estado != null) {
				u.getPerfil().setEstado(estado);
			}

			entityManager.merge(u);
		}

	}

	@Override
	public Perfil obtenerPerfilUsuario(Integer id) {
		if (obtenerUsuarioPorId(id) != null) {
			Usuario u = obtenerUsuarioPorId(id);
			Perfil p = u.getPerfil();
			return p;
		}

		return null;
	}

	@Override
	public List<Usuario> obtenerBioPorPalabraContenida(String palabra) {
		return entityManager.createQuery("SELECT u FROM Usuario u WHERE u.perfil.bio LIKE :palabra", Usuario.class)
				.setParameter("palabra", "%" + palabra + "%").getResultList();
	}

	@Override
	public Usuario mostrarPrimerUsuarioDisponible() {
		List<Usuario> listaUsuarios = obtenerListaTodosUsuarios();
		for (Usuario u : listaUsuarios) {
			if (u.getPerfil().getEstado().trim().equalsIgnoreCase("DISPONIBLE")) {
				return u;
			}
		}

		Usuario usuario = new Usuario();
		return usuario;
	}

	@Override
	public List<Usuario> obtenerUsuariosNoDisponibles() {
		return entityManager.createQuery("SELECT u FROM Usuario u WHERE u.perfil.estado LIKE :estado", Usuario.class)
				.setParameter("estado", "NO DISPONIBLE").getResultList();
	}

	@Override
	public void eliminarUsuario(Integer id) {
		Usuario usuario = entityManager.find(Usuario.class, id);
		if (usuario != null) {
			entityManager.remove(usuario);
		}
		
	}

}
