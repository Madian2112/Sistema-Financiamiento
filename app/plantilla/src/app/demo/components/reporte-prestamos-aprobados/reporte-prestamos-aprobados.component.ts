import { ImpresionService } from 'src/app/demo/service/impresion.service';
import { SafeResourceUrl } from '@angular/platform-browser';
import { CommonModule } from '@angular/common';
import {DashboardService} from 'src/app/demo/service/dashboard.service';
import { Data } from '@angular/router';
import { Component, OnInit, NgModule,Inject } from '@angular/core';
import { Router } from '@angular/router';
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
import { AuthService } from 'src/app/demo/service/AuthService'; 
import { SliderModule } from 'primeng/slider';
import { RatingModule } from 'primeng/rating';
import { MatDialog } from '@angular/material/dialog';
import { MatButtonModule } from '@angular/material/button';
import { MessageService, SelectItem } from 'primeng/api';
import {SucursalServiceService} from 'src/app/demo/service/sucursal_service';
import {ReporteService} from 'src/app/demo/service/reporte.service';
import { FiltroPorMes, FiltroPorModelo, FiltroPorEstado, FiltroPorSexo } from 'src/app/demo/models/ReporteViewModel';
import { FormsModule } from '@angular/forms';
import { Sucursal } from '../../models/SucursalViewModel';
import { CalendarModule } from "primeng/calendar";

@Component({
  selector: 'app-reporte-prestamos-aprobados',
  templateUrl: './reporte-prestamos-aprobados.component.html',
  styleUrl: './reporte-prestamos-aprobados.component.scss'
})
export class ReportePrestamosAprobadosComponent implements OnInit{
  pdfSrc: SafeResourceUrl | null = null;
  FiltroMes: FiltroPorMes[] = [];
  FiltroPorModelo: FiltroPorModelo [] = [];
  FiltroPorEstado: FiltroPorEstado [] = [];
  FiltroPorSexo: FiltroPorSexo [] = [];
  fechaInicio: string = ""; 
  fechaFin: string = "";
  sucursales: Sucursal[];
  SucursalId: number;
  cities: SelectItem[] = [];
  selectedDrop: SelectItem = { value: '' };
  usuarioLogueado: string;
  public ListData = [];
  // public encabezado = ["Año","Mes","Cantidad"]
  public cuerpo = [];
  constructor(
    private service: ImpresionService, 
     private dashboardService: DashboardService,
     private sucursalService: SucursalServiceService,
     private reporteService: ReporteService,
     private authService: AuthService 
    ) { }
  ngOnInit(): void {
    const fechaActual = new Date();
    
    fechaActual.setMonth(fechaActual.getMonth() - 1);
    const fechaMesAnterior = fechaActual.toISOString().slice(0, 10);
    const fechaActualISO = new Date().toISOString().slice(0, 10);
    this.fechaInicio = fechaMesAnterior;
    this.fechaFin = fechaActualISO;
    
    this.sucursalService.getSucursal().subscribe(data => {
      this.sucursales = data;
      console.log(this.sucursales)
      this.usuarioLogueado = this.authService.getUsuarioLogueado(); 
    });

    
    this.cities = [
      { label: 'Mensual', value: "1" },
      { label: 'Modelo', value: "2" },
      { label: 'Estado Civil', value: "3" },
      { label: 'Sexo', value: "4" },
      // { label: 'Pari', value: { id: 5, name: 'Paris', code: 'PRS' } }
  ];


    this.ReportePorMes();
  }

   // cambia la fecha de inicio
   cambiarFechaInicio(event: any) {
    this.fechaInicio = event.target.value;
    this.ReportePorMes();
  }

  cambiarSucursal(event: any) {
    this.SucursalId = event.target.value;
    console.log(this.SucursalId);
    this.ReportePorMes(); 
  }
  
  
  // cambia la fecha de fin
  cambiarFechaFin(event: any) {
    this.fechaFin = event.target.value;
    console.log("Fecha fin:" + this.fechaFin)
    this.ReportePorMes();
  }


  ReportePorMes() {
  
    const FechaInicio = this.fechaInicio;
    const FechaFinal = this.fechaFin;
    const Sucu_Id = this.SucursalId; 

    console.log(Sucu_Id);
    
    this.reporteService.ReportePorMes(FechaInicio, FechaFinal, Sucu_Id).subscribe(
      (data: any) => {
        this.FiltroMes = data;
      },
      error => {
        console.log(error);
      }
    );

    this.reporteService.ReportePorModelo(FechaInicio, FechaFinal, Sucu_Id).subscribe(
      (data: any) => {
        this.FiltroPorModelo = data;
        console.log(this.FiltroPorModelo)
      },
      error => {
        console.log(error);
      }
    );

    this.reporteService.ReportePorSexo(FechaInicio, FechaFinal, Sucu_Id).subscribe(
      (data: any) => {
        this.FiltroPorSexo = data;
        console.log(this.FiltroPorSexo)
      },
      error => {
        console.log(error);
      }
    );

    this.reporteService.ReportePorEstado(FechaInicio, FechaFinal, Sucu_Id).subscribe(
      (data: any) => {
        this.FiltroPorEstado = data;
        console.log(this.FiltroPorEstado)
      },
      error => {
        console.log(error);
      }
    );
  }

    // convierte el numero de mes al nombre
    obtenerNombreMes(numeroMes: string): string {
      const meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
      return meses[parseInt(numeroMes) - 1];
    }

    onImprimir() {
      const encabezado = ["Año", "Mes", "Monto", "Pago Capital", "Pago interes", "Financiamiento", "Cliente", "Marca Vehiculo", "Modelo", "Sucursal"];
      const cuerpo = [];

  
      
      this.FiltroMes.forEach(filtro => {
          cuerpo.push([
              filtro.anio,
              this.obtenerNombreMes(filtro.mes),
              filtro.pacl_Monto_Pago,
              filtro.pacl_Pago_Capital,
              filtro.pacl_Pago_Intereses,
              filtro.papa_Financiamiento,
              filtro.cliente,
              filtro.marc_Descripcion,
              filtro.mode_Descripcion,
              filtro.sucursal
          ]);
      });
  
      // PDF con datosde la tabla
      this.pdfSrc = this.service.imprimir(encabezado, cuerpo, "Reporte de Prestamos Hechos en cada Mes",this.usuarioLogueado);
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
    FormsModule,
    MultiSelectModule,
    DropdownModule,
    ProgressBarModule,
    DialogModule,
    CalendarModule,
    ToastModule,
    SliderModule,
    RatingModule,
    MatButtonModule
  ],
  declarations: [
    ReportePrestamosAprobadosComponent
  ]
})
export class ReportesListadoModule { }