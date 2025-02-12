import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { UsuariosService } from '../services/usuarios.service';
import { Usuario } from '../model/usuario';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-listado-usuarios',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './listado-usuarios.component.html',
  styleUrl: './listado-usuarios.component.css',
})
export class ListadoUsuariosComponent implements OnInit {
  arrayUsuarios: Observable<Usuario[]> = new Observable<Usuario[]>();

  constructor(private servicoUsuarios: UsuariosService) {}

  ngOnInit(): void {
    this.arrayUsuarios = this.servicoUsuarios.obtenerUsuarios();
  }
}
