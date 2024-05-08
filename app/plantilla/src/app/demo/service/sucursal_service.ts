import { Injectable } from '@angular/core';
import {Sucursal, Fill} from '../models/SucursalViewModel'
import {Departamento} from '../models/Departamentoviewmodel'
import {dropMunicipio} from '../models/MunicipioViewModel'
import {HttpClient} from '@angular/common/http'
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class SucursalServiceService {
  private endpoint: string = environment.endPoint;
  private apiUrl: string = this.endpoint + "API/Sucursal/";
  private apiUrlm: string = this.endpoint + "API/Departamento/";
  constructor(private http: HttpClient) { }
  Url = 'https://localhost:44372/API/Sucursal/List';

  getMunicipios(codigo){
    return this.http.get<dropMunicipio[]>(this.endpoint + 'API/Departamento/Municipios/' + codigo )
  }

  getDepartamento(): Observable<Departamento[]> {
    return this.http.get<Departamento[]>(this.apiUrlm + 'List');
  }

  getSucursal(){
    return this.http.get<Sucursal[]>(this.Url);
  }

  agregar(modelo: Sucursal): Observable<Sucursal> {
    return this.http.post<Sucursal>(`${this.apiUrl}Create`, modelo);
  }

  obtener(id:number){
    return this.http.get<Sucursal>(`${this.apiUrl}Edit/${id}`);
  }

  actualizar(idDepartamento:number,modelo:Sucursal):Observable<Sucursal>{
    return this.http.put<Sucursal>(`${this.apiUrl}Edit/${idDepartamento}`,modelo);
  }


  eliminar(idDepartamento:number):Observable<void>{
    return this.http.delete<void>(`${this.apiUrl}Delete/${idDepartamento}`);
  }

  getFill(codigo: number): Observable<Fill> {
    return this.http.get<Fill>(`${this.apiUrl}Details/${codigo}`);
  }

}
