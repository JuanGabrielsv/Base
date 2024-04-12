/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Ejercicio_entorno_refactorizacion.EJ1;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Main {

	public static void main(String[] args) {
		CCuenta cuenta1;
		double saldoActual;
		int opcion = 0;
		cuenta1 = new CCuenta("Juan López", "1000-2365-85-123456789", 2500, 0);

		Scanner sc = new Scanner(System.in);
		do {
			
				System.out.println("MENÚ DE OPERACIONES");
				System.out.println("-------------------");
				System.out.println("1 - Ingresar");
				System.out.println("2 - Retirar");
				System.out.println("3 - Finalizar");

				opcion = Integer.parseInt(sc.nextLine());
				if (opcion == 1) {
					System.out.println("¿Cuánto desea ingresar?: ");
					float ingresar = Integer.parseInt(sc.nextLine());
					try {
						System.out.println("Ingreso en cuenta");
						cuenta1.ingresar(ingresar);
					} catch (Exception e) {
						System.out.println("Fallo al ingresar");
					}
				} else if (opcion == 2) {
					System.out.println("¿Cuátno desea retirar?: ");
					float retirar = Integer.parseInt(sc.nextLine());
					try {
						cuenta1.retirar(retirar);
					} catch (Exception e) {
						System.out.println("Fallo al retirar");
					}
				} else if (opcion == 3) {
					System.out.println("Finalizamos la ejecución");
				} else {
					System.err.println("Opción errónea");
				}
				
		 
			
		} while (opcion != 3);
		saldoActual = cuenta1.estado();
		System.out.println("El saldo actual es" + saldoActual);
	}
	
}
