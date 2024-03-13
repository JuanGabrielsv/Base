/* EJERCICIO 53
Crea una clase Hucha que nos permita gestionar nuestros ahorros. Tendrá que registrar
únicamente el importe que tenemos actualmente ahorrado. Usa la clase BigDecimal.
Cuando se crea una hucha nueva estará inicialmente vacía, como es lógico.
El importe que tenemos en la hucha siempre estará redondeado a 2 decimales.
Tendremos los siguientes métodos:

	• meterDinero() que recibe un BigDecimal con el importe a introducir y nos devuelve
	  otro BigDecimal con el importe que quedará en la Hucha
	• sacarDinero() que recibe un BidDecimal con el importe a sacar y nos devuelve otro
	  BigDecimal con el importe finalmente sacado. Si se intenta sacar más dinero del que
	  hay, sólo se sacará lo que haya.
	• contarDinero() que nos devuelve un BigDecimal con el importe que tenemos en la
      Hucha.
	• romperHucha() saca todo el dinero de la Hucha y nos devuelve un BigDecimal con todo
	  lo sacado.
	• toString() que imprime el importe que hay en la Hucha con separadores decimales y de
      miles, siempre con dos decimales rellenos y al menos un dígito entero, y el símbolo del
      euro. Ejemplos: “0,35 €”, “123,40€”, “1.123,00 €”

Cuando tengas la clase, crea un programa que haga lo siguiente (después de cada paso,
imprime siempre la hucha):

	1. Crea una hucha. Debe imprimir 0,00 €
	2. Mete 100 euros. Debe imprimir 100,00 €
	3. Mete 50,501 euros. Debe imprimir 150,50 €
	4. Saca 20,5 euros. Debe imprimir 130,00 €
	5. Intenta sacar 200 €. Debe imprimir 0,00 €
	6. Vuelve a meter en la hucha el importe que habías sacado. Debe imprimir 130,00 €
	7. Llama a contarDinero(). Lo que devuelva, mételo en la hucha. Debe imprimir 260,00 €
	8. Llama a romperHucha(). Lo que devuelva, mételo en la hucha de nuevo. Debe imprimir
	   260,00 € */

package ejercicios_básicos_ejercicio_53;

public class Main {

	public static void main(String[] args) {
		

	}

}
