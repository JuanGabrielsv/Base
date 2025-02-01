import { Component } from '@angular/core';

@Component({
  selector: 'app-counter',
  standalone: true,
  imports: [],
  templateUrl: './counter.component.html',
  styleUrl: './counter.component.css',
})
export class CounterComponent {
  contador: number = 10;

  incrementar() {
    this.contador++;
  }

  decrementar() {
    this.contador--;
  }

  resetarContador() {
    this.contador = 10;
  }
}
