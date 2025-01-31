import { Component } from '@angular/core';

@Component({
  selector: 'app-counter',
  standalone: true,
  imports: [],
  templateUrl: './counter.component.html',
  styleUrl: './counter.component.css',
})
export class CounterComponent {
  title: string = 'Counter';
  counter: number = 10;

  aumentarContador() {
    this.counter++;
  }

  resetearContador() {
    this.counter = 10;
  }

  disminuirContador() {
    this.counter--;
  }
}
