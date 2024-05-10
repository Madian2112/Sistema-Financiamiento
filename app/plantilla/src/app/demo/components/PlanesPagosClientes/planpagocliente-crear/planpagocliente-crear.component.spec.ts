import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PlanpagoclienteCrearComponent } from './planpagocliente-crear.component';

describe('PlanpagoclienteCrearComponent', () => {
  let component: PlanpagoclienteCrearComponent;
  let fixture: ComponentFixture<PlanpagoclienteCrearComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [PlanpagoclienteCrearComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(PlanpagoclienteCrearComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
