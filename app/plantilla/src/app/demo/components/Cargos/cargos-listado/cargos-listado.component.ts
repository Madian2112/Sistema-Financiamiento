import { Component, OnInit, NgModule  } from '@angular/core';
import { Router } from '@angular/router';
import { Cargo,Fill } from '../../../models/CargoViewModel';
import { CargoerviceService } from '../../../service/cargo_service';
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
import { MessageService } from 'primeng/api';
import {DialogAddEditComponent} from 'src/app/demo/Dialogs/dialog-add-edit/dialog-add-edit.component';
import { MatDialog} from '@angular/material/dialog';
import {MatButtonModule} from '@angular/material/button';


@Component({
  selector: 'app-cargos-listado',
  templateUrl: './cargos-listado.component.html',
  styleUrls: ['./cargos-listado.component.scss']
})
export class CargosListadoComponent implements OnInit {
  cargo!: Cargo[];
  display: boolean = false;
  formCargo: FormGroup;
  listadoCargo: Cargo[] = [];
  cargos: Cargo = {carg_Descripcion: "gfdgf", carg_Id:0};
  selectedDepartamento: Cargo;
  modalTitle: string = 'Nuevo Registro';
  modalButtonLabel: string = 'Guardar';
  confirmacionVisible: boolean = false;
  departamentoAEliminar: Cargo | null = null;

  constructor(
    private service: CargoerviceService,
    private router: Router,
    private fb:FormBuilder,
    private _cargoServicio:CargoerviceService,
    private dialog: MatDialog,
  ) {

    this.formCargo = this.fb.group({
      cargo:["",Validators.required],
     
    })
    this._cargoServicio.getCargo().subscribe(
      (data : any) =>{
        this.listadoCargo = data;
    },error => {
      console.log(error)
    }
  );
  }

  tabla: string = "";
  detalless: string = "collapse";

  carg_Id?: number = 0;
  carg_Descripcion?:string = "";   
  usua_Creacion?:string = "";   
  carg_Fecha_Creacion?:string ="";    
  usua_Modifica?:string ="";   
  carg_Fecha_Modifica?:string = "";  

  detalles(codigo){
    this.tabla = "collapse";
    this.detalless = "";
    this.service.getFill(codigo).subscribe({
        next: (data: Fill) => {
          this.carg_Id = data.carg_Id;
          this.carg_Descripcion = data.carg_Descripcion;
          this.usua_Creacion = data.usua_Creacion;
          this.carg_Fecha_Creacion = data.carg_Fecha_Creacion;
          this.usua_Modifica = data.usua_Modifica;
          this.carg_Fecha_Modifica = data.carg_Fecha_Modifica;
        }
      });
  }

  volver(){
    this.tabla = "";
    this.detalless = "collapse";
  }

  openDialog() {
    this.dialog.open(DialogAddEditComponent);
  }

  confirmarEliminarDepartamento(departamento: Cargo) {
    this.departamentoAEliminar = departamento;
    this.confirmacionVisible = true;
  }
  
  detalle(obeto:Cargo){
    this.router.navigate(['/departamento',obeto.carg_Id])
  }
  
  eliminarDepartamento() {
    if (this.departamentoAEliminar) {
      const idDepartamento = this.departamentoAEliminar.carg_Id;
      this.service.eliminar(idDepartamento).subscribe({
        next: (data) => {
          this.getCargo();
          this.confirmacionVisible = false;
        },
        error: (e) => {
          console.log(e);
        }
      });
    }
  }
  cancelarEliminar() {
    this.confirmacionVisible = false;
  }

  getCargo(){
    this.service.getCargo().subscribe(
      (data: any) => {
        console.log(data);
        this.cargo = data;
        console.log(this.cargo);
      },
       error => {
        console.log(error);
      }
    );
  }

  displayNuevoDepartamento() {
    this.formCargo.reset();
    this.modalTitle = 'Nuevo Registro';
    this.modalButtonLabel = 'Guardar';
    this.display = true;
  }

  editDepartamento(cargo: any) {
    this.selectedDepartamento = cargo;
    this.modalTitle = 'Editar Registro';
    this.modalButtonLabel = 'Actualizar';
    this.formCargo.patchValue({
      codigo: cargo.carg_Id,
      cargo: cargo.carg_Descripcion
    });
    this.display = true;
  }

  guardarDepartamento() {
    if (this.formCargo.invalid) {
      return;
    }
    if (this.modalTitle === 'Nuevo Registro') {
      this.NuevoDepartamento();
    } else {
      this.actualizarDepartamento();
    }
  }

NuevoDepartamento(){
  console.log(this.formCargo.value)
  const modelo : Cargo = {
    carg_Id : this.formCargo.value.codigo,
    carg_Descripcion : this.formCargo.value.cargo
  }
  this._cargoServicio.agregar(modelo).subscribe({
    next:(data)=>{
      this.service.getCargo().subscribe(
        (data: any) => {
          console.log(data);
          this.cargo = data;
          console.log(this.cargo);
           this.display = false;
      
        },
         error => {
          console.log(error);
        }
      );
 
    },error:(e)=>{}
  })
}

actualizarDepartamento() {
  const idDepartamento = this.selectedDepartamento.carg_Id;
  const modelo: Cargo = {
    carg_Id: this.formCargo.value.codigo,
    carg_Descripcion: this.formCargo.value.cargo
  }
  this.service.actualizar(idDepartamento, modelo).subscribe({
    next: (data) => {
      this.getCargo();
      this.display = false;
    },
    error: (e) => {
      console.log(e);
    }
  })
}

  ngOnInit(): void {
    this.service.getCargo().subscribe(
      (data: any) => {
        console.log(data);
        this.cargo = data;
        console.log(this.cargo);
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
    MultiSelectModule,
    DropdownModule,
    ProgressBarModule,
    DialogModule,
    ToastModule,
    SliderModule,
    RatingModule,
      MatButtonModule,
      DialogAddEditComponent
  ],
  declarations: [CargosListadoComponent]
})
export class CargosListadoModule {}


