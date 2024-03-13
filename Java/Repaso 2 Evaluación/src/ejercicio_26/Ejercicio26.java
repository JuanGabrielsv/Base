package ejercicio_26;

import java.util.Scanner;

public class Ejercicio26 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);

		Alumno[] alumnos = new Alumno[3];

		Curso curso = new Curso();
		curso.setIdentificador(1L);
		curso.setDescripcion("DAM/DAW");

		for (int i = 0; i < alumnos.length; i++) {
			System.out.print("NOMBRE: ");
			Alumno alumno = new Alumno();
			alumno.setNombre(sc.nextLine());
			System.out.print("DNI: ");
			alumno.setDni(sc.nextLine());
			System.out.print("EDAD: ");
			alumno.setEdad(Integer.parseInt(sc.nextLine()));
			System.out.print("NOTA: ");
			alumno.setNota(Double.parseDouble(sc.nextLine()));
			alumno.setCurso(curso);
			alumnos[i] = alumno;
		}

		for (Alumno alumno : alumnos) {
			System.out.println(alumno);
		}

		if (alumnos[0].equals(alumnos[1]) || alumnos[0].equals(alumnos[2]) || alumnos[1].equals(alumnos[2])) {
			System.err.println("*** ERROR: Hay alumnos iguales ***");
		} else {
			System.out.println("No hay alumnos iguales");
		}

		sc.close();

	}
}
