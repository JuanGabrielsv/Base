package ejercicios_básicos_ejercicio_59;

public class App {

	public static void main(String[] args) {
		
		Geografia geo1 = new Geografia();
		
		geo1.agregarPais("brasil", "rio de JAneiro");
		geo1.agregarPais("brasil", "paris");
		geo1.agregarPais("españa", "madrid");
		geo1.agregarPais("federicogarcialorca", "barcelona");
		
		System.out.println(geo1);
		
		System.out.println(geo1.obtenerCapital("brasi"));
		
		System.out.println(geo1.imprimirPaises());
		
		//geo1.eliminarPais("esPaña");
		
		System.out.println(geo1.imprimirPaises());
		System.out.println(geo1.getPaises().size());
		System.out.println(geo1.calcularLongitudMediaPaises());

	}

}
