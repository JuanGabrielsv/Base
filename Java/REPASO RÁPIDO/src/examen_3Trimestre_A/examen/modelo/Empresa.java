package examen_3Trimestre_A.examen.modelo;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Empresa {

	private String nombreComercialEmpresa;
	private List<Proyecto> listaProyectosEmpresa;
	private List<Programador> listaProgramadoresEmpresa;

	public Empresa() {
		this.listaProyectosEmpresa = new ArrayList<Proyecto>();
		this.listaProgramadoresEmpresa = new ArrayList<Programador>();
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
		Map<String, List<Programador>> mProgramadores = new HashMap<>();
		return mProgramadores;
	}

	public Proyecto getProyectoMayorEquipo() throws ProyectoNotFoundException {

		Integer vTamano = 0;
		Proyecto proyectoMayor = new Proyecto(null, null);

		for (Proyecto proyecto : listaProyectosEmpresa) {
			if (proyecto.getListaProgramadoresProyecto().size() > vTamano) {
				vTamano = proyecto.getListaProgramadoresProyecto().size();
				proyectoMayor = proyecto;
			}
		}

		if (this.listaProyectosEmpresa.isEmpty()) {
			throw new ProyectoNotFoundException("No hay proyectos");
		}

		return proyectoMayor;

	}

	public BigDecimal getSueldosProyecto(String codigoProyecto) throws ProyectoNotFoundException {
		BigDecimal sueldoTotalProyecto = BigDecimal.ZERO;
		Boolean existe = false;

		for (Proyecto proyecto : listaProyectosEmpresa) {
			if (proyecto.getCodigoProyecto().contains(codigoProyecto)) {
				existe = true;
				break;
			}
		}

		if (existe == true) {
			for (Proyecto proyecto : listaProyectosEmpresa) {
				if (proyecto.getCodigoProyecto().contains(codigoProyecto)) {
					for (Programador programador : proyecto.getListaProgramadoresProyecto()) {
						sueldoTotalProyecto = sueldoTotalProyecto.add(programador.getSueldoFinal());
					}
				}
			}
		} else if (existe == false) {
			throw new ProyectoNotFoundException("No existe proyecto con el código indicado");
		}

		return sueldoTotalProyecto;
	}

	public List<Proyecto> getProyectosActualesSinPresupuesto() {
		List<Proyecto> listaProyectosActualesSinPresupuesto = new ArrayList<Proyecto>();
		for (Proyecto proyecto : listaProyectosEmpresa) {
			if (proyecto.getFechaEntregaProyecto().isAfter(LocalDate.now())
					&& proyecto.getPresupuestoRestante() == BigDecimal.ZERO
					&& proyecto.getFechaInicioProyecto().isBefore(LocalDate.now())) {
				listaProyectosActualesSinPresupuesto.add(proyecto);
			}
		}
		return listaProyectosActualesSinPresupuesto;
	}

	@Override
	public String toString() {
		String mensaje = "------------------------\n";
		mensaje += this.getNombreComercialEmpresa() + "\n";
		mensaje += "------------------------\nProyectos:\n\t";
		for (Proyecto proyecto : listaProyectosEmpresa) {
			mensaje += proyecto.getCodigoProyecto() + "-" + proyecto.getDescripcionProyecto() + " // Presupuesto: "
					+ proyecto.getPresupuestoProyecto() + " ("
					+ proyecto.getCosteActualProyecto().setScale(2, RoundingMode.HALF_DOWN) + ")\n\t";
		}

		return mensaje;
	}

}
