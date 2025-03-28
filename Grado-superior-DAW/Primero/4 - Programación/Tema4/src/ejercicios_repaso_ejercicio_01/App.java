/*
EJERCICIO 1
Crea una clase llamada Smartphone con los siguientes atributos privados:
	• marca (Texto)
	• modelo (Texto)
	• imei (Texto)
	• precio (Número decimal)
	• fechaFabricacion (LocalDate)
	• activo (Booleano)
	
Añade 3 constructores:
	• Constructor por defecto
	• Constructor que reciba e inicialice el imei
	• Constructor que reciba e inicialice el imei, la marca y el modelo
Todos los constructores deben inicializar el smartphone como activo y a precio 0.

Añade los siguientes métodos:
	• setPrecio() -> permite cambiar el precio del Smartphone
	• activar -> activa el Smartphone
	• desactivar -> inactiva el Smartphone
	• getEdad() -> devuelve los años transcurridos desde el 1 de abril del 2000 hasta la fecha de fabricación del Smartphone
	• cambiarMarcaModelo() -> recibe una marca y modelo para cambiar los delSmartphone
	• establecerFabricacion() -> recibe y cambia la fecha de fabricación del Smartphone
	• getPrecioMasIva() -> devuelve el precio del Smartphone sumándole el IVA (21%)
	• isAltaGama() -> recibe un precio base y devolverá un booleano indicando si el
	  Smartphone es de alta gama o no. Los Smartphone de alta gama son aquellos cuyo precio es mayor al precio base recibido
	• isDatosCompletos() -> devuelve un booleano indicando si los datos del Smartphone
	  están completos. Para que lo estén, al menos el imai debe no estar vacío ni contener sólo espacios en blanco, y el precio no puede ser null.
	• isGratis() -> devuelve si el precio del Smartphone es o no es 0 euros.
	• rebajar() -> modifica el precio del Smartphone restándole 10 euros.
	• toString() -> sobrescribe el método toString de Object. Debe devolver una cadena con
	  el formato “marca (modelo)”. Si el Smartphone además está inactivo, la cadena será
	  así “marca (modelo) – INACTIVO”. 
*/
package ejercicios_repaso_ejercicio_01;

import java.math.BigDecimal;
import java.time.LocalDate;

public class App {

	public static void main(String[] args) {

		Smartphone movil1 = new Smartphone();
		Smartphone movil2 = new Smartphone("654854G542L", "Samsung", "S34");

		movil1.setPrecio(new BigDecimal(235));
		movil1.desactivar();
		movil1.activar();
		movil1.establecerFabricacion(LocalDate.of(2023, 5, 26));
		movil1.getEdad();
		movil1.cambiarMarcaModelo("Huawei", "S22");
		movil1.isDatosCompletos();
		
		movil2.setPrecio(new BigDecimal(199));
		
		System.out.println(movil1);
		System.out.println(movil1.getEdad());
		System.out.println(movil1.getPrecioMasIva());
		System.out.println(movil1.isAltaGama(new BigDecimal(300)));
		System.out.println(movil1.isDatosCompletos());
		System.out.println(movil2.isDatosCompletos());
		System.out.println(movil2);

	}

}
