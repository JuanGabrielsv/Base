package repasoconpablo.examena.modelo;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class ProgramadorJunior extends Programador {

	private ProgramadorSenior tutor;
	
	public ProgramadorJunior(String codigoProgramador) {
		super(codigoProgramador);

	}	

	public ProgramadorSenior getTutor() {
		return tutor;
	}

	public void setTutor(ProgramadorSenior tutor) {
		this.tutor = tutor;
	}

	@Override
	public BigDecimal getSueldoFinal() {

		return this.getSueldoBaseProgramdor().setScale(2, RoundingMode.HALF_DOWN);

	}

}
