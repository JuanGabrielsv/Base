/* EJERCICIO 5
Crea un método llamado sumar que reciba dos números enteros y devuelva el resultado de la
suma. Pruébalo desde el método main con algún test. */
package ejercicio5;

public class Main {

	public static void main(String[] args) {

		System.out.println(sumar(4, 3));

	}

	public static Integer sumar(Integer num1, Integer num2) {
		Integer suma = num1 + num2;
		return suma;
	}

}
