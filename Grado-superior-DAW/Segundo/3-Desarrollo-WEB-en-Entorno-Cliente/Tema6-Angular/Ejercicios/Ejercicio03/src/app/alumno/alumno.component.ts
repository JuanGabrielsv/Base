import { Component } from '@angular/core';

@Component({
  selector: 'app-alumno',
  standalone: true,
  imports: [],
  templateUrl: './alumno.component.html',
  styleUrl: './alumno.component.css',
})
export class AlumnoComponent {
  /* Mostrar un título (h1): ‘Componente Alumno’ de color rojo */
  textoRojo: string = 'textoRojo';

  /* Que tenga las siguientes propiedades: Nombre, apellido, edad y dni. Dar valores y mostrarlos en
	la vista o plantilla (html) con etiquetas <p>. */
  nombre: string = 'Juan Gabriel';
  apellido: string = 'Sánchez';
  edad: number = 41;
  dni: string = '53278134F';

  /*¿Qué tengo que cambiar si quiero que el cuadro de texto estará deshabilitado(disabled)?. Usar
	property binding. */
  deshabilitado: boolean = true;

  /*Crear en la vista otro checkbox que inicialmente esté desmarcado y cuando se marque, se
	muestre un mensaje alert con un mensaje. Probad a cambiar el valor del booleano en el
	componente.*/
  checked: boolean = false;
  texto: string = 'Antes de pulsar';

  mostrarAlert() {
    alert('Check marcado');
  }

  mostrarMensaje() {
    alert('Check marcado');
    this.texto = 'Check pulsado';
  }
}
