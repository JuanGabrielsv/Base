package examen_b;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Taller {

	String concesionario;
	List<EntradaCoche> entradas;

	public Taller(String concesionario) {
		this.concesionario = concesionario;
		this.entradas = new ArrayList<>();
	}

	public String getConcesionario() {
		return concesionario;
	}

	public Boolean addEntradaCoche(EntradaCoche entradaCoche) {

		for (EntradaCoche entradaAuto : entradas) {

			LocalDate date = LocalDate.now();

			if (entradaAuto.getFecha().isAfter(date)
					&& entradaCoche.getMatricula().equals(entradaAuto.getMatricula())) {
				return false;
			}
		}
		entradas.add(entradaCoche);
		return true;
	}

	public List<EntradaCoche> getHistorialReparacionesCoche(String matricula) {

		List<EntradaCoche> resultado = new ArrayList<>();

		for (EntradaCoche entradaAuto : entradas) {

			LocalDate date = LocalDate.now();

			if (entradaAuto.getFecha().isBefore(date) && entradaAuto.getMatricula().equals(matricula)) {
				resultado.add(entradaAuto);
			}
		}
		return resultado;
	}

	public BigDecimal getImporteParaCobrar() {

		BigDecimal precioTotal = new BigDecimal(0);

		for (EntradaCoche entradaCoche : entradas) {

			if (entradaCoche.getTerminado()) {
				precioTotal = precioTotal.add(entradaCoche.getPrecioTrabajo());
			}

		}
		return precioTotal.setScale(2, RoundingMode.HALF_UP);
	}

	public Boolean estaCocheEnTaller(String matricula) {

		for (EntradaCoche entradaCoche : entradas) {
			if (entradaCoche.getMatricula().equals(matricula) && !entradaCoche.getEntregado()) {
				return true;
			}

		}
		return false;
	}

	public void borrarHistorialCochesEntregados() {

		Iterator<EntradaCoche> iterator = entradas.iterator();
		while (iterator.hasNext()) {
			EntradaCoche entrada = iterator.next();
			if (entrada.getEntregado()) {
				iterator.remove();
			}
		}
	}

	public void entregarCochesTermiandos() {

		for (EntradaCoche entradaCoche : entradas) {
			if (entradaCoche.getTerminado()) {
				entradaCoche.setEntregado(true);
			}
		}

	}

}
