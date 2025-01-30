import { NgFor, NgIf } from '@angular/common';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, NgIf, NgFor, FormsModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent {
  title = 'Ejercicio15-directivas';
  usuarioAgregado: boolean = true;
  textoAltaNoAlta: string = 'Ninguna Alta';
  botonPulsado: string = 'No ha seleccionado ningún botón';
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

  cualBotonPulsado(opcion: String) {
    if (opcion == 'a') {
      this.botonPulsado = 'A';
    } else if (opcion == 'b') {
      this.botonPulsado = 'B';
    } else {
      this.botonPulsado = 'C';
    }
  }

  cualBotonSoltado(opcion: String) {
    if (opcion == 'a') {
      this.botonPulsado = 'No ha seleccionado ningún botón';
    } else if (opcion == 'b') {
      this.botonPulsado = 'No ha seleccionado ningún botón';
    } else {
      this.botonPulsado = 'No ha seleccionado ningún botón';
    }
  }
}

export interface Persona {
  nombre: string;
  apellidos: string;
  edad: number;
}
