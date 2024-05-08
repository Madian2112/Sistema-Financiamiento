import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MunicipiosListadoComponent } from './municipios-listado.component';

describe('MunicipiosListadoComponent', () => {
  let component: MunicipiosListadoComponent;
  let fixture: ComponentFixture<MunicipiosListadoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [MunicipiosListadoComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(MunicipiosListadoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
