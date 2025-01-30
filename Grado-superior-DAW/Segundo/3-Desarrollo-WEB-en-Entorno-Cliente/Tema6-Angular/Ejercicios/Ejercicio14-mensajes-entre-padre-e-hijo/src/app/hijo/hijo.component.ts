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
  @Input()
  mensajeDesdePadre: string | undefined;
  @Output()
  selected = new EventEmitter<string>();
  inputHijo: string | undefined;

  enviarMensajeAlPadre() {
    this.selected.emit(this.inputHijo);
  }
}
