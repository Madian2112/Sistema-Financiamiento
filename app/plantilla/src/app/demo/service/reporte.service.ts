import { Injectable } from '@angular/core';
import {FiltroPorMes} from '../models/ReporteViewModel'
import {HttpClient} from '@angular/common/http'
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ReporteService {

 
  private endpoint: string = environment.endPoint;
  private apiUrl: string = this.endpoint + "API/PlanPagoCliente/";

  constructor(private http: HttpClient) { }

  ReportePorMes(FechaInicio: string, FechaFinal: string, Sucu_Id: number): Observable<{ anio: string, mes: string, cantidadPrestamos: number }[]> {
    return this.http.get<{ anio: string, mes: string, cantidadPrestamos: number }[]>(`${this.apiUrl}ReportePorMes/${FechaInicio}/${FechaFinal}/${Sucu_Id}`);
  } 

  ReportePorModelo(FechaInicio: string, FechaFinal: string, Sucu_Id: number): Observable<{ anio: string, mes: string, cantidadPrestamos: number }[]> {
    return this.http.get<{ anio: string, mes: string, cantidadPrestamos: number }[]>(`${this.apiUrl}ReportePorModelo/${FechaInicio}/${FechaFinal}/${Sucu_Id}`);
  } 
  ReportePorEstado(FechaInicio: string, FechaFinal: string, Sucu_Id: number): Observable<{ anio: string, mes: string, cantidadPrestamos: number }[]> {
    return this.http.get<{ anio: string, mes: string, cantidadPrestamos: number }[]>(`${this.apiUrl}ReportePorEmpleado/${FechaInicio}/${FechaFinal}/${Sucu_Id}`);
  } 
  ReportePorSexo(FechaInicio: string, FechaFinal: string, Sucu_Id: number): Observable<{ anio: string, mes: string, cantidadPrestamos: number }[]> {
    return this.http.get<{ anio: string, mes: string, cantidadPrestamos: number }[]>(`${this.apiUrl}ReporteClientePorMora/${FechaInicio}/${FechaFinal}/${Sucu_Id}`);
  } 
}
