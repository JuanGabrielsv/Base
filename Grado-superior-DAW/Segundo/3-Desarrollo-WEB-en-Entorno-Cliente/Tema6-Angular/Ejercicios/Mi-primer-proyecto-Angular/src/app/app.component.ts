import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { UserProfileComponent } from './user-profile/user-profile.component';
import { AlumnoComponent } from './alumno/alumno.component';
import { FormsModule } from '@angular/forms';

@Component({
    selector: 'app-root',
    standalone: true,
    imports: [RouterOutlet, UserProfileComponent, AlumnoComponent, FormsModule],
    templateUrl: './app.component.html',
    styleUrl: './app.component.css'
})
export class AppComponent {
    title = 'Mi_primer_proyecto_Angular';
    nombre: string = 'Juan Gabriel Sánchez';
    edad: number = 18;

    getEdad(): number {
        return this.edad;
    }

    name: string = 'Juan Gabriel';
    imgUrl: string = './aguacate.png';
    naranja: string = 'naranja';
    chekeado: boolean = true;
    deshabilitado: boolean = true;

    asignatura = {
        nombre: 'Desarollo Entorno cliente',
        codigo: 'DWEC'
    }
}
