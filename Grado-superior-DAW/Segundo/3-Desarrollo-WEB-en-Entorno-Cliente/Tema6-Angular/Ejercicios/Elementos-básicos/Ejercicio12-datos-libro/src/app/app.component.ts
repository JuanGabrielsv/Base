import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterOutlet } from '@angular/router';
import { DatosLibroComponent } from './datos-libro/datos-libro.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, FormsModule, DatosLibroComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent {
  nombreLibro!: string;
  numeroDeLibro!: number;
  nombre!: string;

  mostrarNombre() {
    this.nombre = 'Juangra';
  }

  devolverLibroElegido(event: any) {
    this.nombreLibro = event;
  }
}
