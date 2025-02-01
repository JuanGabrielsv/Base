import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { DatosLibroComponent } from './datos-libro/datos-libro.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, DatosLibroComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent {
  title = 'Ejercicio06';
}
