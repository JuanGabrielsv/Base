package ejercicios_básicos_ejercicio_59;

public class App {

	public static void main(String[] args) {
		
		Geografia geo1 = new Geografia();
		
		geo1.agregarPais("brasil", "rio de JAneiro");
		geo1.agregarPais("brasil", "paris");
		
		System.out.println(geo1);
		
		System.out.println(geo1.obtenerCapital("brasi"));

	}

}
