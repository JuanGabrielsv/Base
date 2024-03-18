package ejercicio_de_clase_maps;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class App {

	public static void main(String[] args) {
		
		Map<Integer, String> jugadores = new HashMap<>();
		
		jugadores.put(1, "Casillas");
		jugadores.put(3, "Piqué");
		jugadores.put(7, "Villa");
		jugadores.put(11, "Capdevilla");
		jugadores.put(16, "Busquets");
		jugadores.put(18, "Pedrito");
		jugadores.put(15, "Ramos");
		jugadores.put(5, "Puyol");
		jugadores.put(14, "Xabi Alonso");
		jugadores.put(6, "Iniesta");
		
		Set<Integer> keys = jugadores.keySet();
		for (Integer key : keys) {
			System.out.println("Clave: " + key + " --> valor: " + jugadores.get(key));			
		}
		
		

	}

}
