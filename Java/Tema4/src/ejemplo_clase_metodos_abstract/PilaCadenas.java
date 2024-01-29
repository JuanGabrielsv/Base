/* COMO FUNCIONA CLASES Y MÉTODOS ABSTRACT */
package ejemplo_clase_metodos_abstract;

public class PilaCadenas extends Estructura {

	public PilaCadenas() {
		super();
	}

	@Override
	public String sacarCadena() {
		
		if (datos.isEmpty()) {
			return null;
		}
		String cadena = datos.get(datos.size() - 1);
		datos.remove(datos.size() - 1);
		return cadena;
	}

}
