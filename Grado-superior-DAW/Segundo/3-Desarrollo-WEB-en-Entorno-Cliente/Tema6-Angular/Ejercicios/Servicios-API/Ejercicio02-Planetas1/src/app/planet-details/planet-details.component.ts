import { Component, OnInit } from '@angular/core';
import { PlanetasService } from '../services/planetas.service';
import { Observable } from 'rxjs/internal/Observable';
import { Planeta } from '../model/planet';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-planet-details',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './planet-details.component.html',
  styleUrl: './planet-details.component.css',
})
export class PlanetDetailsComponent implements OnInit {
  texto1: string = 'Hijo';
  texto2: string = 'app-planet-details';

  planeta = new Observable<Planeta>();

  constructor(private planetaService: PlanetasService) {}

  ngOnInit(): void {
    this.planeta = this.planetaService.getPlaneta();
  }
}
