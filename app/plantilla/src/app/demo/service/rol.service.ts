import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { Rol, Fill } from '../models/RolViewModel';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http: HttpClient) { }


  private baseUrl = environment.endPoint + 'API/Rol/';

  getRol(): Observable<Rol[]> {
    return this.http.get<Rol[]>(this.baseUrl + 'List');
  }

  EnviarRol(formData: any): Observable<any> {
    return this.http.post<any>(this.baseUrl + 'Create/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }

  getFill(codigo: string): Observable<Fill> {
    return this.http.get<Fill>(this.baseUrl + 'Fill/' + codigo);
  }

  getDetalles(codigo: string): Observable<Fill> {
    return this.http.get<Fill>(this.baseUrl + 'FillDetalles/' + codigo);
  }

  EliminarRol(ID: any): Observable<any> {
    return this.http.delete<any>(this.baseUrl + 'Delete/' + ID);
  }

  ActualizarRol(formData: any) {
    return this.http.put(this.baseUrl + 'Edit/', formData);
  }
}
