import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { HijoComponent } from './hijo/hijo.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, HijoComponent],
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

  obtenerNombre(nombre: string) {
    this.nombre = nombre;
  }

  obtenerNota(nota: number) {
    this.nota = nota;
  }
}
