package examen_3Trimestre_A.examen.modelo;

public class ProgramadorJunior extends Programador {

	private Programador tutorProgramadorJunior;

	public ProgramadorJunior(String codigo) {
		super(codigo);		
	}

	public Programador getTutorProgramadorJunior() {
		return tutorProgramadorJunior;
	}

	public void setTutorProgramadorJunior(Programador tutorProgramadorJunior) {
		this.tutorProgramadorJunior = tutorProgramadorJunior;
	}

}
