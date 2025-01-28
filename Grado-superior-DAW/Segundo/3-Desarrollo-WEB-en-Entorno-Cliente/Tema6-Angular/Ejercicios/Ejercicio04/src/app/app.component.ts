import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent {
  /* <!-- Crear un botón y un input de tipo text. Al pulsar el botón (click), muestre en el input, el nombre de
	vuestro compañero. Pista: Crear un método y un atributo en la clase para guardar el nombre de
	vuestro compañero. --> */
  nombre: string = '';
  mostrarNombre() {
    this.nombre = 'Juan Gabriel';
  }

  /* Crear un input de tipo text. Cuando termine de escribir en él, con el evento keyup, mostrará una
	etiqueta con lo que haya escrito. Cada vez que lance el evento, los valores se irán concatenando con
	una coma. Pista: crear un método asociado al evento keyup y un atributo key para concatenar su
	valor al nuevo valor del input. Para acceder a dicho valor: event.target.value */
  key: string = '';
  concatenarLoEscrito(event: any) {
    this.key += event.target.value + ',';
  }
}
