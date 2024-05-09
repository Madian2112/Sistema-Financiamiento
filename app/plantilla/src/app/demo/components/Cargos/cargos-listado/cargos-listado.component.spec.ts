import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CargosListadoComponent } from './cargos-listado.component';

describe('CargosListadoComponent', () => {
  let component: CargosListadoComponent;
  let fixture: ComponentFixture<CargosListadoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CargosListadoComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(CargosListadoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
