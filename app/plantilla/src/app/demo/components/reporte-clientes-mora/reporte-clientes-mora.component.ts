import { Component, OnInit, NgModule,Inject  } from '@angular/core';
import { SafeResourceUrl } from '@angular/platform-browser';
import { ImpresionService } from 'src/app/demo/service/impresion.service';
import { DashboardService } from 'src/app/demo/service/dashboard.service';
import { SucursalServiceService } from 'src/app/demo/service/sucursal_service';
import { ReporteService } from 'src/app/demo/service/reporte.service';
import { AuthService } from 'src/app/demo/service/AuthService'; // Importa el servicio de autenticación
import { FiltroPorMes, FiltroPorModelo, FiltroPorEstado, FiltroPorSexo } from 'src/app/demo/models/ReporteViewModel';
import { Sucursal } from '../../models/SucursalViewModel';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { RatingModule } from 'primeng/rating';
import { CommonModule } from '@angular/common';
import { Data } from '@angular/router';
import { Router } from '@angular/router';
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
import { MatDialog } from '@angular/material/dialog';
import { MatButtonModule } from '@angular/material/button';
import { MessageService, SelectItem } from 'primeng/api';
import { CalendarModule } from "primeng/calendar";


@Component({
    selector: 'app-reporte-clientes-mora',
    templateUrl: './reporte-clientes-mora.component.html',
    styleUrls: ['./reporte-clientes-mora.component.scss']
})
export class ReporteClientesMoraComponent implements OnInit {
    pdfSrc: SafeResourceUrl | null = null;
    FiltroMes: FiltroPorMes[] = [];
    FiltroPorModelo: FiltroPorModelo[] = [];
    FiltroPorEstado: FiltroPorEstado[] = [];
    FiltroPorSexo: FiltroPorSexo[] = [];
    fechaInicio: string = ""; 
    fechaFin: string = "";
    sucursales: Sucursal[];
    SucursalId: number;
    cities: SelectItem[] = [];
    selectedDrop: SelectItem = { value: '' };
    usuarioLogueado: string; // Variable para almacenar el nombre del usuario logueado

    public ListData = [];
    public cuerpo = [];

    constructor(
        private service: ImpresionService, 
        private dashboardService: DashboardService,
        private sucursalService: SucursalServiceService,
        private reporteService: ReporteService,
        private authService: AuthService // Inyecta el servicio de autenticación
    ) {}

    ngOnInit(): void {
        const fechaActual = new Date();
        fechaActual.setMonth(fechaActual.getMonth() - 1);
        const fechaMesAnterior = fechaActual.toISOString().slice(0, 10);
        const fechaActualISO = new Date().toISOString().slice(0, 10);
        this.fechaInicio = fechaMesAnterior;
        this.fechaFin = fechaActualISO;
        this.usuarioLogueado = this.authService.getUsuarioLogueado(); // Obtén el nombre del usuario logueado

        this.sucursalService.getSucursal().subscribe(data => {
            this.sucursales = data;
            console.log(this.sucursales);
        });

        this.cities = [
            { label: 'Mensual', value: "1" },
            { label: 'Modelo', value: "2" },
            { label: 'Ventas Empleados', value: "3" },
            { label: 'Clientes en Mora', value: "4" },
        ];

        this.ReportePorMes();
    }

    cambiarFechaInicio(event: any) {
        this.fechaInicio = event.target.value;
        this.ReportePorMes();
    }

    cambiarSucursal(event: any) {
        this.SucursalId = event.target.value;
        this.ReportePorMes();
    }

    cambiarFechaFin(event: any) {
        this.fechaFin = event.target.value;
        this.ReportePorMes();
    }

    ReportePorMes() {
        const FechaInicio = this.fechaInicio;
        const FechaFinal = this.fechaFin;
        const Sucu_Id = this.SucursalId;

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
                console.log(this.FiltroPorModelo);
            },
            error => {
                console.log(error);
            }
        );

        this.reporteService.ReportePorSexo(FechaInicio, FechaFinal, Sucu_Id).subscribe(
            (data: any) => {
                this.FiltroPorSexo = data;
                console.log(this.FiltroPorSexo);
            },
            error => {
                console.log(error);
            }
        );

        this.reporteService.ReportePorEstado(FechaInicio, FechaFinal, Sucu_Id).subscribe(
            (data: any) => {
                this.FiltroPorEstado = data;
                console.log(this.FiltroPorEstado);
            },
            error => {
                console.log(error);
            }
        );
    }

    obtenerNombreMes(numeroMes: string): string {
        const meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
        return meses[parseInt(numeroMes) - 1];
    }

    onImprimir() {
        const encabezado = ["Año", "Mes", "Cliente", "Mora", "Marca Vehículo", "Modelo", "Sucursal"];
        const cuerpo = [];

        this.FiltroPorModelo.forEach(filtro => {
            cuerpo.push([
                filtro.anio,
                this.obtenerNombreMes(filtro.mes),
                filtro.cliente,
                filtro.pacl_Pago_Mora,
                filtro.marc_Descripcion,
                filtro.mode_Descripcion,
                filtro.sucursal
            ]);
        });

        // PDF con datos de la tabla
        this.pdfSrc = this.service.imprimir(encabezado, cuerpo, "Reporte de Ventas de Empleados", this.usuarioLogueado);
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
    ReporteClientesMoraComponent
  ]
})
export class ReportesListadoModule { }

