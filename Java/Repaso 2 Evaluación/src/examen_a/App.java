package examen_a;

import java.time.LocalDate;
import java.util.Scanner;

public class App {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		String entradaUsuario;
		Boolean check = true;
		
		do {
			
			System.out.println("DIME EL NOMBRE DEL ESPECIALISTA: ");
			entradaUsuario = sc.nextLine().trim().toUpperCase();			
			
			if (entradaUsuario.length() > 10) {
				check = false;
			}
			
			
		} while (check);
		
		Agenda agenda1 = new Agenda(entradaUsuario);
		LocalDate fecha1 = LocalDate.of(2024, 5, 10);
		LocalDate fecha2 = LocalDate.of(2024, 10, 18);
		Normal citaNormal = new Normal(fecha1, 16, "Blas de los Montes", false);
		Revision citaRevision1 = new Revision(fecha2, 17, "Laura Aguilar", true);
		
		citaRevision1.setNumeroRevision(3);
		
		agenda1.addCita(citaNormal);
		agenda1.addCita(citaRevision1);
		
		System.out.println(agenda1.getImportePendienteFacturar());
		
		sc.close();

	}

}
