import { Component, Input } from '@angular/core';
import { Persona } from '../app.component';
import { NgStyle } from '@angular/common';

@Component({
  selector: 'app-listado-personas',
  standalone: true,
  imports: [NgStyle],
  templateUrl: './listado-personas.component.html',
  styleUrl: './listado-personas.component.css',
})
export class ListadoPersonasComponent {
  @Input() persona!: Persona;
}
