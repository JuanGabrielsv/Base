package examen.modelo;

public class ProgramadorJunior extends Programador {

	private ProgramadorSenior tutor;

	public ProgramadorJunior(String codigo) {
		super(codigo);
		// TODO Auto-generated constructor stub
	}

	public ProgramadorSenior getTutor() {
		return tutor;
	}

	public void setTutor(ProgramadorSenior tutor) {
		this.tutor = tutor;
	}

	@Override
	public String getTipo() {
		return JUNIOR;
	}

}
