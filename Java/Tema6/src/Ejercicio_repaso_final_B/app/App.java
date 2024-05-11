package Ejercicio_repaso_final_B.app;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import Ejercicio_repaso_final_B.modelo.Libreria;
import Ejercicio_repaso_final_B.modelo.Libro;
import Ejercicio_repaso_final_B.modelo.LibroNuevo;

public class App {

	public static void main(String[] args) {

		System.out.println(solicitarLibreria());
	}

	private static Libreria solicitarLibreria() {
		Scanner sc = new Scanner(System.in);
		Libreria libreria = new Libreria();
		Map<String, Libro> mLibros = new HashMap<String, Libro>();
		libreria.setNombre("Páginas desiertas");

		try {
			while (true) {

				System.out.println("Introduce los datos del libro con el siguiente formato: ISBN;TITULO;AUTOR;PRECIO");
				String datos = sc.nextLine();

				String[] aDatos = datos.split(";");

				Libro libro = new LibroNuevo();
				libro.setIsbn(aDatos[0]);
				libro.setTitulo(aDatos[1]);
				libro.setAutor(aDatos[2]);
				libro.setPrecio(new BigDecimal(aDatos[3]));
				mLibros.put(libro.getIsbn(), libro);

				System.out.println("¿Quieres para ya? Escribe (FIN) para Salir (N) Continuar");
				String salir = sc.nextLine().trim();
				if (salir.equalsIgnoreCase("fin")) {
					break;
				}

			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			sc.close();
		}
		libreria.setmLibros(mLibros);
		return libreria;

	}

}
