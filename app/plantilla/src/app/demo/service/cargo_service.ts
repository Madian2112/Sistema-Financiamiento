import { Injectable } from '@angular/core';
import {Cargo, Fill} from '../models/CargoViewModel'
import {HttpClient} from '@angular/common/http'
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';



@Injectable({
  providedIn: 'root'
})
export class CargoerviceService {

  private endpoint: string = environment.endPoint;
  private apiUrl: string = this.endpoint + "API/Cargo/";

  constructor(private http: HttpClient) { }

  getCargo(): Observable<Cargo[]> {
    return this.http.get<Cargo[]>(this.apiUrl + 'List');
  }

  agregar(modelo: Cargo): Observable<Cargo> {
    return this.http.post<Cargo>(`${this.apiUrl}Create`, modelo);
  }

    obtener(id:number){
    return this.http.get<Cargo>(`${this.apiUrl}Edit/${id}`);
  }

  actualizar(idDepartamento:number,modelo:Cargo):Observable<Cargo>{
    return this.http.put<Cargo>(`${this.apiUrl}Edit/${idDepartamento}`,modelo);
  }
  
  eliminar(idDepartamento:number):Observable<void>{
    return this.http.delete<void>(`${this.apiUrl}Delete/${idDepartamento}`);
  }

  getFill(codigo: number): Observable<Fill> {
    return this.http.get<Fill>(`${this.apiUrl}Details/${codigo}`);
  }

}
