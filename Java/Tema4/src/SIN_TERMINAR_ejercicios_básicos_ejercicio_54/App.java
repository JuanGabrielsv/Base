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
package SIN_TERMINAR_ejercicios_básicos_ejercicio_54;

import java.math.BigDecimal;
import java.time.LocalDate;

public class App {

	public static void main(String[] args) {
		
		/* 1. Crea una cuenta corriente e imprime el dinero que tenemos */
		
		CuentaAhorros cuenta1 = new CuentaAhorros("01234");
		System.out.println("PASO 1: " + cuenta1.getTotal());
		
		/* 2. Añade 2 cargos, 2 ingresos y 1 retirada */
		
		MovimientoCargo cargo1 = new MovimientoCargo();
		cargo1.setFecha(LocalDate.of(2024, 03, 22));
		cargo1.setCif("53279139F");
		cargo1.setImporte(new BigDecimal(135));
		MovimientoCargo cargo2 = new MovimientoCargo();
		cargo2.setFecha(LocalDate.of(2024, 02, 18));
		cargo2.setCif("27283529D");
		cargo2.setImporte(new BigDecimal(75));
		
		MovimientoIngreso ingreso1 = new MovimientoIngreso();
		ingreso1.setFecha(LocalDate.of(2024, 01, 12));
		ingreso1.setImporte(new BigDecimal(1234.73));
		ingreso1.setDescripcion("Ingreso de la nómina de enero");
		MovimientoIngreso ingreso2 = new MovimientoIngreso();
		ingreso2.setFecha(LocalDate.of(2024, 02, 8));
		ingreso2.setImporte(new BigDecimal(110.17));
		ingreso2.setDescripcion("Devolución de la renta");
		
		MovimientoRetirada retirada1 = new MovimientoRetirada();
		retirada1.setFecha(LocalDate.of(2024, 04, 2));
		retirada1.setImporte(new BigDecimal(55.63));
		
		cuenta1.addMovimiento(retirada1);
		cuenta1.addMovimiento(ingreso1);
		cuenta1.addMovimiento(ingreso2);
		cuenta1.addMovimiento(cargo1);
		cuenta1.addMovimiento(cargo2);
		System.out.println("PASO 2: Añadidos 2 cargos, 2 ingresos y 1 retirada.");
		
		/* 3. Imprime el dinero que tenemos */
		
		System.out.println("PASO 3: " + cuenta1.getTotal());
		
		/* 4. Imprime todos los movimientos */
		
		
	}

}
