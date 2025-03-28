/* EJERCICIO 47
Nos han encargado que programemos unas clases para gestionar el Carrito de compra de una
tienda online. El carrito tendrá que guardar esta información:

	o Fecha de creación
	o Fecha de última actualización (se debe actualizar cada vez que se haga un cambio en la cesta)
	o Cliente
		• DNI
		• Nombre
	o Lista de artículos
	
Los artículos los hay de dos tipos: Ropa y Libros. Todos tienen una descripción y un precio.
Pero la ropa además tiene talla y color. Y los libros tienen autor.

Nos piden que el carrito tenga estos métodos:

• get() de todos los atributos
• Constructor único que recibirá un Cliente. Debe inicializar la fecha de creación y de última
  actualización con la fecha del momento en el que se crea el carrito.
• getCantidad() que devuelve la cantidad total de artículos en la cesta
• getTotal() que devuelve el importe total que habría que pagar
• getPrecioMedio() que devuelve el precio medio de la cesta (división del total entre la
  cantidad de artículos)
• toString() que imprima datos de cliente, cantidad de artículos, suma del total a pagar y
  fecha de última actualización en formato dd/MM/yyyy
• addArticulo() que recibe un artículo y lo añade a la lista
• borrarArticulo() que recibe un entero y borra el artículo que ocupa esa posición.
• vaciarCesta() que elimina todo el contenido de la cesta.

Realiza un programa que haga lo siguiente:

1. Crea un cliente con dni 12345678X y nombre “Blas de los Montes”.
2. Crea una cesta para el cliente anterior. Imprímela
3. Crea un artículo de tipo Ropa que cueste 20 euros, se llame “Poncho”, con talla XL y
   color azul.
4. Añade el artículo anterior dos veces a la cesta. Imprímela
5. Crea un artículo de tipo Libro que cueste 15 euros, se llame “Así habló Zaratustra” del
   autor “Nietzsche”
6. Añade el artículo anterior una vez a la cesta. Imprímela
7. Borra el artículo que aparece en la posición 1 de la cesta. Imprímela
8. Obtén e imprime el precio medio del artículo.
9. Vacía la cesta e imprímela.
10.Obtén e imprime el precio medio del artículo. */

package ejercicios_básicos_ejercicio_47;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Carrito {

	private LocalDate fechaCreacion;
	private LocalDate fechaModificacion;
	private Cliente cliente;
	private List<Articulo> articulos;

	public Carrito(Cliente cliente) {
		this.cliente = cliente;
		this.fechaCreacion = LocalDate.now();
		this.fechaModificacion = LocalDate.now();
		this.articulos = new ArrayList<>();
	}

	public LocalDate getFechaCreacion() {
		return fechaCreacion;
	}

	public LocalDate getFechaModificacion() {
		return fechaModificacion;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public List<Articulo> getArticulos() {
		return articulos;
	}

	public Integer getCantidad() {
		return articulos.size();
	}

	public Double getTotal() {		
		Double total = 0D;		
		for (Articulo articulo : articulos) {
			total = total + articulo.getPrecio();
		}		
		return total;
	}

	public Double getPrecioMedio() {
		if (getCantidad() == 0) {
			return 0D;

		}
		return getTotal() / getCantidad();
	}

}
