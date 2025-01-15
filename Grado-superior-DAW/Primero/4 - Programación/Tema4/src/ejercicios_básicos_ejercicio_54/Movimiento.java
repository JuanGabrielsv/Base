/*
EJERCICIO 54
(Utiliza LocalDate, List y BigDecimal donde corresponda)
Crea una clase CuentaAhorros. Esta cuenta bancaria tendrá un número de 20 dígitos que podrá
empezar por cero y una lista de movimientos bancarios.
Todos los movimientos tendrán registrada su fecha. Los movimientos podrán ser de 3 tipos:

• Cargo (llevan un importe y un CIF de la empresa que hace el cargo). Los cargos se imprimen así:
  [C - Fecha - Importe - CIF]. Por ejemplo: [C - 18/02/2022 - 33,21 € - 98765432F]
  
• Ingresos (llevan un importe y una descripción). Los ingresos se imprimen así:
  [I - Fecha - Importe - descripción]. Por ejemplo: [I - 18/02/2022 - 3,21 € - Ejemplo]
  
• Retiradas (llevan un importe). Las retiradas se imprimen así:
  [R - Fecha - Importe]. Por ejemplo: [R - 18/02/2022 - 12,00 €]
  
Una vez registrado un movimiento, este no se podrá borrar ni modificar.

Necesitamos estos métodos:

• Constructor de la clase CuentaAhorros que reciba el número de cuenta
• Método para añadir un movimiento a la cuenta
• Método para obtener el total de dinero en la cuenta
• Método para obtener una lista de cadenas que muestre todos los movimientos de la cuenta.
• Método igual que el anterior pero que sólo devuelva las retiradas
• Método igual que el anterior pero que sólo devuelva los ingresos
• Método igual que el anterior pero que sólo devuelva los cargos

Crea un programa que haga lo siguiente:

1. Crea una cuenta corriente e imprime el dinero que tenemos
2. Añade 2 cargos, 2 ingresos y 1 retirada
3. Imprime el dinero que tenemos
4. Imprime todos los movimientos
5. Imprime los cargos
6. Imprime los ingresos
7. Imprime las retiradas 
*/
package ejercicios_básicos_ejercicio_54;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public abstract class Movimiento {

	public static final String TIPO_INGRESO = "I";
	public static final String TIPO_CARGO = "C";
	public static final String TIPO_RETIRADA = "R";

	private LocalDate fecha;
	private BigDecimal importe;

	// GETTERS Y SETTERS

	public LocalDate getFecha() {
		return fecha;
	}

	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}

	public BigDecimal getImporte() {
		return importe;
	}

	public void setImporte(BigDecimal importe) {
		this.importe = importe;
	}

	// MÉTODOS

	public abstract String getTipo();

	@Override
	public String toString() {
		DecimalFormat formatoImporte = new DecimalFormat("#,###.##");
		DateTimeFormatter formatoFecha = DateTimeFormatter.ofPattern("dd/MM/yyyy");

		return getTipo() + " - " + formatoFecha.format(fecha) + " - " + formatoImporte.format(importe);
	}

}
