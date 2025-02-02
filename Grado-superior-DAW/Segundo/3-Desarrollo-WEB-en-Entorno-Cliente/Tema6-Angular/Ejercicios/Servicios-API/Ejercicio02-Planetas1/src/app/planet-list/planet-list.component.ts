import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { CommonModule, NgFor } from '@angular/common';
import { PlanetasService } from '../services/planetas.service';

@Component({
  selector: 'app-planet-list',
  standalone: true,
  imports: [CommonModule, NgFor],
  templateUrl: './planet-list.component.html',
  styleUrl: './planet-list.component.css',
})
export class PlanetListComponent implements OnInit {
  title: string = 'app-planet-list';
  title1: string = 'Hijo';

  planetasList = new Observable<any>();

  constructor(private planetaService: PlanetasService) {}

  ngOnInit(): void {
    this.planetasList = this.planetaService.getPlanets();
    throw new Error('Method not implemented');
  }
}
