import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { ArticuloComponent } from './articulo/articulo.component';
import { ListadoArticulosComponent } from './listado-articulos/listado-articulos.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, ArticuloComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent {
  title = 'Ejercicio16-articulo';
}
