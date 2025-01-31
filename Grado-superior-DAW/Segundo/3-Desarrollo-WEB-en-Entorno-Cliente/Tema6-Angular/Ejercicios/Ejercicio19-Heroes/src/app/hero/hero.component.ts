import { NgIf } from '@angular/common';
import { Component } from '@angular/core';

@Component({
  selector: 'app-hero',
  standalone: true,
  imports: [NgIf],
  templateUrl: './hero.component.html',
  styleUrl: './hero.component.css',
})
export class HeroComponent {
  title: string = 'Bienvenido a Heroes';
  nombre: string = 'Ironman';
  edad: number = 2224;
  nombreMayusculas: string = this.nombre.toLocaleUpperCase();
  nombreEdad: string = this.nombre + this.edad;

  cambiarEdad18() {
    this.edad = 18;
  }

  cambiarNombre() {
    this.nombre = 'Spiderman';
  }
}
