import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class PlanetasService {
  private url = 'https://swapi.dev/api/planets/?page=1';

  constructor(private http: HttpClient) {}

  getPlanets() {
    return this.http.get(this.url);
  }
}
