package ejercicio_refactorizacion;

public class CalcularTramo {
	
	public static String calcularTramo(Integer entradaUsuario, String tramo) {
		if (entradaUsuario <= 0) {
			System.out.println("La cuantia no puede ser menor que 0");
		} else if (entradaUsuario < 21000 ) {
			tramo = "Tramo 0";
		} else if (entradaUsuario > 21000 && entradaUsuario < 29000) {
			tramo = "Tramo 1";
		} else if (entradaUsuario >= 29000 && entradaUsuario < 35000) {
			tramo = "Tramo 2";
		} else if (entradaUsuario >= 35000 && entradaUsuario < 55000) {
			tramo = "Tramo 3";
		} else if (entradaUsuario >= 55000 && entradaUsuario < 100000) {
			tramo = "Tramo 4";
		} else if (entradaUsuario >= 100000) {
			tramo = "Tramo 5";
		}
		return tramo;
	}

}
