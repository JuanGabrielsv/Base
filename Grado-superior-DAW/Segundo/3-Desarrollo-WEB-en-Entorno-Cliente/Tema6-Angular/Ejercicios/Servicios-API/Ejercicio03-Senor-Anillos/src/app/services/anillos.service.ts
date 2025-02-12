import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Personaje } from '../model/personaje';

@Injectable({
  providedIn: 'root',
})
export class AnillosService {
  constructor(private http: HttpClient) {}

  private personajes: Personaje[] = [
    {
      id: 1,
      nombre: 'Nombre1',
      raza: 'Raza1',
    },
    {
      id: 2,
      nombre: 'Nombre2',
      raza: 'Raza2',
    },
    {
      id: 3,
      nombre: 'Nombre3',
      raza: 'Raza3',
    },
  ];

  getPersonajes(): Personaje[] {
    return this.personajes;
  }

  removePersonaje(id: number): void {
    this.personajes = this.personajes.filter((p) => p.id !== id);
  }
}
