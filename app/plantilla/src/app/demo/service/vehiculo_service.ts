import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import {Vehiculo, Fill} from '../models/VehiculoViewModel'
import {Modelo} from '../models/ModeloViewModel'
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';


@Injectable({
  providedIn: 'root'
})
export class VehiculoServiceService {
  private endpoint: string = environment.endPoint;
  private apiUrl: string = this.endpoint + "API/Vehiculo/";
  private apiUrlm: string = this.endpoint + "API/Modelo/";

  constructor(private http: HttpClient) { }

  getVehiculo(): Observable<Modelo[]> {
    return this.http.get<Modelo[]>(this.apiUrl + 'List');
  }

  getModelos(): Observable<Modelo[]> {
    return this.http.get<Modelo[]>(this.apiUrlm + 'List');
  }

  agregar(modelo: Vehiculo): Observable<Vehiculo> {
    return this.http.post<Vehiculo>(`${this.apiUrl}Create`, modelo);
  }

  actualizar(idDepartamento:number, modelo:Vehiculo):Observable<Vehiculo>{
    return this.http.put<Vehiculo>(`${this.apiUrl}Edit/${idDepartamento}`,modelo);
  }

  getFill(codigo: number): Observable<Fill> {
    return this.http.get<Fill>(`${this.apiUrl}Details/${codigo}`);
  }

  eliminar(idDepartamento:number):Observable<void>{
    return this.http.delete<void>(`${this.apiUrl}Delete/${idDepartamento}`);
  }
}
