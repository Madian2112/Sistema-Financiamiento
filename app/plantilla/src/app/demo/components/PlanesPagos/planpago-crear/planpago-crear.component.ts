import { Component, OnInit, NgModule } from '@angular/core';
import { Router } from '@angular/router';

import { PLanPago, PLanPagoCreate, Fill } from '../../../models/PlanPagoViewModel';
import { PLanPagoCliente, PLanPagoClientTB } from '../../../models/PlanPagoClienteViewModel';
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
import { Respuesta } from 'src/app/demo/models/ServiceResult';
import { SafeResourceUrl } from '@angular/platform-browser';
import { ImpresionService } from 'src/app/demo/service/impresion.service';
import { AuthService } from 'src/app/demo/service/authGuard.service'; 
@Component({
  selector: 'app-planpago-crear',
  templateUrl: './planpago-crear.component.html',
  styleUrls: ['./planpago-crear.component.scss']
})
export class PlanpagoCrearComponent implements OnInit {

  displ: boolean= true;
  display: boolean = false;
  planpago!: PLanPago[];

  planpagoclientes!: PLanPagoClientTB[];
  prueba: PLanPagoClientTB[];

  vehiculos!: Vehiculo[];
  tipocuotas!: TipoCuota[];
  formPlanPago: FormGroup;
  listadoPLanPago: PLanPago[] = [];
  pdfSrc: SafeResourceUrl | null = null;
  usuarioLogueado: string;

  usuarioLogueado: string;
  create: string = "";
  detalle : string ="collapse";
  idplanpag: number = 0;
  sabermsj: string = "";
  ValidarCliente: string = "collapse";
  pdfview: string = "collapse";
  pdf: string = "collapse";


  constructor
  ( 
    private service:  PLanPagoServiceService, 
    private router: Router ,
    private fb:FormBuilder,
    private _PlanPagoservice:PLanPagoServiceService,
    private dialog: MatDialog,    
    private serviceIMprimir: ImpresionService, 
    private authService: AuthService 
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

RegresarPDF(){
  this.pdf = "collapse";
}


PDF(){

  this.usuarioLogueado = this.authService.getUsuarioLogueado(); 
  const encabezado = ["Pago", "Fecha de Pago" , "Saldo Inicial", "Pago", "Capital", "Interés", "Saldo"];
  const cuerpo = [];
  this.pdf = "";

  
  this.planpagoclientes.forEach(cliente => {
      cuerpo.push([
          cliente.pacl_NumeroCuota,
          cliente.pacl_Fecha_Pago,
          cliente.pacl_Saldo_Inicial,
          cliente.pacl_Total_Pago,
          cliente.pacl_Capital_Restar,
          cliente.pacl_Intereses_Restar,   
          cliente.pacl_Saldo,       
        ]);
  });

  // PDF con datosde la tabla
  this.pdfSrc = this.serviceIMprimir.imprimir(encabezado, cuerpo, "Reporte Plan de Pago", this.usuarioLogueado);
}


papa_Id?: number = 0;
papa_Financiamiento?:string = "";   
papa_Intereses_Porcentaje?:string = "";  
papa_Intereses_Monto?:string = "";  
cliente?:string = "";  
ticu_Descripcion?:string = "";  
usua_Creacion?:string = "";   
papa_Fecha_Creacion?:string ="";    
usua_Modifica?:string ="";   
papa_Fecha_Modificacion?:string = "";  
mora: string = "";
marca: string = "";
modelo: string = "";
cuotas: string = "";

Nuevo() {

    this._PlanPagoservice.getValidarCliente(this.formPlanPago.get('vehiculo').value).subscribe(
    (respuesta: Respuesta) => {
      console.log(this.formPlanPago.get('vehiculo').value)
        console.log(respuesta.success)
        console.log(respuesta.data)
        console.log(respuesta.message)
        console.log(respuesta.code)
        
        console.log(respuesta.messageStatus)
        this.sabermsj = respuesta.messageStatus;
        
        if(this.sabermsj == "exito")
          {
            this.ValidarCliente = "collapse";
            this.detalle = "";
            this.create = "collapse";
            console.log("El mensaje es: "+ this.sabermsj)
            const planpago: PLanPagoCreate = { 
              papa_Financiamiento: this.formPlanPago.value.financiamiento, 
              papa_Id: 0, 
              papa_Numero_Cuota: this.formPlanPago.value.cuota, 
              papa_Precio_Mercado: this.formPlanPago.value.preciomercado, 
              vecl_Id: this.formPlanPago.value.vehiculo, 
                }
                this._PlanPagoservice.agregar(planpago).subscribe(
                  (respuesta: Respuesta) => {
                      console.log(respuesta.success)
                      console.log(respuesta.data)
                      console.log(respuesta.data.codeStatus)
                      console.log(respuesta.message)
                      console.log(respuesta.code)
                      this.idplanpag = respuesta.data.codeStatus;
        
                      this.service.getPLanPagoCliente(respuesta.data.codeStatus).subscribe(data => {
                        this.planpagoclientes = data;
                        console.log("Los datos som: "+ data)
                      });

                      this.pdfview = "";
        
                      this.service.getFill(respuesta.data.codeStatus).subscribe({
                        next: (data: Fill) => {
                          this.papa_Id = data.papa_Id;
                          this.papa_Financiamiento = data.papa_Financiamiento;
                          this.papa_Intereses_Porcentaje = data.papa_Intereses_Porcentaje;
                          this.papa_Intereses_Monto = data.papa_Intereses_Monto;
                          this.mora = data.papa_Mora;
                          this.cuotas = data.papa_Numero_Cuota;
                          this.marca = data.marc_Descripcion; 
                          this.modelo = data.mode_Descripcion;
                          this.cliente = data.cliente;
                          this.usua_Creacion = data.usua_Creacion;
                          this.papa_Fecha_Creacion = data.papa_Fecha_Creacion;
                          this.usua_Modifica = data.usua_Modifica;
                          this.papa_Fecha_Modificacion = data.papa_Fecha_Modificacion;
                        }
                      });
        
                      if (respuesta.success) {
                          const mensaje = respuesta.message;
                           
                      } else {
                          console.error('Error en la respuesta:', respuesta);
                    
                      }
                  },
                  error => {
                      console.error('Error al crear el rol:', error);
                 
                  }
              );
        
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
            this.sabermsj =  "";
          }
    
          else if(this.sabermsj == "error")
          {
            this.ValidarCliente = "";
          }
    },
    error => {
        console.error('Error al crear el rol:', error);
   
    });
  };



    pacl_Id?: number = 0;
    pacl_Monto_Pago?: number = 0;
    pacl_Pago_Capital?: number =0;
    pacl_Pago_Intereses?: number = 0;  
    pacl_Pago_Mora?: number = 0; 
    pacl_Fecha_Emision?: string =""; 


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

