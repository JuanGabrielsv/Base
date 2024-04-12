package Ejercicio_entorno_refactorizacion.EJ2;

public class Fecha {

	private int DIA;
	private int mes;
	private int ano;

	public Fecha(int dia, int mes, int ano) {
		this.DIA = dia;
		this.mes = mes;
		this.ano = ano;
	}

	public boolean valida() {
		if (DIA < 1 || DIA > 31) {
			return false;
		}
		if (mes < 1 || mes > 12) {
			return false;
		}

		int diasMes = 0;
		switch (mes) {
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
			diasMes = 31;
			break;
		case 4:
		case 6:
		case 9:
		case 11:
			diasMes = 30;
			break;
		case 2: // a�o bisiesto
			if ((ano % 400 == 0) ||
					((ano % 4 == 0) && (ano % 100 != 0)))
				diasMes = 29;
			else
				diasMes = 28;
			break;
		}
		if (DIA > diasMes) {
			return false;
		}
		else {
			return true;
		}

	}

}
