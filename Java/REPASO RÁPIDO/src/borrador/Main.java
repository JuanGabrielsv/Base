package borrador;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import oracle.jdbc.driver.parser.util.Array;

public class Main {

	public static void main(String[] args) {

		Set<Libro> conjunto = new HashSet<>();
		
		Libro x = new Libro("Frankestein");
		x.setEditorial("Planeta");
		x.setAnoEdicion(2000);
		conjunto.add(x);
		conjunto.add(new Libro("Frankestein"));
		for (Libro libro : conjunto) {
			libro.setTitulo("Drácula");
			x = libro;
		}
		
		System.out.println(x.getEditorial());
		System.out.println(conjunto.size());
	}
	
}









