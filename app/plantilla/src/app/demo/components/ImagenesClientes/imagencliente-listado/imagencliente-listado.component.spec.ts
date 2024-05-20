import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ImagenclienteListadoComponent } from './imagencliente-listado.component';

describe('ImagenclienteListadoComponent', () => {
  let component: ImagenclienteListadoComponent;
  let fixture: ComponentFixture<ImagenclienteListadoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ImagenclienteListadoComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ImagenclienteListadoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
