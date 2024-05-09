import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PlanpagoListadoComponent } from './planpago-listado.component';

describe('PlanpagoListadoComponent', () => {
  let component: PlanpagoListadoComponent;
  let fixture: ComponentFixture<PlanpagoListadoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [PlanpagoListadoComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(PlanpagoListadoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
