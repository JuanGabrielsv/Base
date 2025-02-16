package com.example.demo.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.model.Empleado;
import com.example.demo.model.Oficina;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Repository
@Transactional
public class RepositoryEmpleadoImpl implements RepositoryEmpleado {

	@PersistenceContext
	private EntityManager entity;

	@Override
	public void guardarEmpleado(Empleado empleado) {
		entity.persist(empleado);
	}

	@Override
	public List<Empleado> consultarTodosLosEmpleados() {
		return entity.createQuery("SELECT e FROM Empleado e", Empleado.class).getResultList();
	}

	@Override
	public Empleado consultarEmpleadoPorId(Integer id) {
		return entity.find(Empleado.class, id);
	}

	@Override
	public void eliminarEmpleadoPorId(Integer id) {
		Empleado empleado = entity.find(Empleado.class, id);
		 if (empleado != null) {

		        Oficina oficina = entity.createQuery(
		            "SELECT o FROM Oficina o JOIN o.listaEmpleados e WHERE e.id = :id", Oficina.class)
		            .setParameter("id", id)
		            .getSingleResult();		        

		        oficina.getListaEmpleados().remove(empleado);
		        entity.merge(oficina);        

		        entity.remove(empleado);
		        entity.flush();
		    } else {
		        throw new RuntimeException("Empleado con ID " + id + " no encontrado");
		    }
	}

	@Override
	public List<Empleado> buscarEmpleadoConPuestoEspecifico(String puesto) {
		return entity.createQuery("SELECT e FROM Empleado e WHERE e.puesto LIKE :puesto", Empleado.class).setParameter("puesto", "%" + puesto + "%").getResultList();
		
		
	}

}
