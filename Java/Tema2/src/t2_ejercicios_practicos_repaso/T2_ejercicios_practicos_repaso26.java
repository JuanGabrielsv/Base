/*
EJERCICIO 25
Realizar un programa que juegue a Piedra/Papel/Tijera con el usuario. El programa funcionará
del siguiente modo:

1. Mostrará un mensaje indicando: “Piedra, papel, tijera… un, dos, tres… ya!!”
2. A continuación, se quedará esperando a que el usuario indique una de las tres
opciones. Estas opciones se indicarán con la palabra completa, pero podrán ser
escritas en mayúscula o minúsculas, nos da igual.
3. Luego, el programa generará aleatoriamente su mano (una de las tres), y se la
mostrará al usuario.
4. Por último, indicará quién ha ganado y terminará.

EJERCICIO 26
Mejorar el ejercicio anterior para que al terminar el juego pregunte al usuario si desea echar
otra partida. En caso afirmativo, repetir todo el proceso. En caso negativo, mostrar el
marcador final de victorias y terminar.*/ 

/* NOTAS PARA TI, BELÉN:
 * 
 * He usado varias fuentes y busquedas por internet, he usado los apuntes dados en clase y he recibido ayuda de un amigo que se dedica profesionalmente a programar.
 * Este último y a destacar fue muy instructivo, la forma en que hizo que entendiera la lógica a la hora de plantear el problema y por supuesto dejándome a mí enfrentarme
 * a la solución.
 * A destacar que, tuve que usar el debugger, ya que puse mal un texto y en algunas jugadas daba la partida como perdida cuando había ganado, 
 * cosa que me alegró poder solucionarlo con lo aprendido en entornos de desarrollo.
 * - Un DO while dentro de un do while... aprendido!
 * Conclusión: un ejercicio que ha sido bastante instructivo, me ha hecho ver otra forma de planteamiento y usado por ejemplo el incrementar variables de las
 * partidas ganadas, perdidas y empatadas.
 * Ya por último, probando el juego vi que en la primera ronda funcionaba bien, pero en la segunda cuando te volvía a repetir que introdujeras tu opción, si la escribias
 * mal, te decía que la volvieras a escribir pero te daba el resultado como si siguiera la partida normal. Descubrí que la variable boolean en la primera pasada si lo haces
 * bien se quedaba true pero al entrar en el else la segunda vez seguía true por lo que tiraba para adelante. Lo solucioné poniendo 'jugadaValida = false;' dentro del else
 * que era lo que me faltaba y ahora cuando escribes mal, se obliga a la variable a ser false y de este modo que no continue.
 */


package t2_ejercicios_practicos_repaso;
import java.util.Scanner;
import java.util.Random;

public class T2_ejercicios_practicos_repaso26 {
	
//DECLARAMOS LAS CONSTANTES QUE NO VAN A CAMBIAR, COMPARAREMOS NÚMEROS PARA SABER EL RESULTADO.
	
	public static final Integer PIEDRA = 1;
	public static final Integer PAPEL = 2;
	public static final Integer TIJERAS = 3;
	
	public static void main(String[]args) {
		
//DECLARAMOS LAS VARIABLES, NO LO HE HECHO DESDE EL PRINCIPIO, SI NO CUANDO HE VISTO QUE TENÍA QUE USARLAS.
		
		Scanner sc = new Scanner (System.in);
		Random random = new Random();
		Integer ganadas = 0;
		Integer perdidas = 0;
		Integer empate = 0;	
		boolean jugadaValida = false;
		Integer jugadaUsuario = 0;
		String sino = "";		
		
		do {
			do {
				
				System.out.println("Piedra, papel, tijera… un, dos, tres… ya!!");
				System.out.println("Escribe tu opción: ");
				String entradausuario = sc.nextLine();				
				
				if (entradausuario .equalsIgnoreCase("Piedra")) {				
					jugadaValida = true;
					jugadaUsuario = PIEDRA;
					System.out.println("Has elegido Piedra");
				} 
				else if (entradausuario .equalsIgnoreCase("papel")) {
					jugadaValida = true;
					jugadaUsuario = PAPEL;
					System.out.println("Has elegido Papel");
				}
				else if (entradausuario .equalsIgnoreCase("tijera")) {
					jugadaValida = true;
					jugadaUsuario = TIJERAS;
					System.out.println("Has elegido Tijeras");
				}
				else { System.out.println("Elección incorrecta, vuelve a escribir tu jugada: ");
					jugadaValida = false;
				}				
			} while (jugadaValida == false);	
			
//GENERAR POSIBILIDAD RANDOM PARA LA MÁQUINA (3 POSIBLES UNA POR PIEDRA, PAPEL, TIJERA).
			
			Integer jugadaMaquina = random.nextInt(1,4);
			
//COMPARAR Y COMPROBAR QUIEN HA GANADO (RESULTADO DE LA PARTIDA 3 POSIBILIDADES) GUARDAR TAMBIÉN CONTADOR DE PARTIDA.	
			
			if (jugadaMaquina == PIEDRA) {
				System.out.println("La Máquina saca: Piedra");
				
				if (jugadaUsuario == PIEDRA) {
					System.out.println("Empate");
					empate++;
				}
				else if (jugadaUsuario == TIJERAS) {
					System.out.println("Has perdido");
					perdidas++;					
				}
				else {
					System.out.println("Has Ganado");
					ganadas++;
				}
			} else if (jugadaMaquina == TIJERAS) {
				System.out.println("La Máquina saca: Tijeras");
				
				if (jugadaUsuario == PIEDRA) {
					System.out.println("Has Ganado");
					ganadas++;
				}
				else if (jugadaUsuario == TIJERAS) {
					System.out.println("Empate");
					empate++;					
				}
				else {
					System.out.println("Has perdido");
					perdidas++;
				}
			}
			else {
				System.out.println("La Máquina saca: Papel");
				
				if (jugadaUsuario == PIEDRA) {				
					System.out.println("Has perdido");
					perdidas++;
				}
				else if (jugadaUsuario == TIJERAS) {
					System.out.println("Has Ganado");
					ganadas++;					
				}
				else {
					System.out.println("Empate");
					empate++;
				}
			}
			
//PREGUNTAR SI VOLVER A JUGAR
			
			System.out.println("¿Deseas jugar otra partida? Escribe 'Si' o 'No': ");
			sino = sc.nextLine();
		}
		
		while (sino .equalsIgnoreCase("Si"));
		
//SI ESCRIBIMOS CUALQUIER COSA QUE NO SEA Si o si, LA PARTIDA TERMINA MOSTRANDO EL RESULTADO.
		
		System.out.println("Ganadas:  " + ganadas + " Perdidas: " + perdidas + " Empates: " + empate);
		sc.close();
		
	}
}
