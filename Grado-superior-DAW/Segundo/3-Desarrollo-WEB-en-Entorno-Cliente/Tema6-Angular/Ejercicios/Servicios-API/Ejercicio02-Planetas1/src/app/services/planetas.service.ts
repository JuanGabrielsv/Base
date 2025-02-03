import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Planeta, Planetas } from '../model/planet';

@Injectable({
  providedIn: 'root',
})
export class PlanetasService {
  private url = 'https://swapi.dev/api/planets/?Page=1';
  private urlPlaneta = 'https://swapi.dev/api/planets/1';

  constructor(private http: HttpClient) {}

  getPlanets(): Observable<Planetas> {
    return this.http.get<Planetas>(this.url);
  }

  getPlaneta(): Observable<Planeta> {
    return this.http.get<Planeta>(this.urlPlaneta);
  }
}
