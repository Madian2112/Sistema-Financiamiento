import { Component, OnInit, NgModule } from '@angular/core';
import { Router } from '@angular/router';
import { PLanPago } from '../../../models/PlanPagoViewModel';
import { Vehiculo } from '../../../models/VehiculoViewModel';
import { TipoCuota } from '../../../models/TipoCuotaViewModel';
import { PLanPagoServiceService } from '../../../service/planplago_service';
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
import { PlanpagoListadoComponent } from '../planpago-listado/planpago-listado.component';

@Component({
  selector: 'app-planpago-crear',
  templateUrl: './planpago-crear.component.html',
  styleUrls: ['./planpago-crear.component.scss']
})
export class PlanpagoCrearComponent implements OnInit {

  displ: boolean= true;
  display: boolean = false;
  planpago!: PLanPago[];
  vehiculos!: Vehiculo[];
  tipocuotas!: TipoCuota[];
  formPlanPago: FormGroup;
  listadoPLanPago: PLanPago[] = [];

  constructor
  ( 
    private service:  PLanPagoServiceService, 
    private router: Router ,
    private fb:FormBuilder,
    private _PlanPagoservice:PLanPagoServiceService,
    private dialog: MatDialog,    
  ) {

    this.formPlanPago = this.fb.group({
      financiamiento:[""],
      preciomercado:[""],
      vehiculo:["Seleccione"],
      tipocuota:["Seleccione"],
      interesPorcentaje:[0],
      interesMonto:[""],
      cuota:[0],
      mora:[0],
      number:[0],
     
    })

    this._PlanPagoservice.getPLanPago().subscribe(
      (data : any) =>{
        this.listadoPLanPago = data;
    },error => {
      console.log(error)
    }
  );
  }

  Regresar() {
    // Lógica de autenticación (por ejemplo, verificación de credenciales)
    console.log("se hizo click");
    // Si la autenticación es exitosa, redirige al usuario a la página de dashboard
    this.router.navigate(['/app/IndexPlanPago']); // Ajusta la ruta según tu configuración de enrutamiento
}

Nuevo() {
  console.log(this.formPlanPago.value);
  console.log(this.formPlanPago.value.empleado +' ' + this.formPlanPago.value.rol);
    const planpago: PLanPago = {
      cliente: "",
      marc_Descripcion: "", 
      mode_Descripcion: "", 
      pap_Intereses_Monto: this.formPlanPago.value.interesMonto,
      pap_Intereses_Porcentaje: this.formPlanPago.value.interesPorcentaje,
      papa_Financiamiento: this.formPlanPago.value.financiamiento,
      papa_Id: 0,
      papa_Numero_Cuota: this.formPlanPago.value.cuota,
      papa_Precio_Mercado: this.formPlanPago.value.preciomercado,
      ticu_Descripcion: "",
      ticu_Id: this.formPlanPago.value.tipocuota,
      vecl_Id: this.formPlanPago.value.vehiculo,
        }
    // Llamar al servicio solo si los valores necesarios están definidos
    this._PlanPagoservice.agregar(planpago).subscribe({
      next: (data) => {
        this.service.getPLanPago().subscribe(
          (data: any) => {
            console.log(data);
            this.planpago = data;
            console.log(this.planpago);
            this.display = false;
          },
          error => {
            console.log(error);
          }
        );
      },
      error: (e) => {
        console.error(e);
      }
    })
    this.formPlanPago = this.fb.group({
      financiamiento:[""],
      preciomercado:[""],
      vehiculo:["Seleccione"],
      tipocuota:["Seleccione"],
      interesPorcentaje:[0],
      interesMonto:[""],
      cuota:[0],
      mora:[0],
      number:[0],
     
    })
  };

  ngOnInit(): void {

    this.service.getTipoCuota().subscribe(data => {
      this.tipocuotas = data;
    });
  
    this.service.getVehiculo().subscribe(data => {
      this.vehiculos = data;
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
  declarations: [PlanpagoCrearComponent]
})
export class PLanPagosListadoModule {}

