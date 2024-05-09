import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MarcasListadoComponent } from './marcas-listado.component';

describe('MarcasListadoComponent', () => {
  let component: MarcasListadoComponent;
  let fixture: ComponentFixture<MarcasListadoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [MarcasListadoComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(MarcasListadoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
