package principal;

public class Ejercicio05 {
	

	public static void main(String[] args) {
		
				
		int resultadoSuma = 0; // acumulará las sumas parciales
		int contador = 1;
		while(contador <= 10000) {	 // Iteramos 10.000 veces	
			resultadoSuma += contador; // resultadoSuma = resultadoSuma + contador;
			contador++; // contador = contador + 1;
		}
						
		System.out.println("La suma de todos los números desde el 1 al 10000 es: " + resultadoSuma);
		
		
	}		

}
