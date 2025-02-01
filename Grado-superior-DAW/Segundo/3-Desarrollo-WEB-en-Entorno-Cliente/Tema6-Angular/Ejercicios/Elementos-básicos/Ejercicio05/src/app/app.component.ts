import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, FormsModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent {
  texto0: string = '';
  texto1: string = '';
  marcadoDesmarcado: boolean = false;
  fondoDivPrimeraFila: string = '';
  enlace: string = 'https://cv-cep.ceuandalucia.es/';
  nombreBoton: string = 'Mostrar';
  ocultarMostrarDivFila3: boolean = false;
  nombreBotonFila4: string = 'Habilitar';
  habilitadoDeshabilitado: boolean = true;

  mostrarTextoInput1(event: any) {
    this.texto0 = event.target.value;
  }

  ponerFondo(): string {
    if (this.marcadoDesmarcado == true) {
      return (this.fondoDivPrimeraFila = 'fondo');
    }
    return '';
  }

  cambiarNombreBoton() {
    if (this.nombreBoton == 'Mostrar') {
      this.nombreBoton = 'Ocultar';
    } else {
      this.nombreBoton = 'Mostrar';
    }
  }

  ocultarDiv() {
    if (this.nombreBoton == 'Mostrar') {
      this.ocultarMostrarDivFila3 = false;
    } else {
      this.ocultarMostrarDivFila3 = true;
    }
  }

  cambiarNombreBotonFila4() {
    if (this.nombreBotonFila4 == 'Habilitar') {
      this.nombreBotonFila4 = 'Deshabilitar';
    } else {
      this.nombreBotonFila4 = 'Habilitar';
    }
  }

  habilitarDeshabilitarBoton() {
    if (this.nombreBotonFila4 == 'Habilitar') {
      this.habilitadoDeshabilitado = true;
    } else {
      this.habilitadoDeshabilitado = false;
    }
  }
}
