package examen_3Trimestre_A.examen.app;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Scanner;
import examen_3Trimestre_A.examen.modelo.Empresa;
import examen_3Trimestre_A.examen.services.FechaFinalAnteriorInicialException;
import examen_3Trimestre_A.examen.services.ProyectoErrorException;
import examen_3Trimestre_A.examen.services.ProyectoNotFoundException;
import examen_3Trimestre_A.examen.services.ProyectoService;

public class App {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		ProyectoService servicio = new ProyectoService();
		DateTimeFormatter formatoFecha = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		Boolean check = true;

		do {

			try {

				check = true;

				System.out.println("Introduce fecha inicio (dd/MM/yyyy): ");
				LocalDate fecha1 = LocalDate.parse(sc.nextLine(), formatoFecha);
				System.out.println("Introduce fecha final fecha (dd/MM/yyyy): ");
				LocalDate fecha2 = LocalDate.parse(sc.nextLine(), formatoFecha);

				if (fecha2.isBefore(fecha1)) {
					throw new FechaFinalAnteriorInicialException();
				}

				System.out.println(fecha1);
				System.out.println(fecha2);

				Empresa empresa = new Empresa();
				empresa.setNombreComercialEmpresa("BlaSSoft");

				empresa.setListaProyectosEmpresa(servicio.buscarProyecto(fecha1, fecha2));
				System.out.println(empresa);

				check = false;

			} catch (DateTimeParseException e) {
				System.err.println("FORMATO DE FECHA INCORRECTO");
			} catch (FechaFinalAnteriorInicialException e) {
				System.err.println("La fecha final no puede ser antes de la inicial");
			} catch (ProyectoNotFoundException e) {
				System.err.println(e.getMessage() + "\nVuelva a introducir otras fechas");
			} catch (ProyectoErrorException e) {
				System.err.println(e.getMessage() + "\nNo se ha podido realiar la consulta");
				break;
			}

		} while (check);

		sc.close();
		System.out.println("fin del programa");

	}

}
