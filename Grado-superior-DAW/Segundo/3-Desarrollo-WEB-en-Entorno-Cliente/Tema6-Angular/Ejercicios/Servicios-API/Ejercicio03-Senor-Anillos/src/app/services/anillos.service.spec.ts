import { TestBed } from '@angular/core/testing';

import { AnillosService } from './anillos.service';

describe('AnillosService', () => {
  let service: AnillosService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(AnillosService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
