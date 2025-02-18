import { Component } from '@angular/core';

@Component({
  selector: 'app-alumno',
  standalone: true,
  imports: [],
  templateUrl: './alumno.component.html',
  styleUrl: './alumno.component.css',
})
export class AlumnoComponent {
  alumno = {
    nombre: 'paco',
    apellido: 'fdez',
    edad: 29,
    dni: '6546F',
  };
}
