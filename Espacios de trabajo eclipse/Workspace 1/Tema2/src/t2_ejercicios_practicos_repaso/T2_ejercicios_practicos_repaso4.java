/* EJERCICIO 4
Realizar un programa en JAVA que calcule los descuentos a aplicar a una compra según los
siguientes criterios:
- Si la compra es superior a 100 unidades, aplicar un 40% de descuento.
- Si la compara está entre 25 y 100 unidades, 20% de descuento
- Si la compra está entre 10 y 24 unidades, realizar un 10% de descuento.
- Si la compra es inferior a 10 unidades, no se aplica descuento.
Se nos pedirá por teclado Precio y Unidades. Se obtendrá como resultado el Subtotal a pagar,
el Descuento aplicado y el Total a pagar.
Por ejemplo, si indicamos precio 100 y unidades 50, el resultado será:
- Subtotal = 100 x 50 = 5000 euros
- Descuento = 20% de 5000 = 1000 euros
- Total = 5000 – 1000 = 4000 euros
(Trabajaremos con cifras decimales) */
package t2_ejercicios_practicos_repaso;

import java.util.Scanner;

public class T2_ejercicios_practicos_repaso4 {
	
	public static final Scanner SC = new Scanner(System.in);
	public static final Double DESCUENTOGRANDE = 40.0;
	public static final Double DESCUENTOMEDIANO = 20.0;
	public static final Double DESCUENTOPEQUEÑO = 10.0;

	public static void main(String[] args) {
		
		Double entradaPrecio = 0.0;
		Double entradaUnidades = 0.0;
		Double calculoPrecio = 0.0;
		Double calculoDescuento = 0.0;
		Double calculoTotal = 0.0;
		
		System.out.println("Dame el precio");
		entradaPrecio = SC.nextDouble();
		
		System.out.println("Dame las unidades");
		entradaUnidades = SC.nextDouble();
		
		calculoPrecio = (entradaPrecio * entradaUnidades);
		
		if (entradaUnidades > 100) {			
			calculoDescuento = (calculoPrecio * DESCUENTOGRANDE) / 100;
			calculoTotal = (calculoPrecio - calculoDescuento);
			System.out.println("- Subtotal = " + entradaPrecio +  "€ x " + entradaUnidades + " = " + calculoPrecio + "€");
			System.out.println("- Descuento = " + DESCUENTOGRANDE + "% de " + calculoPrecio + "€ = " + calculoDescuento + "€");
			System.out.println("- Total = " + calculoPrecio + "€ - " + calculoDescuento + "€ = " + calculoTotal + "€");
		}
		else if (entradaUnidades >= 25 && entradaUnidades <= 100) {
			calculoDescuento = (calculoPrecio * DESCUENTOMEDIANO) / 100;
			calculoTotal = (calculoPrecio - calculoDescuento);
			System.out.println("- Subtotal = " + entradaPrecio +  "€ x " + entradaUnidades + " = " + calculoPrecio + "€");
			System.out.println("- Descuento = " + DESCUENTOMEDIANO + "% de " + calculoPrecio + "€ = " + calculoDescuento + "€");
			System.out.println("- Total = " + calculoPrecio + "€ - " + calculoDescuento + "€ = " + calculoTotal + "€");
		}
		else {
			calculoDescuento = (calculoPrecio * DESCUENTOPEQUEÑO) / 100;
			calculoTotal = (calculoPrecio - calculoDescuento);
			System.out.println("- Subtotal = " + entradaPrecio +  "€ x " + entradaUnidades + " = " + calculoPrecio + "€");
			System.out.println("- Descuento = " + DESCUENTOPEQUEÑO + "% de " + calculoPrecio + "€ = " + calculoDescuento + "€");
			System.out.println("- Total = " + calculoPrecio + "€ - " + calculoDescuento + "€ = " + calculoTotal + "€");			
		}
		
	}

}
