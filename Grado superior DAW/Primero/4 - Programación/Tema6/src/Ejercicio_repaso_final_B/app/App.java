package Ejercicio_repaso_final_B.app;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Scanner;
import java.util.Set;
import Ejercicio_repaso_final_B.Servicios.LibreriaService;
import Ejercicio_repaso_final_B.Servicios.LibroException;
import Ejercicio_repaso_final_B.modelo.Libreria;
import Ejercicio_repaso_final_B.modelo.Libro;
import Ejercicio_repaso_final_B.modelo.LibroNuevo;

public class App {

	public static void main(String[] args) throws Exception {

		LibreriaService servicio = new LibreriaService();
		
		System.out.println(servicio.consultarLibro());
		System.out.println(servicio.consultaPorIsbn("02"));
		System.out.println(servicio.borrarFila());
		servicio.borrarFilaPorIsbn("07");

		Libreria libreria = solicitarLibreria();

		try {
			Set<Entry<String, Libro>> pares = libreria.getmLibros().entrySet();
			for (Entry<String, Libro> entry : pares) {
				if (entry.getValue().getPrecio().compareTo(new BigDecimal(10)) == -1) {
					servicio.insertarLibro(entry.getValue());
				}
			}
		} catch (LibroException e) {
			e.printStackTrace();
			System.out.println(e.getMessage() + e.getCause() + e.getClass() + e.getStackTrace());

		} catch (Exception e) {
			
		} finally { 

		}

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
			e.printStackTrace();
			System.out.println(e.getMessage() + e.getCause() + e.getClass() + e.getStackTrace());
		} finally {
			sc.close();
		}

		libreria.setmLibros(mLibros);
		return libreria;

	}

}
