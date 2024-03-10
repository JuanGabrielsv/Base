package examen;

import java.util.ArrayList;
import java.util.List;

public class Taller {
	
	String concesionario;
	List<EntradaCoche> entradas; 
	
	public Taller(String concesionario) {
		this.concesionario = concesionario;
		this.entradas = new ArrayList<>();		
	}
	
	public String getConcesionario() {
		return concesionario;
	}
	

}
