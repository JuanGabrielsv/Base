package examen_a;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Agenda {

	private String medicoEspecialista;
	List<Agenda> citas;

	public Agenda(String medicoEspecialista) {
		this.medicoEspecialista = medicoEspecialista;
		this.citas = new ArrayList<>();		
	}

	public String getMedicoEspecialista() {
		return medicoEspecialista;
	}

}
