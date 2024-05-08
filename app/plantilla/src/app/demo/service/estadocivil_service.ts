import { Injectable } from '@angular/core';
import {EstadoCivil, Fill} from '../models/EstadoCivilViewModel'
import {HttpClient} from '@angular/common/http'
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class EstadoCivilServiceService {

  private endpoint: string = environment.endPoint;
  private apiUrl: string = this.endpoint + "API/EstadosCivil/";
  private apiUrlm: string = this.endpoint + "API/Modelo/";

  constructor(private http: HttpClient) { }

  getEstadoCivil(): Observable<EstadoCivil[]> {
    return this.http.get<EstadoCivil[]>(this.apiUrl + 'List');
  }

  agregar(modelo: EstadoCivil): Observable<EstadoCivil> {
    return this.http.post<EstadoCivil>(`${this.apiUrl}Create`, modelo);
  }

  obtener(id:number){
    return this.http.get<EstadoCivil>(`${this.apiUrl}Edit/${id}`);
  }

  actualizar(idDepartamento:number,modelo:EstadoCivil):Observable<EstadoCivil>{
    return this.http.put<EstadoCivil>(`${this.apiUrl}Edit/${idDepartamento}`,modelo);
  }
  
  eliminar(idDepartamento:number):Observable<void>{
    return this.http.delete<void>(`${this.apiUrl}Delete/${idDepartamento}`);
  }

  getFill(codigo: number): Observable<Fill> {
    return this.http.get<Fill>(`${this.apiUrl}Details/${codigo}`);
  }
}
