import { Component, EventEmitter, Input, Output } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-hijo',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './hijo.component.html',
  styleUrl: './hijo.component.css',
})
export class HijoComponent {
  @Input() nombre!: string;
  @Input() nota!: number;
  @Output() nombreHijo = new EventEmitter<string>();
  @Output() notaHijo = new EventEmitter<number>();

  cambiarNombre(nombre: string) {
    this.nombreHijo.emit(nombre);
  }

  cambiaNota(nota: string) {
    this.notaHijo.emit(Number(nota));
  }
}
