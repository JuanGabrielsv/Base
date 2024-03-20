package ejercicio_32_SIN_TERMINAR;

public class Reloj {

	private Integer horas;
	private Integer minutos;
	private Integer segundos;
	private Boolean formato24Horas;

	// CONSTRUCTORES

	public Reloj() {
		super();
		this.horas = 00;
		this.minutos = 00;
		this.segundos = 00;
		this.formato24Horas = true;
	}

	public Reloj(Integer horas, Integer minutos, Integer segundos) {
		super();
		this.horas = horas;
		this.minutos = minutos;
		this.segundos = segundos;
		this.formato24Horas = true;
	}
	
	// MÉTODOS GET AND SETS

		public void setFormato24Horas(Boolean formato24Horas) {
			this.formato24Horas = formato24Horas;
		}

		public Integer getHoras() {
			return horas;
		}

		public Integer getMinutos() {
			return minutos;
		}

		public Integer getSegundos() {
			return segundos;
		}

		public Boolean getFormato24Horas() {
			return formato24Horas;
		}

	// MÉTODOS

	public void ponerEnHora(Integer horas, Integer minutos) {
		this.horas = horas;
		this.minutos = minutos;
	}

	public void ponerEnHora(Integer horas, Integer minutos, Integer segundos) {
		this.horas = horas;
		this.minutos = minutos;
		this.segundos = segundos;
	}

	public Boolean check() {
		if (getHoras() >= 0 && getHoras() <= 23) {

		} else {
			return false;
		}

		if (getMinutos() >= 0 && getMinutos() <= 59) {

		} else {
			return false;
		}

		if (getSegundos() >= 0 && getSegundos() <= 59) {

		} else {
			return false;
		}

		return true;
	}

}
