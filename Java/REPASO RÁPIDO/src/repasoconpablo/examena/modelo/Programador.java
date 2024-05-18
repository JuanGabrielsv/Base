package repasoconpablo.examena.modelo;

import java.math.BigDecimal;
import java.util.Objects;

public abstract class Programador {

	private String codigoProgramador;
	private BigDecimal sueldoBaseProgramdor;

	public Programador(String codigoProgramador) {
		super();
		this.codigoProgramador = codigoProgramador;
		this.sueldoBaseProgramdor = BigDecimal.ZERO;
	}

	public String getCodigoProgramador() {
		return codigoProgramador;
	}

	public void setCodigoProgramador(String codigoProgramador) {
		this.codigoProgramador = codigoProgramador;
	}

	public BigDecimal getSueldoBaseProgramdor() {
		return sueldoBaseProgramdor;
	}

	public void setSueldoBaseProgramdor(BigDecimal sueldoBaseProgramdor) {
		this.sueldoBaseProgramdor = sueldoBaseProgramdor;
	}
	
	public abstract BigDecimal getSueldoFinal();

	@Override
	public int hashCode() {
		return Objects.hash(codigoProgramador);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Programador other = (Programador) obj;
		return Objects.equals(codigoProgramador, other.codigoProgramador);
	}

}
