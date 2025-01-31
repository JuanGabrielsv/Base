import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { ListadoPersonasComponent } from './listado-personas/listado-personas.component';
import { NgFor, NgIf } from '@angular/common';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, ListadoPersonasComponent, NgFor, NgIf],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent {
  personaObtenida!: Persona;
  personas: Persona[] = [
    {
      nombre: 'Persona 1',
      apellidos: 'Apellidos 1',
      edad: 15,
    },
    {
      nombre: 'Persona 2',
      apellidos: 'Apellidos 2',
      edad: 19,
    },
    {
      nombre: 'Persona 3',
      apellidos: 'Apellidos 3',
      edad: 42,
    },
    {
      nombre: 'Persona 4',
      apellidos: 'Apellidos 4',
      edad: 5,
    },
  ];

  obtenerPersona(even: any) {
    this.personaObtenida = even;
  }
}

export interface Persona {
  nombre: string;
  apellidos: string;
  edad: number;
}
