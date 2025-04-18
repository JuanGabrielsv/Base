import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { UserProfileComponent } from './user-profile/user-profile.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, UserProfileComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent {
  datoDelHijo: string = '';
  title = 'Ejercicio11-De-Hijo-a-Padre';

  seleccionar(event: any) {
    this.datoDelHijo = event;
  }
}
