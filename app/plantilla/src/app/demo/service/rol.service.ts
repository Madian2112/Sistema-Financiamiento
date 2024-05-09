import { Injectable } from '@angular/core';
import {Rol} from '../models/RolViewModel'
import {HttpClient} from '@angular/common/http'
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Pantallas } from '../models/PantallaViewMode';
import { Respuesta } from '../models/ServiceResult';

@Injectable({
  providedIn: 'root'
})
export class RolService {
  private endpoint:string = environment.endPoint;
  private apiUrl:string  = this.endpoint + "API/Role/";
  constructor(private http: HttpClient) { }

  getRol (){
    return this.http.get<Rol[]>(`${this.apiUrl}List`);
  }

  getPantallas(): Observable<Pantallas[]> {
    return this.http.get<Pantallas[]>(`${this.apiUrl}ListPantallas`);
  }

  agregar(modelo: Rol): Observable<Respuesta> {
    return this.http.post<Respuesta>(`${this.apiUrl}Create`, modelo);
  }
  agregarPantallaARol(pantid: number, rolId: number, Usua_Id: number): Observable<Respuesta> {
    return this.http.get<Respuesta>(`${this.apiUrl}Agregarpant/${pantid}/${rolId}/${Usua_Id}`);
  }

  eliminarPantallaARol(Pant_Id: number, Rol_Id: number): Observable<Respuesta> {
    return this.http.delete<Respuesta>(`${this.apiUrl}DeletePanRol/${Pant_Id}/${Rol_Id}`);
  }
  
    obtener(id:number){
    return this.http.get<Rol>(`${this.apiUrl}Edit/${id}`);
  }

  actualizar(idDepartamento:number,modelo:Rol):Observable<Rol>{
    return this.http.put<Rol>(`${this.apiUrl}Edit/${idDepartamento}`,modelo);
  }
  
  eliminar(idDepartamento:string):Observable<void>{
    return this.http.delete<void>(`${this.apiUrl}Delete/${idDepartamento}`);
  }
}
