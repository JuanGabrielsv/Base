package repasorepaso;

public class App {

	public static void main(String[] args) {
		
		String mensaje = "Hola ¿Cómo estás?";
		//Boolean haceSol = true;
		//Integer dias = 7;
		Caballo caballo1 = new Caballo(); 
				
		System.out.println(mensaje);
		
/* ESTO FALLA PORQUE LOS ATRIBUTOS DE LA CLASE CABALLO ESTÁN EN PRIVADO
		
		System.out.println(caballo1.color);		
		caballo1.color = "marrón";
		System.out.println(caballo1.color);
		*/
		
		caballo1.imprimirCarrerasGanadas();
		
		System.out.println("El año de nacimiento del caballo es: " + caballo1.anoNacimiento());
		
		caballo1.incrementarCarrerasGanadas();
		caballo1.imprimirCarrerasGanadas();
		caballo1.relincha();
		
		caballo1.setNombre("bolita");
		System.out.println("NOMBRE DEL CABALLO" + caballo1.getNombre());
		
		caballo1.setColor("Marrón");
		System.out.println("COLOR DEL CABALLO: " + caballo1.getColor());
		
		caballo1.setEdad(2);
		System.out.println("EDAD DEL CABALLO: " + caballo1.getEdad());
		
		caballo1.setCarrerasGanadas(10);
		System.out.println(caballo1.getCarrerasGanadas());
		
		System.out.println(caballo1);
		
		Caballo caballo2 = new Caballo("Fideo", "Blanco", 4, 20);
		System.out.println(caballo2.getCarrerasGanadas());
		
		System.out.println(caballo2);
		
		Caballo caballo3 = new Caballo();
		
		System.out.println(caballo3);
		
		caballo3.setCarrerasGanadas(100);
		caballo3.setColor("Morado");
		caballo3.setEdad(105);
		caballo3.setNombre("Federico");
		
		System.out.println(caballo3);	
	
	}

}
