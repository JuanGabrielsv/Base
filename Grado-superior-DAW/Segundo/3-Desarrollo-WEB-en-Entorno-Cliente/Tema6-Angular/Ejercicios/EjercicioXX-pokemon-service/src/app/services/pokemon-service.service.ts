import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class PokemonServiceService {
  private url = 'https://pokeapi.co/api/v2/pokemon';
  constructor(private http: HttpClient) {}

  getListaPokemon() {
    return this.http.get(this.url);
  }
}
