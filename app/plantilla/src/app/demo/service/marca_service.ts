import { Injectable } from '@angular/core';
import {Marca, Fill} from '../models/MarcaViewModel'
import {HttpClient} from '@angular/common/http'
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class MarcaServiceService {

  private endpoint: string = environment.endPoint;
  private apiUrl: string = this.endpoint + "API/Marca/";
  private apiUrlm: string = this.endpoint + "API/Modelo/";

  constructor(private http: HttpClient) { }

  getMarca(): Observable<Marca[]> {
    return this.http.get<Marca[]>(this.apiUrl + 'List');
  }

  agregarMarca(modelo: Marca): Observable<Marca> {
    return this.http.post<Marca>('http://dbcredirapid.somee.com/API/Marca/Create', modelo);
  }

  obtener(id:number){
    return this.http.get<Marca>(`${this.apiUrl}Edit/${id}`);
  }

  actualizar(idDepartamento:number,modelo:Marca):Observable<Marca>{
    return this.http.put<Marca>(`${this.apiUrl}Edit/${idDepartamento}`,modelo);
  }
  
  eliminar(idDepartamento:number):Observable<void>{
    return this.http.delete<void>(`${this.apiUrl}Delete/${idDepartamento}`);
  }

  getFill(codigo: number): Observable<Fill> {
    return this.http.get<Fill>(`${this.apiUrl}Details/${codigo}`);
  }

}
