import { Component, Input } from '@angular/core';
import { Articulo } from '../model/articulo.model';
import { NgFor } from '@angular/common';
import { CaracteristicasArticuloComponent } from '../caracteristicas-articulo/caracteristicas-articulo.component';

@Component({
  selector: 'app-listado-articulos',
  standalone: true,
  imports: [NgFor, CaracteristicasArticuloComponent],
  templateUrl: './listado-articulos.component.html',
  styleUrl: './listado-articulos.component.css',
})
export class ListadoArticulosComponent {
  @Input()
  articulos!: Articulo[];
  valorInput!: string;

  capturarValorInput(even: any) {
    this.valorInput = even;
  }
}
