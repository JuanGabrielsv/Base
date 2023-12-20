/* EJERCICIO 5
Crea un método llamado sumar que reciba dos números enteros y devuelva el resultado de la suma. Pruébalo
desde el método main con algún test. */

package t4_ejercicios_basicos_I;

public class Ejercicio5 {

//MÉTODO
	
	public static Integer sumar(Integer num1, Integer num2) {
		return num1 + num2;
	}

//FIN MÉTODO
	
	public static void main(String[] args) {
		System.out.println(sumar(3, 4));
		System.out.println(sumar(3, 0));
	}

}
