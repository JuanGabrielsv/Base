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
		
		System.out.println("Números de elementos: " + jugadores.size());
		System.out.println("¿Está vacio?: " + jugadores.isEmpty());
		System.out.println("Valor de la clave 6 : " + jugadores.get(6));
		System.out.println("Borramos a Pedrito: " + jugadores.remove(18));		
		System.out.println("Obtenemos 18 : " + jugadores.get(18));
		System.out.println("¿Existe la key 18?: " + jugadores.containsKey(18));		
		System.out.println("¿Existe la key 1?: " + jugadores.containsKey(1));		
		jugadores.clear();		
		System.out.println(jugadores.size());
		System.out.println("¿Está vacio?: " + jugadores.isEmpty());
		

	}

}
