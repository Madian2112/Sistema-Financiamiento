import { Injectable } from '@angular/core';
import {TipoCuota, Fill} from '../models/TipoCuotaViewModel'
import {HttpClient} from '@angular/common/http'
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class TipoCuotaServiceService {

  private endpoint: string = environment.endPoint;
  private apiUrl: string = this.endpoint + "API/TipoCuota/";
  private apiUrlm: string = this.endpoint + "API/Modelo/";

  constructor(private http: HttpClient) { }

  getTipoCuota(): Observable<TipoCuota[]> {
    return this.http.get<TipoCuota[]>(this.apiUrl + 'List');
  }

  agregar(modelo: TipoCuota): Observable<TipoCuota> {
    return this.http.post<TipoCuota>(`${this.apiUrl}Create`, modelo);
  }

  obtener(id:number){
    return this.http.get<TipoCuota>(`${this.apiUrl}Edit/${id}`);
  }

  actualizar(idDepartamento:number,modelo:TipoCuota):Observable<TipoCuota>{
    return this.http.put<TipoCuota>(`${this.apiUrl}Edit/${idDepartamento}`,modelo);
  }
  
  eliminar(idDepartamento:number):Observable<void>{
    return this.http.delete<void>(`${this.apiUrl}Delete/${idDepartamento}`);
  }

  getFill(codigo: number): Observable<Fill> {
    return this.http.get<Fill>(`${this.apiUrl}Details/${codigo}`);
  }

}
