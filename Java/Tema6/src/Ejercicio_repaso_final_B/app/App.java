package Ejercicio_repaso_final_B.app;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import Ejercicio_repaso_final_B.modelo.Libreria;
import Ejercicio_repaso_final_B.modelo.Libro;
import Ejercicio_repaso_final_B.modelo.LibroNuevo;
import Ejercicio_repaso_final_B.modelo.LibroSegundaMano;

public class App {

	public static void main(String[] args) {
		
		Libreria libreria = new Libreria();
		Map<String, Libro> mLibros = new HashMap<String, Libro>();
		libreria.setNombre("Página desiertas");
		
		libreria.setmLibros(mLibros);
		
		Libro libro1 = new LibroNuevo();
		libro1.setIsbn("00");
		libro1.setAutor("Manolo Escobar");
		libro1.setPrecio(new BigDecimal(100));
		libro1.setTitulo("Poseidón");
		
		Libro libro2 = new LibroNuevo();
		libro2.setIsbn("01");
		libro2.setAutor("J.J Benitez");
		libro2.setPrecio(new BigDecimal(100));
		libro2.setTitulo("Caballo de Troya");
		
		Libro libro3 = new LibroNuevo();
		libro3.setIsbn("02");
		libro3.setAutor("Cervantes");
		libro3.setPrecio(new BigDecimal(100));
		libro3.setTitulo("La gitanilla");
		
		Libro libro4 = new LibroSegundaMano();
		libro4.setIsbn("03");
		libro4.setAutor("Lorca");
		libro4.setPrecio(new BigDecimal(9));
		libro4.setTitulo("Poeta en Nueva York");
		
		
		
		mLibros.put("00", libro1);
		mLibros.put("01", libro2);
		mLibros.put("02", libro3);
		mLibros.put("03", libro4);
		
		System.out.println(libreria.getTasacionCompleta());
		System.out.println(libreria.getPrecioMedio());
		System.out.println(libreria.getLibrosBaratos());
		System.out.println(libreria.recorrerPrecio());
		
		
		

	}

}
