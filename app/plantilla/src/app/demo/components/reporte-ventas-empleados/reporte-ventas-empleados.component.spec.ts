import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ReporteVentasEmpleadosComponent } from './reporte-ventas-empleados.component';

describe('ReporteVentasEmpleadosComponent', () => {
  let component: ReporteVentasEmpleadosComponent;
  let fixture: ComponentFixture<ReporteVentasEmpleadosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ReporteVentasEmpleadosComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ReporteVentasEmpleadosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
