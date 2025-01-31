import { Component, EventEmitter, Output, output } from '@angular/core';

@Component({
  selector: 'app-listado-personas',
  standalone: true,
  imports: [],
  templateUrl: './listado-personas.component.html',
  styleUrl: './listado-personas.component.css',
})
export class ListadoPersonasComponent {
  /* 
• Crear  un  componente  hijo:  listado-personas. 
• Desde  el  componente  principal, llamamos  al componente hijo tantas veces como personas haya en el array pasándole la “persona” 
• El componente hijo, listará nombre, apellidos y edad. Además: 
	Si la persona es menor de edad, se muestre un mensaje ”Menor de edad” en color rojo. En caso
	contrario, mostrar el mensaje: “Mayor de edad” */
  @Output()
  selected = new EventEmitter<Persona>();
  personas: Persona[] = [
    {
      nombre: 'Persona 1',
      apellidos: 'Apellidos 1',
      edad: 23,
    },
    {
      nombre: 'Persona 2',
      apellidos: 'Apellidos 2',
      edad: 12,
    },
    {
      nombre: 'Persona 3',
      apellidos: 'Apellidos 3',
      edad: 42,
    },
    {
      nombre: 'Persona 4',
      apellidos: 'Apellidos 4',
      edad: 5,
    },
  ];
  persona1: Persona = this.personas[0];
  persona2: Persona = this.personas[1];
  persona3: Persona = this.personas[2];
  persona4: Persona = this.personas[3];
}

export interface Persona {
  nombre: string;
  apellidos: string;
  edad: number;
}
