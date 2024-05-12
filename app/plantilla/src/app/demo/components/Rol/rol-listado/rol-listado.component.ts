import { Component, OnInit, NgModule,Inject } from '@angular/core';
import { Router } from '@angular/router';
import { Rol } from '../../../models/RolViewModel';
import { RolService } from '../../../service/rol.service';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { InputTextModule } from 'primeng/inputtext';
import { DialogModule } from 'primeng/dialog';
import { ToggleButtonModule } from 'primeng/togglebutton';
import { RippleModule } from 'primeng/ripple';
import { MultiSelectModule } from 'primeng/multiselect';
import { DropdownModule } from 'primeng/dropdown';
import { ProgressBarModule } from 'primeng/progressbar';
import { ToastModule } from 'primeng/toast';
import { SliderModule } from 'primeng/slider';
import { RatingModule } from 'primeng/rating';
import { MatDialog } from '@angular/material/dialog';
import { MatButtonModule } from '@angular/material/button';
import { MessageService } from 'primeng/api';
import { SplitButtonModule } from 'primeng/splitbutton';

@Component({
  selector: 'app-rol-listado',
  templateUrl: './rol-listado.component.html',
  styleUrl: './rol-listado.component.scss',
  providers: [MessageService]
})
export class RolListadoComponent implements OnInit{
  rol: Rol[] = [];
  constructor(
    private service: RolService,
    private router: Router,

  ) {
  }
ngOnInit(): void {
  this.getRoles();
}

  Nuevo(){
    this.router.navigate(['app/CreateRol'])
  }
  Editar(){
    this.router.navigate(['app/EditarRol'])
  }
getRoles() {
  this.service.getRol().subscribe(
    (data: any) => {
      this.rol = data;
    },
    error => {
      console.log(error);
    }
  );
}
}


@NgModule({
  imports: [
    CommonModule,
    ReactiveFormsModule,
    TableModule,
    ButtonModule,
    InputTextModule,
    ToggleButtonModule,
    RippleModule,
    SplitButtonModule,
    MultiSelectModule,
    DropdownModule,
    ProgressBarModule,
    DialogModule,
    ToastModule,
    SliderModule,
    RatingModule,
    MatButtonModule
  ],
  declarations: [
    RolListadoComponent
  ]
})
export class RolListadoModule { }
