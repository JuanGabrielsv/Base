import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { RelojComponent } from './reloj/reloj.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, RelojComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent {
  title = 'Ejercicio07-Calculadora';
}
