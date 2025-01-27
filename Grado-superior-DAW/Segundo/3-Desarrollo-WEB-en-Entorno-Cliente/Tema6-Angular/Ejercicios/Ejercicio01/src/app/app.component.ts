import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';

@Component({
    /* <!-- Vamos a index.html. Aparece la etiqueta:<app-root> . Vamos a cambiarle el nombre: <app-hola>
    ¿Que pasaría? 
    (Dejaría de verse lo realizado en la vista).
    ¿Qué tendríamos que cambiar para que vuelva a mostrar el componente? 
    (Tendríamos que cambiar el nombre del selector en app.component.ts) --> */
    selector: 'app-hola',
    standalone: true,
    imports: [RouterOutlet],
    templateUrl: './app.component.html',
    styleUrl: './app.component.css'
})
export class AppComponent {

    /* Vamos al componente “app.component.ts”. La clase AppComponent tiene una propiedad title.
    Vamos a cambiarle el nombre de title:
    title: string =” Clase de Angular”. ¿Cambia algo la página?
    Para mostrar el valor de una propiedad en la vista usamos {{ propiedad}}. Esto se conoce como binding.
    <h2> Título: {{ title}} </h2> */
    title: string = 'Clase de Angular';

    /* Añadir una propiedad al componente nombre inicializada con vuestro nombre y mostrarla en la
    vista del componente con la etiqueta h3. */
    nombre: string = 'Juan Gabriel';

    /* Crear en el componente una variable numérica ‘edad’ con el valor 18 (tipo number) y un método
    getEdad que devuelva el campo edad. En la vista crear un párrafo que indique el mensaje “es mayor
    de edad” o “menor de edad” en función del valor de ‘edad’. */
    edad: number = 18;
    getEdad(): number {
        return this.edad;
    }
}