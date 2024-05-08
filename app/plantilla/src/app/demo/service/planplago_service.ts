import { Injectable } from '@angular/core';
import {PLanPago, Fill} from '../models/PlanPagoViewModel'
import {HttpClient} from '@angular/common/http'
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';
import {Vehiculo} from '../models/VehiculoViewModel'
import {TipoCuota} from '../models/TipoCuotaViewModel'


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

  getFill(codigo: number): Observable<Fill> {
    return this.http.get<Fill>(`${this.apiUrl}Details/${codigo}`);
  }

  agregar(modelo: PLanPago): Observable<PLanPago> {
    return this.http.post<PLanPago>(`${this.apiUrl}Create`, modelo);
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
