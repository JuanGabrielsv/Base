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
  nombre: string = 'Juangra';
  nota: number = 8;

  cambiarNombre(nombre: string) {
    this.nombre = nombre;
  }

  cambiarNota(nota: string) {
    this.nota = Number(nota);
  }
}
