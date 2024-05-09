import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class DashboardService {

  private endpoint: string = environment.endPoint;
  private apiUrl: string = this.endpoint + "API/PlanPagoCliente/";

  constructor(private http: HttpClient) { }





  obtenerPrestaPorMesFiltro(FechaInicio: string, FechaFinal: string, Sucu_Id: number): Observable<{ anio: string, mes: string, cantidadPrestamos: number }[]> {
    return this.http.get<{ anio: string, mes: string, cantidadPrestamos: number }[]>(`${this.apiUrl}ObtenerPrestaPorMesFiltro/${FechaInicio}/${FechaFinal}/${Sucu_Id}`);
  } 

  obtenerPrestaPorSexoFiltro(FechaInicio: string, FechaFinal: string, Sucu_Id: number): Observable<{ anio: string, mes: string, clie_Sexo: string, cantidadPrestamos: number }[]> {
    return this.http.get<{ anio: string, mes: string, clie_Sexo:string, cantidadPrestamos: number }[]>(`${this.apiUrl}ObtenerPrestaPorSexoFiltro/${FechaInicio}/${FechaFinal}/${Sucu_Id}`);
  } 

  obtenerPrestaPorModeloFiltro(FechaInicio: string, FechaFinal: string, Sucu_Id: number): Observable<{ anio: string, mes: string, mode_Descripcion: string, cantidadPrestamos: number }[]> {
    return this.http.get<{ anio: string, mes: string, mode_Descripcion:string, cantidadPrestamos: number }[]>(`${this.apiUrl}ObtenerPrestaPorModeloFiltro/${FechaInicio}/${FechaFinal}/${Sucu_Id}`);
  } 

  obtenerPrestaPorEstadoFiltro(FechaInicio: string, FechaFinal: string, Sucu_Id: number): Observable<{ anio: string, mes: string, esta_Descripcion: string, cantidadPrestamos: number }[]> {
    return this.http.get<{ anio: string, mes: string, esta_Descripcion:string, cantidadPrestamos: number }[]>(`${this.apiUrl}ObtenerPrestaPorEstadoCivilFiltro/${FechaInicio}/${FechaFinal}/${Sucu_Id}`);
  } 

  

  obtenerPrestaPorMes(): Observable<{ anio: string, mes: string, cantidadPrestamos: number }[]> {
    return this.http.get<{ anio: string, mes: string, cantidadPrestamos: number }[]>(`${this.apiUrl}ObtenerPrestaPorMes`);
  } 

  
  obtenerPrestaPorSexo(): Observable<{ anio: string, mes: string,clie_Sexo: string, cantidadPrestamos: number }[]> {
    return this.http.get<{ anio: string, mes: string, clie_Sexo:string, cantidadPrestamos: number }[]>(`${this.apiUrl}ObtenerPrestaPorSexo`);
  } 

  obtenerPrestaPorModelo(): Observable<{ anio: string, mes: string,mode_Descripcion: string, cantidadPrestamos: number }[]> {
    return this.http.get<{ anio: string, mes: string, mode_Descripcion:string, cantidadPrestamos: number }[]>(`${this.apiUrl}ObtenerPrestaPorModelo`);
  } 

  obtenerPrestaPorEstado(): Observable<{ anio: string, mes: string,esta_Descripcion: string, cantidadPrestamos: number }[]> {
    return this.http.get<{ anio: string, mes: string, esta_Descripcion:string, cantidadPrestamos: number }[]>(`${this.apiUrl}ObtenerPrestaPorEstadoCivil`);
  } 


}
