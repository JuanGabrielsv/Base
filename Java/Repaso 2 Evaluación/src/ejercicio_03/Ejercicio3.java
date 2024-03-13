package ejercicio_03;

public class Ejercicio3 {

	public static void main(String[] args) {
		
		System.out.println(getMayMin(1, " hola "));
		System.out.println(getMayMin(2, " HOLA "));
		System.out.println(getMayMin(3, " que PASA"));
	}
	
	public static String getMayMin(Integer num, String cadena) {
		
		String sinEspacio;
		String texto = num + " no es opcion";
		sinEspacio = cadena.trim();
		
		if (num == 1) {
			String mayusculas;
			mayusculas = sinEspacio.toUpperCase();
			return mayusculas;				
		}
		else if (num == 2) {
			String minusculas;
			minusculas = sinEspacio.toLowerCase();
			return minusculas;			
		}		
		return texto;
	}

}
