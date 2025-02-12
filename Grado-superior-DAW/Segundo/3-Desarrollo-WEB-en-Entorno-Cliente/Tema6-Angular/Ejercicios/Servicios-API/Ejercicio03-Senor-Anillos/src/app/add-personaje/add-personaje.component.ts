import { Component } from '@angular/core';

@Component({
  selector: 'app-add-personaje',
  standalone: true,
  imports: [],
  templateUrl: './add-personaje.component.html',
  styleUrl: './add-personaje.component.css',
})
export class AddPersonajeComponent {
  nombre!: string;
  raza!: string;
}
