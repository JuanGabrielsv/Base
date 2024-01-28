/*
EJERCICIO 33
Construye una nueva clase Semaforo que debe funcionar del siguiente modo:

1) Tendrá dos atributos:
a. color, de tipo String. Podrá ser Rojo, Ámbar o Verde. Lo correcto es que
declares estos valores como constantes.
b. parpadeando, de tipo Boolean.

2) Sólo tendrá el constructor por defecto, que tendrá que inicializar el color en Rojo sin
parpadear.

3) Crea los métodos get y set

4) En los métodos set, debes validar lo siguiente:
a. Cuando se intente cambiar el color, si se indica un color no válido, entonces no
se modificará el atributo.
b. Cuando se intente cambiar el estado de parpadeo, si se intenta activar el
parpadeo cuando el color es distinto a Ámbar, entonces no se modificará.

5) Sobrescribe el método toString() para que devuelva lo siguiente en función del valor de
los atributos:
a. Semáforo en ROJO
b. Semáforo en VERDE
c. Semáforo en ÁMBAR
d. Semáforo en ÁMBAR parpadeando

6) Añade un método cambiarEstado() que modifique el valor de los atributos del
semáforo siguiendo este ciclo de estados:
VERDE -> ÁMBAR (parpadeando) -> ÁMBAR (sin parpadear) -> ROJO -> VERDE y así 
*/
package ejercicios_básicos_ejercicio33;

public class App {

	public static void main(String[] args) {
		
		Semaforo semaforo = new Semaforo();
		System.out.println(semaforo);
		
		semaforo.setColor("azul");
		System.out.println(semaforo);
		
		semaforo.setColor(Semaforo.VERDE);
		System.out.println(semaforo);
		
		semaforo.setParpadeando(true);
		System.out.println(semaforo);
		
		semaforo.setColor(Semaforo.AMBAR);
		System.out.println(semaforo);
		
		semaforo.setParpadeando(true);
		System.out.println(semaforo);
		
		for (int i = 0; i < 5; i++) {
			semaforo.cambiarEstado();
		}
		
		System.out.println(semaforo);
		
		Semaforo copia = new Semaforo();
		copia.setColor(semaforo.getColor());
		copia.setParpadeando(semaforo.getParpadeando());
		System.out.println(copia);
		
		
		

	}

}
