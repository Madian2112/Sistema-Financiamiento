import { Injectable } from '@angular/core';
import {Departamento,Prueba, Fill} from '../models/Departamentoviewmodel'
import {HttpClient} from '@angular/common/http'
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';


@Injectable({
  providedIn: 'root'
})
export class DepartamentoServiceService {

  private endpoint:string = environment.endPoint;
  private apiUrl:string  = this.endpoint + "API/Departamento/";
  constructor(private http: HttpClient) { }

  getDepartamento (){
    return this.http.get<Departamento[]>(`${this.apiUrl}List`);
  }

  agregar(modelo:Prueba):Observable<Prueba>{
    return this.http.post<Prueba>(`${this.apiUrl}Create`,modelo);
  }
    obtener(id:number){
    return this.http.get<Departamento>(`${this.apiUrl}Edit/${id}`);
  }

  actualizar(idDepartamento:number,modelo:Prueba):Observable<Prueba>{
    return this.http.put<Prueba>(`${this.apiUrl}Edit/${idDepartamento}`,modelo);
  }
  
  eliminar(idDepartamento:string):Observable<void>{
    return this.http.delete<void>(`${this.apiUrl}Delete/${idDepartamento}`);
  }

  getFill(codigo: string): Observable<Fill> {
    return this.http.get<Fill>(`${this.apiUrl}Details/${codigo}`);
  }
  
}
