import { NgFor, NgIf } from '@angular/common';
import { Component } from '@angular/core';

@Component({
  selector: 'app-list',
  standalone: true,
  imports: [NgFor, NgIf],
  templateUrl: './list.component.html',
  styleUrl: './list.component.css',
})
export class ListComponent {
  textoBoton: string = 'Borrar último heroe';
  textoHeroeBorrado: string = 'El héroe borrado es ';
  textoNingunHeroeBorrado: string = 'No se ha borrado nada';
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
    if (this.heroes.length > 0) {
      this.heroeBorrado = this.heroes.pop() || null;
      this.textoNingunHeroeBorrado = '';
    }
  }
}
