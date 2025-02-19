import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { FormularioHijoComponent } from '../formulario-hijo/formulario-hijo.component';

@Component({
  selector: 'app-formulario',
  standalone: true,
  imports: [FormsModule, CommonModule, FormularioHijoComponent],
  templateUrl: './formulario.component.html',
  styleUrl: './formulario.component.css',
})
export class FormularioComponent {
  valoracionHijo!: string;
  serie: string = '';
  email: string = '';
  nombre: string = '';
  boton!: boolean;
  formularioOk: boolean = false;
  datoSerie!: string;
  datoEmail!: string;
  datoNombre!: string;

  cogerValoracion(event: any) {
    this.valoracionHijo = event;
  }

  validarFormulario() {
    this.boton = true;
    if (this.serie == '' || this.email == '' || this.nombre == '') {
      this.formularioOk = false;
      return;
    }
    this.datoSerie = this.serie;
    this.datoEmail = this.email;
    this.datoNombre = this.nombre;
    this.formularioOk = true;
  }
}
