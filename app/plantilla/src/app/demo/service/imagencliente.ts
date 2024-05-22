import { Injectable } from '@angular/core';
import {ImagenCliente, Fill, Vehiculo, Tabla} from '../models/ImagenClienteViewModel'
import {Departamento} from '../models/Departamentoviewmodel'
import {HttpClient} from '@angular/common/http'
import { Observable, map } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({
    providedIn: 'root'
  })
  export class ImagenClienteService {
  
    private endpoint: string = environment.endPoint;
    private apiUrl: string = this.endpoint + "API/ImagenCliente/";
    private apiUrlm: string = this.endpoint + "API/Vehiculo/";
  
    constructor(private http: HttpClient) { }
  
    getImagenCliente(): Observable<Tabla[]> {
      return this.http.get<Tabla[]>(this.apiUrl + 'List');
    }

    EnviarImagen(file : any): Observable<any>{
        return this.http.post<ImagenCliente[]>('https://localhost:44372/API/ImagenCliente/Subir', file).pipe(
          map(response => {
            return response;
          }),
        );
      }
  
    getVehiculo(): Observable<Vehiculo[]> {
      return this.http.get<Vehiculo[]>('https://localhost:44372/API/ImagenCliente/ListadoVehiculos');
    }
  
    agregar(modelo: ImagenCliente): Observable<ImagenCliente> {
      return this.http.post<ImagenCliente>(`https://localhost:44372/API/ImagenCliente/Create`, modelo);
    }
  
    obtener(id:number){
      return this.http.get<ImagenCliente>(`${this.apiUrl}Edit/${id}`);
    }
  
    actualizar(idDepartamento:number,modelo:ImagenCliente):Observable<ImagenCliente>{
      return this.http.put<ImagenCliente>(`${this.apiUrl}Edit/${idDepartamento}`,modelo);
    }
    
    eliminar(idDepartamento:string):Observable<void>{
      return this.http.delete<void>(`${this.apiUrl}Delete/${idDepartamento}`);
    }
  
    getFill(codigo: string): Observable<Fill> {
      return this.http.get<Fill>(`${this.apiUrl}Details/${codigo}`);
    }
  }