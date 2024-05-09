import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ReporteClientesMoraComponent } from './reporte-clientes-mora.component';

describe('ReporteClientesMoraComponent', () => {
  let component: ReporteClientesMoraComponent;
  let fixture: ComponentFixture<ReporteClientesMoraComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ReporteClientesMoraComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ReporteClientesMoraComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
