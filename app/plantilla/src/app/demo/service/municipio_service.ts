import { Injectable } from '@angular/core';
import {Municipio, Fill} from '../models/MunicipioViewModel'
import {Departamento} from '../models/Departamentoviewmodel'
import {HttpClient} from '@angular/common/http'
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';


@Injectable({
  providedIn: 'root'
})
export class MunicipioServiceService {

  private endpoint: string = environment.endPoint;
  private apiUrl: string = this.endpoint + "API/Municipio/";
  private apiUrlm: string = this.endpoint + "API/Departamento/";

  constructor(private http: HttpClient) { }

  getMunicipio(): Observable<Municipio[]> {
    return this.http.get<Municipio[]>(this.apiUrl + 'List');
  }

  getDepartamento(): Observable<Departamento[]> {
    return this.http.get<Departamento[]>(this.apiUrlm + 'List');
  }

  agregar(modelo: Municipio): Observable<Municipio> {
    return this.http.post<Municipio>(`${this.apiUrl}Create`, modelo);
  }

  obtener(id:number){
    return this.http.get<Municipio>(`${this.apiUrl}Edit/${id}`);
  }

  actualizar(idDepartamento:number,modelo:Municipio):Observable<Municipio>{
    return this.http.put<Municipio>(`${this.apiUrl}Edit/${idDepartamento}`,modelo);
  }
  
  eliminar(idDepartamento:string):Observable<void>{
    return this.http.delete<void>(`${this.apiUrl}Delete/${idDepartamento}`);
  }

  getFill(codigo: string): Observable<Fill> {
    return this.http.get<Fill>(`${this.apiUrl}Details/${codigo}`);
  }
}
