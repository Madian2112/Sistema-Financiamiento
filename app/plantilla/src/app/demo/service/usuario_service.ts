import { Injectable } from '@angular/core';
import {Usuario, Fill, FillPerfilUsuario} from '../models/UsuarioViewModel'
import {Rol} from '../models/RolViewModel'
import {Empleado} from '../models/EmpleadoViewModel'
import {HttpClient} from '@angular/common/http'
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';
import { Respuesta } from '../models/ServiceResult';


@Injectable({
  providedIn: 'root'
})
export class UsuarioServiceService {

  constructor(private http: HttpClient) { }
  private endpoint: string = environment.endPoint;
  private apiUrl: string = this.endpoint + "API/Usuario/";
  private apiUrlR: string = this.endpoint + "API/Role/";
  private apiUrlE: string = this.endpoint + "API/Empleado/";

  /* LOGIN USUARIO */
  getLogin(usuario: string, clave: string): Observable<Respuesta> {
    return this.http.get<Respuesta>(this.apiUrl + 'Login/'+usuario+","+clave);

  }

  /* LOGIN USUARIO */
  getUsuarios(): Observable<Usuario[]> {
    return this.http.get<Usuario[]>(this.apiUrl + 'List');
  }

  getRoles(): Observable<Rol[]> {
    return this.http.get<Rol[]>(this.apiUrlR + 'List');
  }

  getEmpleado(): Observable<Empleado[]> {
    return this.http.get<Empleado[]>(this.apiUrlE + 'List');
  }

  actualizar(idDepartamento:number,modelo:Usuario):Observable<Usuario>{
    return this.http.put<Usuario>(`${this.apiUrl}Edit/${idDepartamento}`,modelo);
  }

  agregar(modelo: Usuario): Observable<Usuario> {
    return this.http.post<Usuario>(`https://localhost:44372/API/Usuario/Create`, modelo);
  }

  getFill(codigo: number): Observable<Fill> {
    return this.http.get<Fill>(`${this.apiUrl}Details/${codigo}`);
  }

  eliminar(idDepartamento:number):Observable<void>{
    return this.http.delete<void>(`${this.apiUrl}Delete/${idDepartamento}`);
  }


  getFillPerfil(usuario: string): Observable<FillPerfilUsuario> {
    return this.http.get<FillPerfilUsuario>(`${this.apiUrl}PerfilDetails/${usuario}`);
  }
}
