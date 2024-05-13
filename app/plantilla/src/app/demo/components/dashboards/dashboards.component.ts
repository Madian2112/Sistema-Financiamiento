import { DashboardService } from 'src/app/demo/service/dashboard.service';
import { Chart, registerables } from 'chart.js';
import { FormsModule } from '@angular/forms';
import { MessageService } from 'primeng/api';
import { ChartData, ChartOptions } from 'chart.js'; 
import { ChartModule } from 'primeng/chart';
import { Component, OnInit, NgModule,Inject } from '@angular/core';
import { Router } from '@angular/router';
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
import { DataViewModule } from 'primeng/dataview';
import { PickListModule } from 'primeng/picklist';
import { OrderListModule } from 'primeng/orderlist';
import { Product } from 'src/app/demo/api/product';
import { ProductService } from 'src/app/demo/service/product.service';
import { SelectItem } from 'primeng/api';
import { Sucursal } from '../../models/SucursalViewModel';
import {SucursalServiceService} from 'src/app/demo/service/sucursal_service';

Chart.register(...registerables);

@Component({
  selector: 'app-dashboards',
  templateUrl: './dashboards.component.html',
  styleUrls: ['./dashboards.component.scss'],
  providers: [MessageService] 
})
export class DashboardsComponent implements OnInit {
  fechaInicio: string;
  fechaFin: string;

  MyChart: Chart;
  MyChartSexo: Chart;
  MyChartModelo: Chart;
  MyChartEstado: Chart;

  chartDataEstado: ChartData;
  chartOptionsEstado: ChartOptions;
  sucursales: Sucursal[];
  SucursalId: number;
  chartDataModelo: ChartData;
  chartOptionsModelo: ChartOptions;

  cantidadPrestamos: number = 0;

  constructor(
    private dashboardService: DashboardService,
    private messageService: MessageService ,
    private sucursalService: SucursalServiceService
  ) { }
  ngOnInit(): void {
    const fechaActual = new Date();
    
    fechaActual.setMonth(fechaActual.getMonth() - 1);
    const fechaMesAnterior = fechaActual.toISOString().slice(0, 10);
    const fechaActualISO = new Date().toISOString().slice(0, 10);
    this.fechaInicio = fechaMesAnterior;
    this.fechaFin = fechaActualISO;
    
    console.log("Fechas" + this.fechaInicio + this.fechaFin)
    this.filtrarCompras();
    this.sucursalService.getSucursal().subscribe(data => {
      this.sucursales = data;
      console.log(this.sucursales)
    });
  }
  
  filtrarCompras() {
    const fechaInicio = new Date(this.fechaInicio);
    const fechaFin = new Date(this.fechaFin);
    const Sucu_Id = this.SucursalId; 
    if (fechaInicio <= fechaFin) {
      const fechasEnRango: string[] = [];
      
      let fechaActual = new Date(fechaInicio);
      while (fechaActual <= fechaFin) {
        fechasEnRango.push(fechaActual.toISOString().slice(0, 7));
        fechaActual.setMonth(fechaActual.getMonth() + 1);

      }

      

     
 
      this.dashboardService.obtenerPrestaPorMesFiltro(this.fechaInicio, this.fechaFin,Sucu_Id).subscribe(
        data => {
          this.renderizarGrafico(data);
        },
        error => {
          console.error('Error al obtener datos de préstamos:', error);
          this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Error al obtener datos de la API.' });
        }
      );

      this.dashboardService.obtenerPrestaPorSexoFiltro(this.fechaInicio, this.fechaFin,Sucu_Id).subscribe(
        data => {
          this.renderizarGraficoSexo(data);
        },
        error => {
          console.error('Error al obtener datos de préstamos:', error);
          this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Error al obtener datos de la API.' });
        }
      );

      this.dashboardService.obtenerPrestaPorModeloFiltro(this.fechaInicio, this.fechaFin,Sucu_Id).subscribe(
        data => {
          this.renderizarGraficoModelo(data);
        },
        error => {
          console.error('Error al obtener datos de préstamos:', error);
          this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Error al obtener datos de la API.' });
        }
      );

      this.dashboardService.obtenerPrestaPorEstadoFiltro(this.fechaInicio, this.fechaFin,Sucu_Id).subscribe(
        data => {
          this.renderizarGraficoEstado(data);
        },
        error => {
          console.error('Error al obtener datos de préstamos:', error);
          this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Error al obtener datos de la API.' });
        }
      );
    } else {
      this.messageService.add({ severity: 'error', summary: 'Error', detail: 'La fecha de inicio debe ser anterior o igual a la fecha de fin.' });
    }
  }


