import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Modelo, Fill, ModeloCrear } from '../models/ModeloViewModel';
import { Marca } from '../models/MarcaViewModel';
import { Clienteddl } from '../models/ClienteViewModel';
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ModeloServiceService {

  private endpoint: string = environment.endPoint;
  private apiUrl: string = this.endpoint + "API/Modelo/";
  private apiUrlm: string = this.endpoint + "API/Marca/";
  private apiUrlc: string = this.endpoint + "API/Cliente/";

  constructor(private http: HttpClient) { }

  getModelo(): Observable<Modelo[]> {
    return this.http.get<Modelo[]>(this.apiUrl + 'List');
  }

  getMarcas(): Observable<Marca[]> {
    return this.http.get<Marca[]>(this.apiUrlm + 'List');
  }

  getClientes(): Observable<Clienteddl[]> {
    return this.http.get<Clienteddl[]>(this.apiUrlc + 'List');
  }

  agregar(modelo: ModeloCrear): Observable<ModeloCrear> {
    return this.http.post<ModeloCrear>(`${this.apiUrl}Create`, modelo);
  }

  obtener(id:number){
    return this.http.get<Modelo>(`${this.apiUrl}Edit/${id}`);
  }

  actualizar(idDepartamento:number,modelo:Modelo):Observable<Modelo>{
    return this.http.put<Modelo>(`${this.apiUrl}Edit/${idDepartamento}`,modelo);
  }
  
  eliminar(idDepartamento:number):Observable<void>{
    return this.http.delete<void>(`${this.apiUrl}Delete/${idDepartamento}`);
  }

  getFill(codigo: number): Observable<Fill> {
    return this.http.get<Fill>(`${this.apiUrl}Details/${codigo}`);
  }
}
