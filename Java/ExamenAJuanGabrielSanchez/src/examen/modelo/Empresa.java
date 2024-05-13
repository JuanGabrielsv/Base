package examen.modelo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Empresa {

	private String nombreComercial;
	private List<Proyecto> lProyectos;
	private List<Programador> lProgramadoresEmpresa;

	public String getNombreComercial() {
		return nombreComercial;
	}

	public void setNombreComercial(String nombreComercial) {
		this.nombreComercial = nombreComercial;
	}

	public List<Proyecto> getlProyectos() {
		return lProyectos;
	}

	public void setlProyectos(List<Proyecto> lProyectos) {
		this.lProyectos = lProyectos;
	}

	public List<Programador> getlProgramadoresEmpresa() {
		return lProgramadoresEmpresa;
	}

	public void setlProgramadoresEmpresa(List<Programador> lProgramadoresEmpresa) {
		this.lProgramadoresEmpresa = lProgramadoresEmpresa;
	}
	
	public Map<String, List<Programador>> getMapaProgramadores() {
		Map<String, List<Programador>> mProgramadores = new HashMap<String, List<Programador>>();
		return mProgramadores;
	}
	
	
	public BigDecimal getSueldoProyecto(String codigo) {
		if (lProyectos.contains(codigo)) {
			BigDecimal suma = BigDecimal.ZERO;
			for (Programador programador : lProgramadoresEmpresa) {
				suma = suma.add(programador.getSueldoBase());
				return suma;
			}
		}
		return null;
	}	
	

}
