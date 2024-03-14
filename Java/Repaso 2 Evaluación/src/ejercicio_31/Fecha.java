/*
PARTE 1
• Vamos a crear una clase Fecha que nos permita trabajar con este tipo de dato. 
• Piensa un diseño para la clase, es decir, piensa que atributos y métodos debería de tener.
• Ponte en el lugar de una empresa que está desarrollando esta clase y su objetivo luego es utilizarla en
  todos sus programas o incluso venderla para que la usen otras empresas.

PARTE 2
•Implementa el diseño que habéis decidido de mutuo acuerdo entre todos. Crea un programa
 que utilice la clase Fecha.
*/
package ejercicio_31;

public class Fecha {

	private Integer dia;
	private Integer mes;
	private Integer ano;

	// CONSTRUCORES

	public Fecha(Integer dia, Integer mes, Integer ano) {

		super();
		this.dia = dia;
		this.mes = mes;
		this.ano = ano;

	}	
	
	// TO STRING
	
	@Override
	public String toString() {
		return "Fecha [dia=" + dia + ", mes=" + mes + ", ano=" + ano + "]";
	}

}
