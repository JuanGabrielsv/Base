/* COMO FUNCIONA CLASES Y MÉTODOS ABSTRACT */
package ejemplo_clase_metodos_abstract;

public class ColaCadenas extends Estructura {

	public ColaCadenas() {
		super();
	}
	
	
	@Override
	public String sacarCadena() {
		if (datos.isEmpty()) {
			return null;
		}
		String cadena = datos.get(0);
		datos.remove(0);
		return cadena;
	}

}
