import { Component, EventEmitter, Input, Output } from '@angular/core';

@Component({
  selector: 'app-datos-libro',
  standalone: true,
  imports: [],
  templateUrl: './datos-libro.component.html',
  styleUrl: './datos-libro.component.css',
})
export class DatosLibroComponent {
  @Input()
  numLibroDelPadre: number | undefined;
  @Output()
  selected = new EventEmitter<Libro>();

  aLibros: Libro[] = [
    {
      titulo: 'En las montañas de la locura',
      autor: 'H.P Lovecraft',
      ano: 1936,
    },
    {
      titulo: 'El señor de los anillos',
      autor: 'J.R.R Tolkien',
      ano: 1954,
    },
  ];

  pasarLibroAlPadre() {
    if (this.numLibroDelPadre == 1) {
      this.selected.emit(this.aLibros[0]);
    } else if (this.numLibroDelPadre == 2) {
      this.selected.emit(this.aLibros[1]);
    } else {
      this.selected.emit(undefined);
    }
  }
}
export interface Libro {
  titulo: string;
  autor: string;
  ano: number;
}
