import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { AlumnoComponent } from './alumno/alumno.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, AlumnoComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {

	/* Sobre el componente creado app.component, definir dos parámetros y mostrarlos en la vista.
	Uno que se llame name con vuestro nombre y otro que se llame imgUrl y tenga la URL de la
	imagen que ya está en el componente. Crear la imagen en la vista para que la url sea ese valor
	que le estáis pasando desde el componente. Hacerlo de las dos formas vistas. */
	name: string = 'Juan Gabriel';
	imgUrl: string = 'glass_spear.svg';

	/* Sobre el componente creado app.component, crear un párrafo con vuestro nombre, con una clase
	de estilo “naranja” que ponga el color naranja. Hacedlo usando el método Property Binding. */
	naranja: string = '#ffa500';
	orange: string = 'orange';

	/* Sobre la vista app.component.html, crear un checkbox que inicialmente esté marcado. Para ello
	crear una propiedad marcado = true en el componente y que desde la vista pueda leer dicha
	propiedad. */
	marcado: boolean = true;

	/* Sobre la vista app.component.html, crear un input de type text que muestre vuestro nombre y
	que esté deshabilitado. Creando una propiedad que se llame deshabilitado. */
	deshabilitado: boolean = true;

	/* Crear en el componente un registro (objeto literal) que se llame asignatura. Tendrá los campos:
	nombre y codigo. Darles valores y mostrarlos desde la vista dentro de dos div. */
	asignatura = {
		nombre: 'Desarrollo web en entorno cliente',
		codigo: 654152
	}

}
