import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Serie } from '../model/serie';

@Injectable({
  providedIn: 'root',
})
export class ServiceService {
  private url: string = 'https://api.tvmaze.com/shows/5';

  constructor(private http: HttpClient) {}

  getSerie(): Observable<Serie> {
    return this.http.get<Serie>(this.url);
  }
}
