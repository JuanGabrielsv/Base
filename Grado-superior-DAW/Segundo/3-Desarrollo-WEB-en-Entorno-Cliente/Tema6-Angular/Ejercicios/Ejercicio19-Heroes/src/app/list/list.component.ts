import { NgFor } from '@angular/common';
import { Component } from '@angular/core';

@Component({
  selector: 'app-list',
  standalone: true,
  imports: [NgFor],
  templateUrl: './list.component.html',
  styleUrl: './list.component.css',
})
export class ListComponent {
  textoBoton: string = 'Borrar último heroe';
  heroeBorrado: string | null = null;
  heroes: string[] = [
    'Wonder Woman',
    'Spiderman',
    'Ironman',
    'Superman',
    'Super Mario',
    'Uther',
    'Bud Spencer',
  ];

  borrarUltimoHeroe() {
    this.heroes.pop();
  }

  borrarHeroe() {
    if (this.heroes.length > 0) {
      this.heroeBorrado = this.heroes.pop() || null;
    }
  }
}
