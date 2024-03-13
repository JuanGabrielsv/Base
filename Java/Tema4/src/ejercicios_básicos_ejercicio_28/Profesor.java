/* EJERCICIO 28
Buscando en internet, nos encontramos este trozo de código que asegura validar un DNI que
no sea null:

String ejemploDni = "00000000T";
Pattern patron = Pattern.compile("[0-9]{7,8}[A-Z a-z]");
Matcher match = patron.matcher(ejemploDni);
if(match.matches()) {
 System.out.println("El dni es correcto");
}
else {
 System.out.println("El dni es incorrecto");
}

Cambia tu método validarDNI() para que realice la segunda parte de la validación (b) utilizando
el código que hemos encontrado. Tendrás que adaptarlo, ya que nosotros no queremos
imprimir nada. El método tiene que seguir devolviendo un Boolean. 
*/
package ejercicios_básicos_ejercicio_28;

public class Profesor extends Persona {

	@Override
	public String toString() {
		return "Profesor [getNombre()=" + getNombre() + ", getEdad()=" + getEdad() + "]";
	}	

}
