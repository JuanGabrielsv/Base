package repasoconpablo.examena.modelo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Empresa {

	private String nombreComercialEmpresa;
	private List<Proyecto> listaProyectosEmpresa;
	private List<Programador> listaProgramadoresEmpresa;
	
	public Empresa() {
		this.listaProgramadoresEmpresa = new ArrayList<Programador>();
		this.listaProyectosEmpresa = new ArrayList<Proyecto>();
	}

	public String getNombreComercialEmpresa() {
		return nombreComercialEmpresa;
	}

	public void setNombreComercialEmpresa(String nombreComercialEmpresa) {
		this.nombreComercialEmpresa = nombreComercialEmpresa;
	}

	public List<Proyecto> getListaProyectosEmpresa() {
		return listaProyectosEmpresa;
	}

	public void setListaProyectosEmpresa(List<Proyecto> listaProyectosEmpresa) {
		this.listaProyectosEmpresa = listaProyectosEmpresa;
	}

	public List<Programador> getListaProgramadoresEmpresa() {
		return listaProgramadoresEmpresa;
	}

	public void setListaProgramadoresEmpresa(List<Programador> listaProgramadoresEmpresa) {
		this.listaProgramadoresEmpresa = listaProgramadoresEmpresa;
	}
	
	public Map<String, List<Programador>> getMapaProgramadores() {
		Map<String, List<Programador>> mapaListaProgramadores = new HashMap<String, List<Programador>>();
		for (Proyecto proyecto : this.getListaProyectosEmpresa()) {
			mapaListaProgramadores.put(proyecto.getCodigoProyecto(), proyecto.getListaProgramadorProyectos());			
		}
		return mapaListaProgramadores;
	}

}
