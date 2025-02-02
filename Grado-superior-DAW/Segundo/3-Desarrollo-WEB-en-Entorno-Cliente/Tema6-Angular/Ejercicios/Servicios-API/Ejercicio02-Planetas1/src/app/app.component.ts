import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { PlanetListComponent } from './planet-list/planet-list.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, PlanetListComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent {
  title: string = 'app-root';
  title1: string = 'Padre';
}
