import { Component } from '@angular/core';

@Component({
  selector: 'app-user-profile',
  imports: [],
  templateUrl: './user-profile.component.html',
  styleUrl: './user-profile.component.css',
})
export class UserProfileComponent {
  name: string = 'Tom Hanks';
  role: string = 'Usuario';
  titulo: string = 'Component User';
  naranja: string = 'naranja';
  nombre: string = 'Erika';
  num: number = 0;
  color: string = '#4576f4';
  tamano: string = '24px';
}
