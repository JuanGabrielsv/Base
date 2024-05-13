package examen.modelo;

public class ProgramadorSenior extends Programador {

	private Integer anosAntiguedad;

	public ProgramadorSenior(String codigo) {
		super(codigo);
		// TODO Auto-generated constructor stub
	}

	public Integer getAnosAntiguedad() {
		return anosAntiguedad;
	}

	public void setAnosAntiguedad(Integer anosAtiguedad) {
		this.anosAntiguedad = anosAtiguedad;
	}

	@Override
	public String getTipo() {
		return SENIOR;
	}

}
