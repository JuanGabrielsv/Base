package examen_3Trimestre_A.examen.modelo;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Objects;

public class Programador {

	private String codEmpleadoProgramador;
	private BigDecimal sueldoBaseProgramador;

	public Programador(String codigo) {
		this.codEmpleadoProgramador = codigo;
		this.sueldoBaseProgramador = BigDecimal.ZERO;
	}

	public String getCodEmpleadoProgramador() {
		return codEmpleadoProgramador;
	}

	public void setCodEmpleadoProgramador(String codEmpleadoProgramador) {
		this.codEmpleadoProgramador = codEmpleadoProgramador;
	}

	public BigDecimal getSueldoBaseProgramador() {
		return sueldoBaseProgramador;
	}

	public void setSueldoBaseProgramador(BigDecimal sueldoBaseProgramador) {
		this.sueldoBaseProgramador = sueldoBaseProgramador;
	}

	public BigDecimal getSueldoFinal() {		
		return this.getSueldoBaseProgramador().setScale(2, RoundingMode.HALF_DOWN);
	}

	@Override
	public int hashCode() {
		return Objects.hash(codEmpleadoProgramador);
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
		return Objects.equals(codEmpleadoProgramador, other.codEmpleadoProgramador);
	}

}
