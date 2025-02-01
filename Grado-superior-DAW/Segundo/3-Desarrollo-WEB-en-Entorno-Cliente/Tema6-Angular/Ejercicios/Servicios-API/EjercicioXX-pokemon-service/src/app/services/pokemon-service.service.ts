import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class PokemonServiceService {
  private url = 'https://pokeapi.co/api/v2/pokemon';

  // Paso 1: Creamos constructor e inyectamos el objeto HttpClient.
  constructor(private http: HttpClient) {}

  // Paso 2: Creamos los métodos que queramos para llamar a this.http.get.
  getListaPokemon() {
    return this.http.get(this.url);
  }
}
