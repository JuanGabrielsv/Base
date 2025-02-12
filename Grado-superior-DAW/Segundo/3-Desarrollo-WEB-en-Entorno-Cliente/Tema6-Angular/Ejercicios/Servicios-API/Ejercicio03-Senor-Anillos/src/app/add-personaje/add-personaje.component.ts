import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { AnillosService } from '../services/anillos.service';

@Component({
  selector: 'app-add-personaje',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './add-personaje.component.html',
  styleUrl: './add-personaje.component.css',
})
export class AddPersonajeComponent implements OnInit {
  nombre!: string;
  raza!: string;

  constructor(private servicioPersonaje: AnillosService) {}

  ngOnInit(): void {
    this.servicioPersonaje.getPersonajes();
  }

  agregarPersonaje(nombre: string, raza: string) {
    this.servicioPersonaje.agregarPersonaje(nombre, raza);
    this.nombre = '';
    this.raza = '';
  }
}
