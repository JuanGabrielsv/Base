package ejercicio_20;

import java.util.Scanner;

public class Ejercicio20 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		Alumno alumno1 = new Alumno();
		Alumno alumno2 = new Alumno("53279139G");
		
		System.out.print("DNI: ");
		alumno1.setDni(sc.nextLine());
		System.out.print("NOMBRE: ");
		alumno1.setNombre(sc.nextLine());
		System.out.print("EDAD: ");
		alumno1.setEdad(Integer.parseInt(sc.nextLine()));
		System.out.print("NOTA: ");
		alumno1.setNota(Double.parseDouble(sc.nextLine()));
		sc.close();
		
		alumno1.aprobar();
		
		System.out.println(alumno1);
		System.out.println(alumno2);
		
	}

}
