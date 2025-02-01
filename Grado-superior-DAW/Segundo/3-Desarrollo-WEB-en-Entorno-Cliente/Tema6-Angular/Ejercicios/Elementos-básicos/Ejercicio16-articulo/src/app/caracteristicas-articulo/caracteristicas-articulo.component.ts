import { Component, EventEmitter, Output } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-caracteristicas-articulo',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './caracteristicas-articulo.component.html',
  styleUrl: './caracteristicas-articulo.component.css',
})
export class CaracteristicasArticuloComponent {
  @Output()
  selected = new EventEmitter<string>();
  valorInput!: string;

  pasarCaracteristica() {
    this.selected.emit(this.valorInput);
  }
}
