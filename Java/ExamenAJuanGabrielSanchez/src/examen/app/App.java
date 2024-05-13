package examen.app;

import java.time.LocalDate;
import java.time.Month;
import java.util.Scanner;

import examen.services.ProyectoErrorException;
import examen.services.ProyectoService;



public class App {

	public static void main(String[] args) {
		
		ProyectoService servicio = new ProyectoService();
		
		LocalDate fechaIni = LocalDate.of(2024, 02, 24);
		LocalDate fechaFin = LocalDate.of(2024, 8, 10);
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introduce la fecha inicio");
		//fechaIni = sc.next;
		System.out.println("Introduce la fecha fin");
		//fechaFin = sc.nextLine();
		
		//servicio.buscarProyectos(fechaIni, fechaFin);
		sc.close();
		
		try {
			servicio.buscarProyectos(fechaIni, fechaFin);
		} catch (ProyectoErrorException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		

	}

}
