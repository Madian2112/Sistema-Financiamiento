import { Component,  OnInit, NgModule } from '@angular/core';
import { Router } from '@angular/router';
import { PLanPago, Fill } from '../../../models/PlanPagoViewModel';
import { PLanPagoClientTB } from '../../../models/PlanPagoClienteViewModel';
import { TipoCuota } from '../../../models/TipoCuotaViewModel';
import { Vehiculo } from '../../../models/VehiculoViewModel';
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


@Component({
  selector: 'app-planpago-listado',
  templateUrl: './planpago-listado.component.html',
  styleUrls: ['./planpago-listado.component.scss']
})
export class PlanpagoListadoComponent implements OnInit {
  display: boolean = false;
  planpago!: PLanPago[];
  planpagoclientes!: PLanPagoClientTB[];
  tipocuotas!: TipoCuota[];
  vehiculos: Vehiculo[];
  formPlanPago: FormGroup;
  listadoPlanPago: PLanPago[] = [];
  selectedDepartamento: any;
  modalTitle: string = 'Nuevo Registro';
  modalButtonLabel: string = 'Guardar';

  constructor(    private service:  PLanPagoServiceService, 
    private router: Router ,
    private fb:FormBuilder,
    private _PlanPagoservice:PLanPagoServiceService,
    private dialog: MatDialog, ) 
  {
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
        this.listadoPlanPago = data;
    },error => {
      console.log(error)
    }
  );
  
  }


  tabla: string = "";
  detalless: string = "collapse";
  edit: string = "collapse"

  papa_Id?: number = 0;
  papa_Financiamiento?:string = "";   
  papa_Intereses_Porcentaje?:string = "";  
  papa_Intereses_Monto?:string = ""; 
  papa_Numero_Cuota?: string = ""; 

  cliente?:string = "";  
  ticu_Descripcion?:string = "";  
  usua_Creacion?:string = "";   
  papa_Fecha_Creacion?:string ="";    
  usua_Modifica?:string ="";   
  papa_Fecha_Modificacion?:string = "";  

  detalles(codigo){
    this.tabla = "collapse";
    this.detalless = "";
    this.service.getFill(codigo).subscribe({
        next: (data: Fill) => {
          this.papa_Id = data.papa_Id;
          this.papa_Financiamiento = data.papa_Financiamiento;
          this.papa_Intereses_Porcentaje = data.papa_Intereses_Porcentaje;
          this.papa_Intereses_Monto = data.papa_Intereses_Monto;
          this.papa_Numero_Cuota = data.papa_Numero_Cuota;
          this.cliente = data.cliente;

          this.usua_Creacion = data.usua_Creacion;
          this.papa_Fecha_Creacion = data.papa_Fecha_Creacion;
          this.usua_Modifica = data.usua_Modifica;
          this.papa_Fecha_Modificacion = data.papa_Fecha_Modificacion;
        }
      });
  }

  volver(){
    this.tabla = "";
    this.detalless = "collapse";
  }

  Crear() {
    // Lógica de autenticación (por ejemplo, verificación de credenciales)
    console.log("se hizo click"); 
    this.router.navigate(['/app/CrearPlanPago']); // Ajusta la ruta según tu configuración de enrutamiento
}

getSucursal() {
  this.service.getPLanPago().subscribe(
    (data: any) => {
      this.planpago = data;
    },
    error => {
      console.log(error);
    }
  );
}

confirmacionVisible: boolean = false;
departamentoAEliminar: PLanPago | null = null;

confirmarEliminar(departamento: PLanPago) {
  this.departamentoAEliminar = departamento;
  this.confirmacionVisible = true;
}

eliminar() {
  if (this.departamentoAEliminar) {
    const idDepartamento = this.departamentoAEliminar.papa_Id;
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


editar(departamento: any) {
  this.selectedDepartamento = departamento;
  this.modalTitle = 'Editar Registro';
  this.modalButtonLabel = 'Actualizar';
  console.log(departamento);
  this.formPlanPago.patchValue({
    financiamiento:departamento.papa_Financiamiento,
    preciomercado: departamento.papa_Precio_Mercado,
    vehiculo: departamento.vecl_Id,
    tipocuota: departamento.ticu_Id,
    interesPorcentaje: departamento.pap_Intereses_Porcentaje,
    interesMonto: departamento.pap_Intereses_Monto,
    cuota: departamento.papa_Numero_Cuota,
    mora: "",
    number: 0,
    codigo: departamento.mode_Id,
    modelo: departamento.mode_Descripcion,
    marca: departamento.marc_Id
  });
  this.tabla = "collapse";
  this.detalless = "collapse";
  this.edit = "";
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
  const idDepartamento = this.selectedDepartamento.papa_Id;
  const modelo: PLanPago = {
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
    vecl_Id: this.formPlanPago.value.vehiculo 
  }
  this._PlanPagoservice.actualizar(idDepartamento, modelo).subscribe({
    next: (data) => {
      this.getSucursal();
      this.display = false;
   },
    error: (e) => {
      console.log(e);
    }
  })
}

  ngOnInit(): void {
    this.service.getPLanPago().subscribe(
      (data: any) => {
        console.log(data);
        this.planpago = data;
        console.log(this.planpago);
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
  declarations: [PlanpagoListadoComponent]
})
export class PlanesPagosistadoModule {}



