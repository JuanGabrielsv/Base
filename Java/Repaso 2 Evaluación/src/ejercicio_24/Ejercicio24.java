package ejercicio_24;

import java.util.Scanner;

public class Ejercicio24 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);

		System.out.println("Dime el dni");
		String dni = sc.nextLine();
		Alumno alumno = new Alumno(dni);
		// System.out.println("Edad: " + alumno.getEdad());

		System.out.println("Dime el nombre");
		String nombre = sc.nextLine();
		alumno.setNombre(nombre);
		System.out.println("Dime la edad");
		alumno.setEdad(Integer.parseInt(sc.nextLine()));
		System.out.println("Dime la nota");
		alumno.setNota(Double.parseDouble(sc.nextLine()));

		alumno.setCurso(new Curso());

		System.out.println("Dime la descripción del curso: ");
		String descripcion = sc.nextLine();
		alumno.getCurso().setDescripcion(descripcion);

		System.out.println("Dime el id del curso: ");
		alumno.getCurso().setIdentificador(Long.parseLong(sc.nextLine()));

		Profesor profesor1 = new Profesor();
		System.out.print("NOMBRE DEL PROFESOR: ");
		profesor1.setNombre(sc.nextLine());
		System.out.println("EDAD DEL PROFESOR: ");
		profesor1.setEdad(Integer.parseInt(sc.nextLine()));

		sc.close();

		/*System.out.println("DNI: " + alumno.getDni());
		System.out.println("NOMBRE: " + alumno.getNombre());
		System.out.println("EDAD: " + alumno.getEdad());
		System.out.println("NOTA: " + alumno.getNota());
		System.out.println(" - Datos del curso del Alumno - ");
		System.out.println("IDENTIFICARDO DEL CURSO: " + alumno.getCurso().getIdentificador());
		System.out.println("DESCRIPCIÓN DEL CURSO: " + alumno.getCurso().getDescripcion());
		System.out.println("NOMBRE DEL PROFESOR: " + profesor1.getNombre());
		System.out.println("EDAD DEL PROFESOR: " + profesor1.getEdad());*/
		
		System.out.println(alumno);
		System.out.println(profesor1);

		alumno.aprobar();

		System.out.println("Nueva NOTA: " + alumno.getNota());

	}

}
