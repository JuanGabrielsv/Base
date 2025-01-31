import { Component } from '@angular/core';
import { Articulo } from '../model/articulo.model';
import { NgFor } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ListadoArticulosComponent } from '../listado-articulos/listado-articulos.component';

@Component({
  selector: 'app-articulo',
  standalone: true,
  imports: [NgFor, FormsModule, ListadoArticulosComponent],
  templateUrl: './articulo.component.html',
  styleUrl: './articulo.component.css',
})
export class ArticuloComponent {
  nombre!: string;
  precio!: number;
  unidades!: number;
  articulos: Articulo[] = [
    {
      nombre: 'Artículo 1',
      precio: 15,
      unidades: 5,
    },
    {
      nombre: 'Artículo 2',
      precio: 19,
      unidades: 3,
    },
    {
      nombre: 'Artículo 3',
      precio: 22,
      unidades: 12,
    },
  ];

  guardarArticulo() {
    const nuevoArticulo: Articulo = {
      nombre: this.nombre,
      precio: Number(this.precio),
      unidades: Number(this.unidades),
    };
    this.articulos.push(nuevoArticulo);
  }
}
