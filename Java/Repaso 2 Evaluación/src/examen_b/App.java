package examen_b;

import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.Scanner;

public class App {

	public static void main(String[] args) {
		
		Boolean check = true;
		Scanner sc = new Scanner(System.in);
		String entradaUsuario;
		
		do {
			
			System.out.println("INTRODUCE LA MATRICULA: ");
			entradaUsuario = sc.nextLine();
			
			if (entradaUsuario.startsWith("9") && entradaUsuario.length() == 7) {
				check = false;
			}
			
		} while (check);
		
		Taller miTaller = new Taller("CEU Motor");
		LocalDate fecha1 = LocalDate.of(2024, 5, 10);
		LocalDate fecha2 = LocalDate.of(2024, 10, 18);
		Reparacion entradaDeCoche1 = new Reparacion(fecha1, entradaUsuario, false);
		Revision entradaDeCoche2 = new Revision(fecha2, "1234ABC", true);
		entradaDeCoche2.setKilometros(10000);
		
		miTaller.addEntradaCoche(entradaDeCoche1);
		miTaller.addEntradaCoche(entradaDeCoche2);
		
		entradaDeCoche1.setTiempoEstimado(10);
		entradaDeCoche2.setTiempoEstimado(10);
		
		entradaDeCoche1.setTerminado(true);
		entradaDeCoche2.setTerminado(true);
		
		DecimalFormat formato = new DecimalFormat("#,###.00 €");
		System.out.println(formato.format(miTaller.getImporteParaCobrar()));
		
		System.out.println(entradaDeCoche1);
		
	}

}
