package repasoconpablo.examena.modelo;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class ProgramadorSenior extends Programador {

	private Integer anosDeAntiguedadProgramdorSenior;

	public ProgramadorSenior(String codigoProgramador) {
		super(codigoProgramador);
	}

	public Integer getAnosDeAntiguedadProgramdorSenior() {
		return anosDeAntiguedadProgramdorSenior;
	}

	public void setAnosDeAntiguedadProgramdorSenior(Integer anosDeAntiguedadProgramdorSenior) {
		this.anosDeAntiguedadProgramdorSenior = anosDeAntiguedadProgramdorSenior;
	}

	@Override
	public BigDecimal getSueldoFinal() {

		return this.getSueldoBaseProgramdor().add(new BigDecimal(1000)).multiply(
				new BigDecimal(this.getAnosDeAntiguedadProgramdorSenior()).setScale(2, RoundingMode.HALF_DOWN));

	}

}
