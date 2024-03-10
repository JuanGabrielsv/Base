package ejercicio_20;

import java.util.Scanner;

public class Ejercicio18 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		Alumno alumno = new Alumno();
		
		System.out.print("DNI: ");
		alumno.setDni(sc.nextLine());
		System.out.print("NOMBRE: ");
		alumno.setNombre(sc.nextLine());
		System.out.print("EDAD: ");
		alumno.setEdad(Integer.parseInt(sc.nextLine()));
		System.out.print("NOTA: ");
		alumno.setNota(Double.parseDouble(sc.nextLine()));
		sc.close();
		
		alumno.aprobar();
		
		System.out.println(alumno);		
		
	}

}
