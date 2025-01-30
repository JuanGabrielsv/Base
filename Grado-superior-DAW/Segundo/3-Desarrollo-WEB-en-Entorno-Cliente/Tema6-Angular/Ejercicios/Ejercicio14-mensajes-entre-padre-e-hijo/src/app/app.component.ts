import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { HijoComponent } from './hijo/hijo.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, HijoComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent {
  title = 'Ejercicio14-mensajes-entre-padre-e-hijo-y-viceversa';
  mensajeParaElHijo: string | undefined;
  mensajeDesdeElHijo!: string;

  enviarAlHijo(mensajePadre: string) {
    this.mensajeParaElHijo = mensajePadre;
  }

  cogerMensajeDelHijo(even: any) {
    this.mensajeDesdeElHijo = even;
  }
}
