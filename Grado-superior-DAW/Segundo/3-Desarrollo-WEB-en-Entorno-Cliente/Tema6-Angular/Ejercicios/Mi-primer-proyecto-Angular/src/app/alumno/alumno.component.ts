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

}
