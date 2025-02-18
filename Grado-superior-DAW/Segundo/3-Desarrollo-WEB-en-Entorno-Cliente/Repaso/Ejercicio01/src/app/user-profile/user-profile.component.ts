import { Component } from '@angular/core';

@Component({
  selector: 'app-user-profile',
  standalone: true,
  imports: [],
  templateUrl: './user-profile.component.html',
  styleUrl: './user-profile.component.css',
})
export class UserProfileComponent {
  nombre: String = 'Ton Hanks';
  role: String = 'Actor';
  clase: String = 'name';
  num: Number = 0;
  red: String = 'red';
  urlArbol: String = 'arbol.jpg';
  naranja: String = 'naranja';
  marcado: Boolean = true;
  deshabilitado: String = 'disabled';
  asignatura = {
    nombre: 'perico',
    codigo: 654216,
  };
}
