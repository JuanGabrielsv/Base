import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-datos-libro',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './datos-libro.component.html',
  styleUrl: './datos-libro.component.css',
})
export class DatosLibroComponent {
  deshabilitado: boolean = false;
  libro = {
    titulo: 'En las montañas de la locura',
    autor: 'H.P Lovecraft',
    precio: 15.99,
    stock: 0,
    cantidad: 0,
    imagen: './Portada_En_las_montañas_de_la_locura_H_P_Lovecraft.jpg',
  };

  anadirCantidad() {
    this.libro.cantidad++;
  }

  quitarCantidad() {
    this.libro.cantidad--;
  }

  mostrarPosicion(event: any) {
    console.log(event.clientX + ',' + event.clientY);
  }
}
