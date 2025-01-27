import { Component } from '@angular/core';

@Component({
  selector: 'app-alumno',
  standalone: true,
  imports: [],
  templateUrl: './alumno.component.html',
  styleUrl: './alumno.component.css'
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

}
