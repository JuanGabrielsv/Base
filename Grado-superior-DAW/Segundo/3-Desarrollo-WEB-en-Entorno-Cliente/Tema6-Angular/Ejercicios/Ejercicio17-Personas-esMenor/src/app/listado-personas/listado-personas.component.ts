import { Component, EventEmitter, Input, Output } from '@angular/core';
import { Persona } from '../app.component';
import { NgStyle } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-listado-personas',
  standalone: true,
  imports: [NgStyle, FormsModule],
  templateUrl: './listado-personas.component.html',
  styleUrl: './listado-personas.component.css',
})
export class ListadoPersonasComponent {
  @Input() persona!: Persona;
  @Output() selected = new EventEmitter<Persona>();
  personaSenalada: Persona = this.persona;

  esMenor(): Boolean {
    return this.persona.edad < 18;
  }

  personaSeleccionada(persona: Persona) {
    this.selected.emit(this.personaSenalada);
  }
}
