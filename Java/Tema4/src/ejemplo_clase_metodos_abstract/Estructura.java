/* COMO FUNCIONA CLASES Y MÉTODOS ABSTRACT */
package ejemplo_clase_metodos_abstract;

import java.util.ArrayList;
import java.util.List;

public abstract class Estructura {

	protected List<String> datos;

	public Estructura() {
		datos = new ArrayList<>();
	}

	public void añadirCadena(String cadena) {
		datos.add(cadena);
	}

	public Integer getTamaño() {
		return datos.size();

	}

	@Override
	public String toString() {
		return datos.toString();
	}
	
	public abstract String sacarCadena();

}
