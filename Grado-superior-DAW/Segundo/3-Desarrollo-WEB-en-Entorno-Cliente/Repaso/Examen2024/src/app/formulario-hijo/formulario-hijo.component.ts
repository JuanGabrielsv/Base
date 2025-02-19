import { Component, EventEmitter, Input, Output } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-formulario-hijo',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './formulario-hijo.component.html',
  styleUrl: './formulario-hijo.component.css',
})
export class FormularioHijoComponent {
  valoracion!: string;
  @Output() selected = new EventEmitter<string>();
  @Input() serie!: string;
  @Input() email!: string;
  @Input() nombre!: string;

  enviar() {
    this.selected.emit(this.valoracion);
  }
}
