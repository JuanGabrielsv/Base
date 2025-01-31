import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { ListadoPersonasComponent } from './listado-personas/listado-personas.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, ListadoPersonasComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent {
  title = 'Ejercicio17-Personas';
}
