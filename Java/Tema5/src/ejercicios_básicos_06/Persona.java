/*
EJERCICIO 6
Construye la clase Persona que tenga como atributos el género (String) y la altura (BigDecimal).
Crea método toString() y sus métodos get() y set() teniendo en cuenta que:

• El método setGenero() sólo admitirá recibir por parámetro el valor H o M. 
  Si recibe cualquier otra cosa, tendrá que lanzar una excepción nueva llamada
  “ParametroIncorrectoException” indicando el detalle del error.
  
• El método setAltura() solo admitirá un BigDecimal comprendido entre 0 y 3, ambos
  excluidos. Si recibe cualquier otra cosa, tendrá que lanzar también una
  ParametroIncorrectoException indicando el detalle del error.
  
Haz una aplicación para permitir al usuario crear Personas indicando los datos por consola.
Cuando lo haga, imprime los datos. Controla las excepciones que pueden originarse e imprime
el mensaje de error correspondiente. 
*/
package ejercicios_básicos_06;

import java.math.BigDecimal;

public class Persona {

	private String genero;
	private BigDecimal altura;

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) throws ParametroIncorrectoException {
		this.genero = genero.toUpperCase();
		if (!genero.equals("H") && !genero.equals("M")) {
			throw new ParametroIncorrectoException("El género tiene que ser H o M");
		}

	}

	public BigDecimal getAltura() {
		return altura;
	}

	public void setAltura(BigDecimal altura) {
		if (!(altura.compareTo(new BigDecimal(3)) == -1))  {
			this.altura = altura;
		}
		
	}

	@Override
	public String toString() {
		return "Persona [genero=" + genero + ", altura=" + altura + "]";
	}

}
