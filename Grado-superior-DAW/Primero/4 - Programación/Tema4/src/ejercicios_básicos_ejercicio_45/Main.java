/* EJERCICIO 45
Crea un programa que solicite al usuario su fecha de nacimiento. A continuación, usando la
clase LocalDate, muéstrale la siguiente información:

1. Si la fecha no es correcta, vuelve a solicitarla hasta que lo sea.
2. Dile si nació o no en un año bisiesto.
3. Dile el día de la semana en el que nació.
4. Dile cuántos años tiene.
5. Dile, suponiendo que va a vivir exactamente 100 años, cuánto tiempo de vida le queda (días, meses y años)
6. Dile, ya de regalo, que hora es ahora en formato hora/minuto/segundo con 24 horas. Por ejemplo: 17:23:55  */

package ejercicios_básicos_ejercicio_45;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Boolean check = true;
		LocalDate hoy = LocalDate.now();
		LocalDate nacimiento;

		do {

			System.out.println("Introduce tu fecha de nacimiento EJ: dd/MM/yyyy: ");
			String fecha = sc.nextLine();

			Integer dia = Integer.parseInt(fecha.split("/")[0]);
			Integer mes = Integer.parseInt(fecha.split("/")[1]);
			Integer anyo = Integer.parseInt(fecha.split("/")[2]);

			nacimiento = LocalDate.of(anyo, mes, dia);

			if (dia >= 1 && dia <= 31 && mes >= 1 && mes <= 12 && anyo <= hoy.getYear()) {
				check = false;
			} else {
				System.out.println("Fecha correcta?");

				check = true;
			}

		} while (check);

		System.out.println("¿Naciste en un año bisiesto? " + nacimiento.isLeapYear());

		System.out.println("Naciste un " + nacimiento.getDayOfWeek());

		Period periodo = nacimiento.until(hoy);
		System.out.println("Tienes " + periodo.getYears() + " años");

		LocalDate muerte = nacimiento.plusYears(100);
		periodo = hoy.until(muerte);
		System.out.println("Te quedan: " + periodo.getYears() + " años " + periodo.getMonths() + " meses "
				+ periodo.getDays() + " días ");

		LocalTime hora = LocalTime.now();
		DateTimeFormatter formato = DateTimeFormatter.ofPattern("HH:mm:ss");
		System.out.println("Hora actual: " + formato.format(hora));

		sc.close();

	}

}
