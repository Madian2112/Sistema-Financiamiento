import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ReportePrestamosAprobadosComponent } from './reporte-prestamos-aprobados.component';

describe('ReportePrestamosAprobadosComponent', () => {
  let component: ReportePrestamosAprobadosComponent;
  let fixture: ComponentFixture<ReportePrestamosAprobadosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ReportePrestamosAprobadosComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ReportePrestamosAprobadosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
