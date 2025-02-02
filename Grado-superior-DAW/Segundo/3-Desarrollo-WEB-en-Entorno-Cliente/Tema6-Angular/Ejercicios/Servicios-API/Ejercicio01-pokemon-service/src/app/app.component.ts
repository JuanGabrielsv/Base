import { Component, OnInit } from '@angular/core';
import { PokemonServiceService } from './services/pokemon-service.service';
import { Observable } from 'rxjs';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent implements OnInit {
  pokemonList = new Observable<any>();

  constructor(private servicioPokemon: PokemonServiceService) {}

  ngOnInit(): void {
    this.pokemonList = this.servicioPokemon.getListaPokemon();
    throw new Error('Method not implemented');
  }
}
