import { Component } from '@angular/core';
import { PlanetListComponent } from './planet-list/planet-list.component';
import { PlanetDetailsComponent } from './planet-details/planet-details.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [PlanetListComponent, PlanetDetailsComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent {
  title: string = 'app-root';
  title1: string = 'Padre';
}
