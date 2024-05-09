import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ReporteModelosVehiculosComponent } from './reporte-modelos-vehiculos.component';

describe('ReporteModelosVehiculosComponent', () => {
  let component: ReporteModelosVehiculosComponent;
  let fixture: ComponentFixture<ReporteModelosVehiculosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ReporteModelosVehiculosComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ReporteModelosVehiculosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
