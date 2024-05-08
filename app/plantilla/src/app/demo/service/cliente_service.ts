import { Injectable } from '@angular/core';
import {Cliente, Fill} from '../models/ClienteViewModel'
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
export class ClienteServiceService {

  private endpoint: string = environment.endPoint;
  private apiUrl: string = this.endpoint + "API/Cliente/";
  constructor(private http: HttpClient) { }
  Url = 'https://localhost:44372/API/Cliente/List';

  getMunicipios(codigo){
    return this.http.get<dropMunicipio[]>(this.endpoint + 'API/Departamento/Municipios/' + codigo )
  }

  getDepartamento(): Observable<Departamento[]> {
    return this.http.get<Departamento[]>(this.endpoint + 'API/Departamento/' + 'List');
  }

  getEstados(): Observable<EstadoCivil[]> {
    return this.http.get<EstadoCivil[]>(this.endpoint + 'API/EstadosCivil/' + 'List');
  }

  getCliente (){
    return this.http.get<Cliente[]>(this.Url);
  }
  
  getFill(codigo: number): Observable<Fill> {
    return this.http.get<Fill>(`${this.apiUrl}Details/${codigo}`);
  }

  agregar(modelo: Cliente): Observable<Cliente> {
    return this.http.post<Cliente>(`${this.apiUrl}Create`, modelo);
  }

  obtener(id:number){
    return this.http.get<Cliente>(`${this.apiUrl}Edit/${id}`);
  }

  actualizar(idDepartamento:number,modelo:Cliente):Observable<Cliente>{
    return this.http.put<Cliente>(`${this.apiUrl}Edit/${idDepartamento}`,modelo);
  }


  eliminar(idDepartamento:number):Observable<void>{
    return this.http.delete<void>(`${this.apiUrl}Delete/${idDepartamento}`);
  }
  
}
