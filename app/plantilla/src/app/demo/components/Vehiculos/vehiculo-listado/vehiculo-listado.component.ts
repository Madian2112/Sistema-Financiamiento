import { Component, OnInit, NgModule } from '@angular/core';
import { Router } from '@angular/router';
import { Modelo } from '../../../models/ModeloViewModel';
import { Vehiculo, Fill } from '../../../models/VehiculoViewModel';
import { VehiculoServiceService } from '../../../service/vehiculo_service';
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
  selector: 'app-vehiculo-listado',
  templateUrl: './vehiculo-listado.component.html',
  styleUrls: ['./vehiculo-listado.component.scss']
})
export class VehiculoListadoComponent implements OnInit {

  display: boolean = false;
  vehiculo!: Vehiculo[];
  modelos: Modelo[];
  formVehiculo: FormGroup;
  listadoVehiculo: Vehiculo[] = [];
  selectedDepartamento: any;
  modalTitle: string = 'Nuevo Registro';
  modalButtonLabel: string = 'Guardar';
  municipios: any[] = [];
  MunicipioCodigo: String = "";

  Crear() {
    // Lógica de autenticación (por ejemplo, verificación de credenciales)
    console.log("se hizo click");
    // Si la autenticación es exitosa, redirige al usuario a la página de dashboard
    this.router.navigate(['/app/CrearVehiculo']); // Ajusta la ruta según tu configuración de enrutamiento
}

  constructor(
    private service:  VehiculoServiceService, 
    private router: Router ,
    private fb:FormBuilder,
    private _vehiculoservice:VehiculoServiceService,
    private dialog: MatDialog,
  ) {

    this.formVehiculo = this.fb.group({
      descripcion:[""],
      Color:[""],
      Aniooo:[""],
      placa:[""],
      modelooo:["Seleccione"] 
     
    })
    this._vehiculoservice.getVehiculo().subscribe(
      (data : any) =>{
        this.listadoVehiculo = data;
    },error => {
      console.log(error)
    }
  );
}

  tabla: string = "";
  detalless: string = "collapse";
  edit: string = "collapse";

vehi_Id?: number = 0;
vehi_Placa?:string = "";  
vehi_Color?:string = "";
vehi_Anio?:number = 0;
mode_Descripcion?:string ="";
marc_Descripcion?:string ="";
usua_Creacion?:string = "";   
vehi_Fecha_Creacion?:string ="";    
usua_Modifica?:string ="";   
vehi_Fecha_Modifica?:string = "";  

detalles(codigo){
  this.tabla = "collapse";
  this.detalless = "";
  this.service.getFill(codigo).subscribe({
      next: (data: Fill) => {
        this.vehi_Id = data.vehi_Id;
        this.vehi_Placa = data.vehi_Placa;
        this.vehi_Color = data.vehi_Color;
        this.vehi_Anio = data.vehi_Anio;
        this.mode_Descripcion = data.mode_Descripcion;
        this.marc_Descripcion = data.marc_Descripcion;
        this.usua_Creacion = data.usua_Creacion;
        this.vehi_Fecha_Creacion = data.vehi_Fecha_Creacion;
        this.usua_Modifica = data.usua_Modifica;
        this.vehi_Fecha_Modifica = data.vehi_Fecha_Modifica;
      }
    });
}

volver(){
  this.tabla = "";
  this.detalless = "collapse";
}


getSucursal() {
  this.service.getVehiculo().subscribe(
    (data: any) => {
      this.vehiculo = data;
    },
    error => {
      console.log(error);
    }
  );
}

editar(departamento: any) {
  this.selectedDepartamento = departamento;
  console.log(this.selectedDepartamento);
  // Usar el nombre del departamento en lugar del código
  this.formVehiculo = this.fb.group({

    descripcion:[departamento.vehi_Descripcion],
    Color:[departamento.vehi_Color],
    Aniooo:[departamento.vehi_Anio],
    placa:[departamento.vehi_Placa],
    modelooo:[departamento.mode_Id] 
  });

  this.tabla = "collapse";
  this.detalless = "collapse";
  this.edit = "";
  this.modalTitle = 'Editar Registro';
  this.modalButtonLabel = 'Actualizar';
  this.display = true;
}

Regresar() {
  // Lógica de autenticación (por ejemplo, verificación de credenciales)
  console.log("se hizo click");
  this.tabla = "";
  this.detalless = "collapse";
  this.edit = "collapse";
   // Ajusta la ruta según tu configuración de enrutamiento
}

actualizar() {
  const idDepartamento = this.selectedDepartamento.vehi_Id;
  const modelo: Vehiculo = {
    cliente: "",
    marc_Descripcion: "", 
    mode_Descripcion: "", 
    mode_Id: this.formVehiculo.value.modelooo, 
    vehi_Anio: this.formVehiculo.value.Aniooo, 
    vehi_Color: this.formVehiculo.value.Color, 
    vehi_Descripcion: this.formVehiculo.value.descripcion, 
    vehi_Id: idDepartamento,
    vehi_Placa: this.formVehiculo.value.placa
  }
  console.log(modelo);
  console.log(idDepartamento);
  this.formVehiculo = this.fb.group({
    descripcion:[""],
    Color:[""],
    Aniooo:[""],
    placa:[""],
    modelooo:["Seleccione"] 
   
  })
  this._vehiculoservice.actualizar(idDepartamento, modelo).subscribe({
    next: (data) => {
      this.getSucursal();
      this.display = false;
    },
    error: (e) => {
      console.log(e);
    }
  })
}

confirmacionVisible: boolean = false;
departamentoAEliminar: Vehiculo | null = null;


confirmarEliminar(departamento: Vehiculo) {
  this.departamentoAEliminar = departamento;
  this.confirmacionVisible = true;
}

eliminar() {
  if (this.departamentoAEliminar) {
    const idDepartamento = this.departamentoAEliminar.vehi_Id;
    this.service.eliminar(idDepartamento).subscribe({
      next: (data) => {
        this.getSucursal();
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

  openDialog() {
    this.dialog.open(DialogAddEditComponent);
  }

  NuevoModelo(){
    console.log(this.formVehiculo.value)
    const vehiculo : Vehiculo = {
      vehi_Id : this.formVehiculo.value.placa,
      vehi_Placa : this.formVehiculo.value.placa,
      vehi_Descripcion : this.formVehiculo.value.descripcion,
      vehi_Color : this.formVehiculo.value.color,
      vehi_Anio : this.formVehiculo.value.anio,
      mode_Id : this.formVehiculo.value.modelo,
      mode_Descripcion : this.formVehiculo.value.modelo,
      marc_Descripcion : this.formVehiculo.value.marca,
      cliente: "",
    }

    this._vehiculoservice.agregar(vehiculo).subscribe({
      next:(data)=>{
        this.service.getVehiculo().subscribe(
          (data: any) => {
            console.log(data);
            this.vehiculo = data;
            console.log(this.vehiculo);
             this.display = false;
        
          },
           error => {
            console.log(error);
          }
        );
   
      },error:(e)=>{}
    })
  }



  ngOnInit(): void {
    this.service.getVehiculo().subscribe(
      (data: any) => {
        console.log(data);
        this.vehiculo = data;
        console.log(this.vehiculo);
      },
       error => {
        console.log(error);
      }
    );

    this.service.getModelos().subscribe(data => {
      this.modelos = data;
    });

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
  declarations: [VehiculoListadoComponent]
})
export class VehiculosListadoModule {}
