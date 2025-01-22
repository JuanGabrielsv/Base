import { Component } from '@angular/core';

@Component({
    selector: 'app-alumno',
    standalone: true,
    imports: [],
    templateUrl: './alumno.component.html',
    styleUrl: './alumno.component.css'
})
export class AlumnoComponent {

    rojo: string = 'rojo';

    nombre: string = 'Pepe';
    apellido: string = 'López';
    edad: number = 19;
    dni: string = '53214854P';

    /* Crear un botón y un input de tipo text. Al pulsar el botón (click), muestre en el input, el nombre de
        vuestro compañero. Pista: Crear un método y un atributo en la clase para guardar el nombre de
        vuestro compañero.*/
    nombre2: string = '';
    mostrarDos() {
        this.nombre2 = 'hola';
    }

    /* Crear un input de tipo text. Cuando termine de escribir en él, con el evento keyup, mostrará una
        etiqueta con lo que haya escrito. Cada vez que lance el evento, los valores se irán concatenando con
        una coma. Pista: crear un método asociado al evento keyup y un atributo key para concatenar su
        valor al nuevo valor del input. Para acceder a dicho valor: event.target.value*/
    key: string = '';
    mostrar3(event: any) {
        this.key += event.target.value + ',';
    }

    /*Crear un checkbox y que cuando lo marque o desmarque avise al componente y muestre en una
        etiqueta p de la vista, si está o no marcado.*/
}
