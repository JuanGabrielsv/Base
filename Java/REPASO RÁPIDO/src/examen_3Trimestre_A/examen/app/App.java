package examen_3Trimestre_A.examen.app;

import java.math.BigDecimal;

import examen_3Trimestre_A.examen.modelo.ProgramadorJunior;
import examen_3Trimestre_A.examen.modelo.ProgramadorSenior;

public class App {

	public static void main(String[] args) {
		ProgramadorSenior programador1 = new ProgramadorSenior("41950");
		ProgramadorJunior programador2 = new ProgramadorJunior("41951");
		
		programador1.setAnoAntiguedadProgrmadorSenior(5);
		programador1.setSueldoBaseProgramador(new BigDecimal(2000));
		
		programador2.setSueldoBaseProgramador(new BigDecimal(2000));
				
		System.out.println(programador1.getSueldoFinal());
		System.out.println(programador2.getSueldoFinal());

	}

}
