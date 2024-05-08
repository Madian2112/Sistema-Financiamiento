import { Injectable } from '@angular/core';
import {PLanPago, Fill, PLanPagoCreate} from '../models/PlanPagoViewModel'
import {HttpClient} from '@angular/common/http'
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';
import {Vehiculo} from '../models/VehiculoViewModel'
import {TipoCuota} from '../models/TipoCuotaViewModel'
import {PLanPagoCliente, PLanPagoClientTB} from '../models/PlanPagoClienteViewModel'
import { Respuesta } from '../models/ServiceResult';


@Injectable({
  providedIn: 'root'
})
export class PLanPagoServiceService {
  private endpoint: string = environment.endPoint;
  private apiUrl: string = this.endpoint + "API/PlanPago/";
  private apiUrlm: string = this.endpoint + "API/Marca/";

  constructor(private http: HttpClient) { }

  Url = 'https://localhost:44372/API/PlanPago/List';

  getVehiculo (){
    return this.http.get<Vehiculo[]>(this.endpoint + 'API/Vehiculo/ListVC');
  }

  getTipoCuota (){
    return this.http.get<TipoCuota[]>(this.endpoint+ 'API/TipoCuota/List');
  }

  getPLanPago (){
    return this.http.get<PLanPago[]>('https://localhost:44372/API/PlanPago/List');
  }

  getPLanPagoCliente(codigo:number){
    return this.http.get<PLanPagoClientTB[]>('https://localhost:44372/API/PlanPagoCliente/DetailsPP/'+codigo);
  }

  getFill(codigo: number): Observable<Fill> {
    return this.http.get<Fill>(`${this.apiUrl}Details/${codigo}`);
  }

  agregar(planpago: PLanPagoCreate): Observable<Respuesta> {
    return this.http.post<Respuesta>(`${this.apiUrl}Create`, planpago);
  }

  obtener(id:number){
    return this.http.get<PLanPago>(`${this.apiUrl}Edit/${id}`);
  }

  actualizar(idDepartamento:number,modelo:PLanPago):Observable<PLanPago>{
    return this.http.put<PLanPago>(`${this.apiUrl}Edit/${idDepartamento}`,modelo);
  }
  
  eliminar(idDepartamento:number):Observable<void>{
    return this.http.delete<void>(`${this.apiUrl}Delete/${idDepartamento}`);
  }

}
