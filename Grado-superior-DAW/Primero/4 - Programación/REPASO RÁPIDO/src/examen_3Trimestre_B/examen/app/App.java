package examen_3Trimestre_B.examen.app;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Scanner;

import examen_3Trimestre_B.examen.modelo.Productora;
import examen_3Trimestre_B.examen.services.PeliculaErrorException;
import examen_3Trimestre_B.examen.services.PeliculaNotFoundException;
import examen_3Trimestre_B.examen.services.PeliculasServices;

public class App {

	public static void main(String[] args) {
		PeliculasServices servicio = new PeliculasServices();
		DateTimeFormatter formatoFecha = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		Scanner sc = new Scanner(System.in);
		Boolean check = true;
		Boolean check2 = true;
		do {
			try {
				do {
					check2 = true;
					System.out.println("INTRODUCE LA FECHA INICIAL (dd/MM/yyyy): ");
					LocalDate fecha1 = LocalDate.parse(sc.nextLine(), formatoFecha);
					System.out.println("INTRODUCE LA FECHA FINAL (dd/MM/yyyy): ");
					LocalDate fecha2 = LocalDate.parse(sc.nextLine(), formatoFecha);
					if (fecha1.isBefore(fecha2)) {						
						Productora productora = new Productora();
						productora.setNombreProductora("Univerblas Picture");
						productora.setListaPeliculaProductora(servicio.consultarPeliculas(fecha1, fecha2));
						System.out.println(productora);
						break;
					} else {
						System.err.println("LA FECHA INICIAL NO PUEDE SER DE DESPUÉS DE LA FINAL");
					}
				} while (check2);

				check = false;
			} catch (DateTimeParseException e) {
				System.err.println("HAS INTRODUCIDO MAL ALGUNA FECHA, FÍJATE EN EL PATRÓN");
			} catch (PeliculaNotFoundException e) {
				System.out.println(e.getMessage());
			} catch (PeliculaErrorException e) {
				System.out.println(e.getMessage());
			}
		} while (check);
		sc.close();
	}

}
