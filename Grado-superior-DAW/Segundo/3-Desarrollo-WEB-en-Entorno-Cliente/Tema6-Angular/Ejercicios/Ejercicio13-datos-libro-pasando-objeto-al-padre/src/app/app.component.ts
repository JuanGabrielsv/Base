import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import {
  DatosLibroComponent,
  Libro,
} from './datos-libro/datos-libro.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, DatosLibroComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent {
  libro: Libro | undefined;
  numLibro: number | undefined;
  nombre!: string;
  title = 'Ejercicio13-datos-libro-pasando-objeto-al-padre';

  mostrarNombre() {
    this.nombre = 'Juangra';
  }

  obtenerValorInputLibro(inputLibro: string) {
    this.numLibro = Number(inputLibro);
  }

  pasarLibroAlPadre(event: Libro) {
    this.libro = event;
  }
}
