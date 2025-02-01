import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-reloj',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './reloj.component.html',
  styleUrl: './reloj.component.css',
})
export class RelojComponent {
  hora: string = '12:00:00';
  horaModificada: string = '';
  horaActual: Date = new Date();

  cambiarHora() {
    this.horaModificada = this.hora;
  }

  temp = setInterval(() => {
    this.horaActual = new Date();
  }, 1000);
}
