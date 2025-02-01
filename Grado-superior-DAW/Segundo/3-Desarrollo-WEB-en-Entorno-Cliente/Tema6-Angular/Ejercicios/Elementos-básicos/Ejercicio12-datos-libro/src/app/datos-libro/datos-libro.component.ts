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
  numeroDeLibroPadre!: number;
  @Output()
  selected = new EventEmitter<string>();

  aLibros: Libro[] = [
    {
      titulo: 'En las montañas de la locura',
      autor: 'H.P Lovecraft',
      anoPublicacion: 1936,
    },
    {
      titulo: 'El señor de los anillos',
      autor: 'J.R.R Tolkien',
      anoPublicacion: 1954,
    },
  ];

  devolverLibroElegido() {
    if (this.numeroDeLibroPadre == 1) {
      this.selected.emit(this.aLibros[0].titulo);
    } else if (this.numeroDeLibroPadre == 2) {
      this.selected.emit(this.aLibros[1].titulo);
    } else {
      this.selected.emit(undefined);
    }
  }
}

export interface Libro {
  titulo: string;
  autor: string;
  anoPublicacion: number;
}