  renderizarGrafico(compras: { anio: string, mes: string, cantidadPrestamos: number }[]) {
    const fechas = compras.map(compra => `${compra.anio}-${compra.mes}`);
    const cantidades = compras.map(compra => compra.cantidadPrestamos);

     
        this.cantidadPrestamos = cantidades.reduce((total, cantidad) => total + cantidad, 0);
        
    if (this.MyChart) {
      this.MyChart.destroy(); 
      
    }

    this.MyChart = new Chart("barChart", {
      type: 'bar',
      data: {
        labels: fechas,
        datasets: [{
          label: 'Prestamos',
          data: cantidades,
          backgroundColor: [
            'rgba(255, 193, 7, 0.6)', 
            'rgba(54, 162, 235, 0.6)',
            'rgba(255, 206, 86, 0.6)',
          
          ],
          borderColor: [
            'rgba(255, 193, 7, 1)', 
            'rgba(54, 162, 235, 1)', 
            'rgba(255, 206, 86, 1)', 
       
          ],
          borderWidth: 1,
          barPercentage: 0.4
        }]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true,
            title: {
              display: true,
              text: 'Cantidad de Prestamos',
              color: 'white' 
            },
            ticks: {
              color: 'white' 
            }
          },
          x: {
            title: {
              display: true,
              text: 'Fecha',
              color: 'white' 
            },
            ticks: {
              color: 'white'
            }
          }
        },
        plugins: {
          legend: {
            display: false,
            labels: {
              color: 'white' 
            }
          }
        },
        layout: {
          padding: {
            left: 10,
            right: 10,
            top: 10,
            bottom: 10
          }
        },
        responsive: true,
       
      }
    });
  }
  
  renderizarGraficoSexo(compras: { anio: string, mes: string, clie_Sexo: string, cantidadPrestamos: number }[]) {
 
    const comprasFemenino = compras.filter(compra => compra.clie_Sexo === 'Femenino');
    const comprasMasculino = compras.filter(compra => compra.clie_Sexo === 'Masculino');


    const cantidadFemenino = comprasFemenino.reduce((total, compra) => total + compra.cantidadPrestamos, 0);
    const cantidadMasculino = comprasMasculino.reduce((total, compra) => total + compra.cantidadPrestamos, 0);

   
    if (this.MyChartSexo) {
        this.MyChartSexo.destroy(); 
    }

    this.MyChartSexo = new Chart("barChartSexo", {
        type: 'bar',
        data: {
            labels: ['Femenino', 'Masculino'],
            datasets: [{
                label: 'Cantidad de Prestamos',
                data: [cantidadFemenino, cantidadMasculino],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.6)', 
                    'rgba(54, 162, 235, 0.6)',
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)', 
                ],
                borderWidth: 1,
                barPercentage: 0.4
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: 'Cantidad de Prestamos',
                        color: 'white' 
                    },
                    ticks: {
                        color: 'white' 
                    }
                },
                x: {
                    title: {
                        display: true,
                        text: 'Sexo',
                        color: 'white' 
                    },
                    ticks: {
                        color: 'white'
                    }
                }
            },
            plugins: {
                legend: {
                    display: false   
                }
            },
            layout: {
                padding: {
                    left: 10,
                    right: 10,
                    top: 10,
                    bottom: 10
                }
            },
            responsive: true,
        }
    });
}

renderizarGraficoModelo(compras: { anio: string, mes: string, mode_Descripcion: string, cantidadPrestamos: number }[]) {

  const labels = compras.map(compra => `${compra.mode_Descripcion}`);
  const data = compras.map(compra => compra.cantidadPrestamos);


  this.chartDataModelo = {
    labels: labels,
    datasets: [
      {
        data: data,
        backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0'],
        hoverBackgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0'] 
      }
    ]
  };

  this.chartOptionsModelo = {
    responsive: true,
    maintainAspectRatio: false,

  };
}

renderizarGraficoEstado(compras: { anio: string, mes: string, esta_Descripcion: string, cantidadPrestamos: number }[]) {

  const labels = compras.map(compra => ` ${compra.esta_Descripcion}`);
  const data = compras.map(compra => compra.cantidadPrestamos);

 
  this.chartDataEstado = {
    labels: labels,
    datasets: [
      {
        data: data,
        backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0'], 
        hoverBackgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0'] 
      }
    ]
  };

  this.chartOptionsEstado = {
    responsive: true,
    maintainAspectRatio: false,

  };
}





// cambiarFechaInicio(event: Event) {
//   this.fechaInicio = (event.target as HTMLInputElement).value;
//   this.filtrarCompras();
// }

// cambiarFechaFin(event: Event) {
//   this.fechaFin = (event.target as HTMLInputElement).value;
//   this.filtrarCompras();
// }

cambiarFechaInicio(event: Event) {
  this.fechaInicio = (event.target as HTMLInputElement).value;
  this.filtrarCompras();
}

cambiarFechaFin(event: Event) {
  this.fechaFin = (event.target as HTMLInputElement).value;
  this.filtrarCompras();
}

cambiarSucursal(event: any) {
  this.SucursalId = event.target.value;
  console.log(this.SucursalId);
  this.filtrarCompras();
}
}


@NgModule({
  imports: [
    OrderListModule,
    PickListModule,
    CommonModule,
    ReactiveFormsModule,
    TableModule,
    ButtonModule,
    InputTextModule,
    ToggleButtonModule,
    RippleModule,
    FormsModule,ChartModule,
    FormsModule,
    MultiSelectModule,
    DropdownModule,
    ProgressBarModule,
    DialogModule,
    ToastModule,
    SliderModule,
    RatingModule,
    MatButtonModule,
    DataViewModule
  ],
  declarations: [
    DashboardsComponent
  ]
})
export class DashboardsModule { }