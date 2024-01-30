package ejercicio3;

public class Main {

	public static void main(String[] args) {

		System.out.println(getMayMin(1, " que ase rayos laseee "));
		System.out.println(getMayMin(2, " QUE ASE RAYOS LASEEE "));

	}

	/*public static String getMayusculas(String cadena) {
		return cadena.trim().toUpperCase();
	}

	public static String getMinusculas(String cadena) {
		return cadena.trim().toLowerCase();
	}*/

	public static String getMayMin(Integer num, String cadena) {

		if (num == 1) {
			return ejercicio1.Main.getMayusculas(cadena);
		} else if (num == 2) {
			return ejercicio2.Main.getMinusculas(cadena);
		}
		return null;

	}
}
