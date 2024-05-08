import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ModeloListadoComponent } from './modelo-listado.component';

describe('ModeloListadoComponent', () => {
  let component: ModeloListadoComponent;
  let fixture: ComponentFixture<ModeloListadoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ModeloListadoComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ModeloListadoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
