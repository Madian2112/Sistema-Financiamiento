import { Component, OnInit } from '@angular/core';
import { ImpresionService } from 'src/app/demo/service/impresion.service';
import { SafeResourceUrl } from '@angular/platform-browser';
import { CommonModule } from '@angular/common';
import {DashboardService} from 'src/app/demo/service/dashboard.service';
import { Data } from '@angular/router';

@Component({
  selector: 'app-reportes',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './reportes.component.html',
  styleUrl: './reportes.component.scss'
})
export class ReportesComponent implements OnInit{
  pdfSrc: SafeResourceUrl | null = null;

  public ListData = [];
  // public encabezado = ["Año","Mes","Cantidad"]
  public cuerpo = [];
  constructor(private service: ImpresionService,  private dashboardService: DashboardService) { }
  ngOnInit(): void {
    
  }

  onImprimir() {
    const encabezado =  ["Año", "Mes", "Cantidad"];
        // const cuerpo = [
    //                 ["2024","9","3"],
    //                 ["2024","9","3"],
    //               ];
    

        this.dashboardService.obtenerPrestaPorMes().subscribe(
          data => {
              this.ListData = data 

              for(var k = 0; k < this.ListData.length; k++){
                this.cuerpo.push([
                  this.ListData[k].anio,
                  this.ListData[k].mes,
                  this.ListData[k].cantidadPrestamos
                ]);
              }
          },error =>{
            console.log("Error:" + error)
          }
      );
      console.log(this.cuerpo)

    
     if (this.pdfSrc !== null) {
     this.pdfSrc = null;
      } else {
        
        console.log(this.cuerpo)
       this.pdfSrc = this.service.imprimir(encabezado, this.cuerpo,"Cantidad Por Mes");
      }
  }
}
