import { Injectable } from '@angular/core';
import {Empleado, Fill} from '../models/EmpleadoViewModel'
import {HttpClient} from '@angular/common/http'
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';
import {Departamento} from '../models/Departamentoviewmodel'
import {EstadoCivil} from '../models/EstadoCivilViewModel'
import {Cargo} from '../models/CargoViewModel'
import {dropMunicipio} from '../models/MunicipioViewModel'

@Injectable({
  providedIn: 'root'
})
export class EmpleadoServiceService {

  private endpoint: string = environment.endPoint;
  private apiUrl: string = this.endpoint + "API/Empleado/";
  constructor(private http: HttpClient) { }
  Url = 'http://dbcredirapid.somee.com/API/Empleado/List';

  getMunicipios(codigo){
    return this.http.get<dropMunicipio[]>(this.endpoint + 'API/Departamento/Municipios/' + codigo )
  }

  getDepartamento(): Observable<Departamento[]> {
    return this.http.get<Departamento[]>(this.endpoint + 'API/Departamento/' + 'List');
  }

  getEstados(): Observable<EstadoCivil[]> {
    return this.http.get<EstadoCivil[]>(this.endpoint + 'API/EstadosCivil/' + 'List');
  }

  getCargos(): Observable<Cargo[]> {
    return this.http.get<Cargo[]>(this.endpoint + 'API/Cargo/' + 'List');
  }

  getEmpleado (){
    return this.http.get<Empleado[]>(this.Url);
  }
  getFill(codigo: number): Observable<Fill> {
    return this.http.get<Fill>(`${this.apiUrl}Details/${codigo}`);
  }

  agregar(modelo: Empleado): Observable<Empleado> {
    return this.http.post<Empleado>(`${this.apiUrl}Create`, modelo);
  }

  obtener(id:number){
    return this.http.get<Empleado>(`${this.apiUrl}Edit/${id}`);
  }

  actualizar(idDepartamento:number,modelo:Empleado):Observable<Empleado>{
    return this.http.put<Empleado>(`${this.apiUrl}Edit/${idDepartamento}`,modelo);
  }


  eliminar(idDepartamento:number):Observable<void>{
    return this.http.delete<void>(`${this.apiUrl}Delete/${idDepartamento}`);
  }

}