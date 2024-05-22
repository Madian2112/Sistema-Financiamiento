import { Component, OnInit, NgModule } from '@angular/core';
import { Router } from '@angular/router';
import { Modelo } from '../../../models/ModeloViewModel';
import { Clienteddl } from '../../../models/ClienteViewModel';
import { Vehiculo } from '../../../models/VehiculoViewModel';
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
  selector: 'app-vehiculo-crear',
  templateUrl: './vehiculo-crear.component.html',
  styleUrls: ['./vehiculo-crear.component.scss']
})

export class VehiculoCrearComponent implements OnInit {

  display: boolean = false;
  vehiculo!: Vehiculo[];
  clientes: Clienteddl[];
  modelos: Modelo[];
  formVehiculo: FormGroup;
  listadoVehiculo: Vehiculo[] = [];

  constructor(
    private service:  VehiculoServiceService, 
    private router: Router ,
    private fb:FormBuilder,
    private _vehiculoservice:VehiculoServiceService,
    private dialog: MatDialog,
  ) {

    this.formVehiculo = this.fb.group({
      descripcion:["",Validators.required],
      Color:["",Validators.required],
      Aniooo:[""],
      placa:["",Validators.required],
      modelooo:["Seleccione"]     ,
      clienteeee:["Seleccione"] 
    })

    this._vehiculoservice.getVehiculo().subscribe(
      (data : any) =>{
        this.listadoVehiculo = data;
    },error => {
      console.log(error)
    }
  );
}

  openDialog() {
    this.dialog.open(DialogAddEditComponent);
  }

  Regresar() {
    // Lógica de autenticación (por ejemplo, verificación de credenciales)
    console.log("se hizo click");
    // Si la autenticación es exitosa, redirige al usuario a la página de dashboard
    this.router.navigate(['/app/vehiculo']); // Ajusta la ruta según tu configuración de enrutamiento

    this.formVehiculo = this.fb.group({
      descripcion:[""],
      Color:[""],
      Aniooo:[""],
      placa:[""],
      modelooo:["Seleccione"],
     
    })

  }

  NuevoVehiculo(){
    console.log(this.formVehiculo.value)
    const vehiculo : Vehiculo = {
      vehi_Id : 0,
      vehi_Placa : this.formVehiculo.value.placa,
      vehi_Descripcion : this.formVehiculo.value.descripcion,
      vehi_Color : this.formVehiculo.value.Color,
      vehi_Anio : this.formVehiculo.value.Aniooo,
      mode_Id : this.formVehiculo.value.modelooo,
      mode_Descripcion : this.formVehiculo.value.modelooo,
      marc_Descripcion : this.formVehiculo.value.marca,
      vecl_Id : 0,
      cliente: "",
      clie_Id: this.formVehiculo.value.clienteeee
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

    this.formVehiculo = this.fb.group({
      descripcion:[""],
      Color:[""],
      Aniooo:[""],
      placa:[""],
      modelooo:["Seleccione"],
      clienteeee: ["Seleccione"]
     
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

    this.service.getClientes().subscribe(data => {
      this.clientes = data;
    })

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
  declarations: [VehiculoCrearComponent]
})
export class VehiculosCrearModule {}
