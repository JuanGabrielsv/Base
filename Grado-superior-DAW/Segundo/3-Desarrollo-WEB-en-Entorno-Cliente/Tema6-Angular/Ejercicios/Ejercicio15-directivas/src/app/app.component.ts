import { NgFor, NgIf } from '@angular/common';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, NgIf, NgFor],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent {
  title = 'Ejercicio15-directivas';
  usuarioAgregado: boolean = true;
  textoAltaNoAlta: string = 'Ninguna Alta';
  personas: Persona[] = [
    {
      nombre: 'Juan Gabriel',
      apellidos: 'Sánchez',
      edad: 41,
    },
    {
      nombre: 'Laura',
      apellidos: 'Carmona',
      edad: 29,
    },
  ];

  agregarUsuario() {
    this.textoAltaNoAlta = 'Alta correcta de usuario';
  }
}

export interface Persona {
  nombre: string;
  apellidos: string;
  edad: number;
}
