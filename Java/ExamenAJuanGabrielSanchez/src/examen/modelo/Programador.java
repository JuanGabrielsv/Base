package examen.modelo;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Objects;

public abstract class Programador {

	public static final String JUNIOR = "J";
	public static final String SENIOR = "S";

	private String codigoEmpleado;
	private static BigDecimal sueldoBase;

	public Programador(String codigo) {
		this.codigoEmpleado = codigo;
		Programador.sueldoBase = BigDecimal.ZERO;
		
	}

	public String getCodigoEmpleado() {
		return codigoEmpleado;
	}

	public void setCodigoEmpleado(String codigoEmpleado) {
		this.codigoEmpleado = codigoEmpleado;
	}

	public static BigDecimal getSueldoBase() {
		return sueldoBase;
	}

	public void setSueldoBase(BigDecimal sueldoBase) {
		Programador.sueldoBase = sueldoBase;
	}
	
	public BigDecimal getSueldoFinal() {
		if (getTipo().equals(Programador.JUNIOR)) {
			return Programador.sueldoBase.setScale(2, RoundingMode.HALF_DOWN);			
		} else {
			
			return Programador.getSueldoBase().add(new BigDecimal(1000));
		}
	}
	
	public abstract String getTipo();

	@Override
	public int hashCode() {
		return Objects.hash(codigoEmpleado);
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
		return Objects.equals(codigoEmpleado, other.codigoEmpleado);
	}
	
	

}
