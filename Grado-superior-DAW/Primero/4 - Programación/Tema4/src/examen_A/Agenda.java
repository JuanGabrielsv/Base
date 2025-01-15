package examen_A;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Agenda {

	private String medicoEspecialista;
	List<Cita> citas;

	public Agenda(String medicoEspecialista) {
		this.medicoEspecialista = medicoEspecialista;
		this.citas = new ArrayList<>();
	}

	public String getMedicoEspecialista() {
		return medicoEspecialista;
	}

	public void addCita(Cita entradaCita) {
		if (!citas.contains(entradaCita)) {
			citas.add(entradaCita);
		}
	}

	public List<Cita> getCitasDias(LocalDate date) {

		List<Cita> resultado = new ArrayList<>();

		for (Cita cita : citas) {
			if (cita.getFecha().isEqual(date)) {
				resultado.add(cita);
			}
		}
		return resultado;
	}

	public BigDecimal getImportePendienteFacturar() {
		BigDecimal suma = new BigDecimal(0);

		for (Cita cita : citas) {
			if (!cita.getFacturado()) {
				suma = suma.add(cita.getImporteFactura());
			}
		}
		return suma.setScale(2, RoundingMode.HALF_DOWN);
	}

	public Boolean tieneCitaProxima(String paciente) {

		LocalDate now = LocalDate.now();

		for (Cita cita : citas) {
			if (cita.getNombrePaciente() == paciente && cita.getFecha().isAfter(now)) {
				return true;
			}
		}
		return false;
	}

	public void borrarCitasFacturadas() {

		Iterator<Cita> iterator = citas.iterator();
		while (iterator.hasNext()) {
			Cita entrada = iterator.next();
			if (entrada.getFacturado()) {
				iterator.remove();
			}
		}

	}

	public void facturarCitasPendientes(String paciente) {

		LocalDate now = LocalDate.now();

		for (Cita cita : citas) {
			if (cita.getFecha().isAfter(now)) {
				cita.setFacturado(true);
			}
		}
	}

}
