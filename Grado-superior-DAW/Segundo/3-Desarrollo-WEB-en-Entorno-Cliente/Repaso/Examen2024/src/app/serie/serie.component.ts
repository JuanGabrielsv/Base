import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { Serie } from '../model/serie';
import { ServiceService } from '../service/service.service';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-serie',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './serie.component.html',
  styleUrl: './serie.component.css',
})
export class SerieComponent implements OnInit {
  ngOnInit(): void {
    this.serie = this.serieService.getSerie();
  }

  serie = new Observable<Serie>();

  constructor(private serieService: ServiceService) {}
}
