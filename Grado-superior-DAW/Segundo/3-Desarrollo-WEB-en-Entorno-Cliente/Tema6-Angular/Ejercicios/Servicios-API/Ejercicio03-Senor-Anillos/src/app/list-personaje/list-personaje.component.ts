import { Component, OnInit } from '@angular/core';
import { AnillosService } from '../services/anillos.service';
import { Personaje } from '../model/personaje';
import { NgFor } from '@angular/common';

@Component({
  selector: 'app-list-personaje',
  standalone: true,
  imports: [NgFor],
  templateUrl: './list-personaje.component.html',
  styleUrl: './list-personaje.component.css',
})
export class ListPersonajeComponent implements OnInit {
  personajes?: Personaje[];
  constructor(private servicioPersonaje: AnillosService) {}
  ngOnInit(): void {
    this.getPersonajes();
  }

  getPersonajes(): void {
    this.personajes = this.servicioPersonaje.getPersonajes();
  }

  removePersonaje(id: number) {
    this.servicioPersonaje.removePersonaje(id);
    this.getPersonajes();
  }
}
