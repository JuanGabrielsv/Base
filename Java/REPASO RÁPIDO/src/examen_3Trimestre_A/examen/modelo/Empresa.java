package examen_3Trimestre_A.examen.modelo;

import java.util.List;

public class Empresa {

	private String nombreComercialEmpresa;
	private List<Proyecto> listaProyectosEmpresa;
	private List<Programador> listaProgramadoresEmpresa;

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

}
