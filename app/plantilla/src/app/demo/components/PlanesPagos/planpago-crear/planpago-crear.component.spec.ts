import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PlanpagoCrearComponent } from './planpago-crear.component';

describe('PlanpagoCrearComponent', () => {
  let component: PlanpagoCrearComponent;
  let fixture: ComponentFixture<PlanpagoCrearComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [PlanpagoCrearComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(PlanpagoCrearComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
