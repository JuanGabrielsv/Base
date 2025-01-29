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
  numero1: number = 0;
  numero2: number = 0;
  resultadoSuma: number = 0;
  resultadoResta: number = 0;
  resultadoMultiplicar: number = 0;
  resultadoDividir: number = 0;

  sumar() {
    this.resultadoSuma = this.numero1 + this.numero2;
  }

  restar() {
    this.resultadoResta = this.numero1 - this.numero2;
  }

  multiplicar() {
    this.resultadoMultiplicar = this.numero1 * this.numero2;
  }

  dividir() {
    this.resultadoDividir = this.numero1 / this.numero2;
  }
}
