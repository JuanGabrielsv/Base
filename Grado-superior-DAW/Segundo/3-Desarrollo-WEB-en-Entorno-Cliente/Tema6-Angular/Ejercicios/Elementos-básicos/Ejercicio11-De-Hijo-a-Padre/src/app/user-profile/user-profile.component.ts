import { Component, EventEmitter, Output } from '@angular/core';

@Component({
  selector: 'app-user-profile',
  standalone: true,
  imports: [],
  templateUrl: './user-profile.component.html',
  styleUrl: './user-profile.component.css',
})
export class UserProfileComponent {
  name: string = 'Caracola';
  @Output()
  selected = new EventEmitter<string>();

  seleccionar() {
    this.selected.emit(this.name);
    console.log('Juangra');
  }
}
