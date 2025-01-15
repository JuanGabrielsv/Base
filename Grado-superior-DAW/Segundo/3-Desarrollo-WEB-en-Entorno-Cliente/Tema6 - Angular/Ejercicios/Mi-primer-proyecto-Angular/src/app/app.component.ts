import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';

@Component({
    selector: 'app-root',
    standalone: true,
    imports: [RouterOutlet],
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
}
