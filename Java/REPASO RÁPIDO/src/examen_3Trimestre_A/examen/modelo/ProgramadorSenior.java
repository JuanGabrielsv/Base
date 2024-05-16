package examen_3Trimestre_A.examen.modelo;

import java.math.BigDecimal;

public class ProgramadorSenior extends Programador {	

	private Integer anoAntiguedadProgramadorSenior;
	
	public ProgramadorSenior(String codigo) {
		super(codigo);		
	}

	public Integer getAnoAntiguedadProgrmadorSenior() {
		return anoAntiguedadProgramadorSenior;
	}

	public void setAnoAntiguedadProgrmadorSenior(Integer anoAntiguedadProgrmadorSenior) {
		this.anoAntiguedadProgramadorSenior = anoAntiguedadProgrmadorSenior;
	}	
	
	public BigDecimal getSueldoFinal() {
		BigDecimal sueldoFinal = this.getSueldoBaseProgramador().add(new BigDecimal(1000)
				.multiply(new BigDecimal(this.anoAntiguedadProgramadorSenior)));
		return sueldoFinal;
	}

}
