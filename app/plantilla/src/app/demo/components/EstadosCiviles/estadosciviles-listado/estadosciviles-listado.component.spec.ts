import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EstadoscivilesListadoComponent } from './estadosciviles-listado.component';

describe('EstadoscivilesListadoComponent', () => {
  let component: EstadoscivilesListadoComponent;
  let fixture: ComponentFixture<EstadoscivilesListadoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [EstadoscivilesListadoComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(EstadoscivilesListadoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
