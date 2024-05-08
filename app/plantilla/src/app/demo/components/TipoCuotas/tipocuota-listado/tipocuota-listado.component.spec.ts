import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TipocuotaListadoComponent } from './tipocuota-listado.component';

describe('TipocuotaListadoComponent', () => {
  let component: TipocuotaListadoComponent;
  let fixture: ComponentFixture<TipocuotaListadoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [TipocuotaListadoComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(TipocuotaListadoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
