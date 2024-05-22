import { Injectable } from '@angular/core';
import {PLanPago, Fill, PLanPagoCreate} from '../models/PlanPagoViewModel';
import {PagoClienteFechaPrevia} from '../models/PlanPagoClienteViewModel'
import {HttpClient} from '@angular/common/http'
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';
import {Vehiculo} from '../models/VehiculoViewModel'
import {TipoCuota} from '../models/TipoCuotaViewModel'
import {PLanPagoCliente, PLanPagoClientTB, PagoCliente} from '../models/PlanPagoClienteViewModel'
import { Respuesta } from '../models/ServiceResult';



@Injectable({
  providedIn: 'root'
})
export class PLanPagoServiceService {
  private endpoint: string = environment.endPoint;
  private apiUrl: string = this.endpoint + "API/PlanPago/";
  private apiUrlm: string = this.endpoint + "API/Marca/";

  constructor(private http: HttpClient) { }

  Url = 'http://dbcredirapid.somee.com/API/PlanPago/List';

  /*--PLANES DE PAGO CLIENTES*/
  getPlanPagoClienteFecha(codigo: string){
    return this.http.get<PagoClienteFechaPrevia[]>('https://localhost:44372/API/PlanPagoCliente/BuscarDNIFecha/'+ codigo);
  }

  getPlanPagoClienteDNI(codigo: string){
    return this.http.get<PagoClienteFechaPrevia[]>('https://localhost:44372/API/PlanPagoCliente/BuscarDNI/'+ codigo);
  }
  
  getPlanPagoPapaID(codigo: string){
    return this.http.get<PagoClienteFechaPrevia[]>('https://localhost:44372/API/PlanPagoCliente/BuscarPapaID/'+ codigo);
  }

  agregarPagoCliente(planpago: PagoCliente): Observable<PagoCliente> {
    return this.http.put<PagoCliente>('https://localhost:44372/API/PlanPagoCliente/PagarCuota/', planpago);

  }

  /*--PLANES DE PAGO CLIENTES*/

  getVehiculo (){
    return this.http.get<Vehiculo[]>(this.endpoint + 'API/Vehiculo/ListVC');
  }

  getValidarCliente(id: number): Observable<Respuesta> {
    return this.http.get<Respuesta>(this.endpoint + 'API/PlanPago/ValidarCliente/' + id);
  }

  getPlanpagoFiltrados(Usua_Usuario: string): Observable<PLanPago[]> {
    return this.http.get<PLanPago[]>(`${this.apiUrl}Listar/${Usua_Usuario}`);
  }

  getTipoCuota (){
    return this.http.get<TipoCuota[]>(this.endpoint+ 'API/TipoCuota/List');
  }

  getPLanPago (){
    return this.http.get<PLanPago[]>('http://dbcredirapid.somee.com/API/PlanPago/List');
  }

  getPLanPagoCliente(codigo:number){
    return this.http.get<PLanPagoClientTB[]>('https://localhost:44372/API/PlanPagoCliente/DetailsPP/'+codigo);
  }

  getFill(codigo: number): Observable<Fill> {
    return this.http.get<Fill>(`${this.apiUrl}Details/${codigo}`);
  }

  agregar(planpago: PLanPagoCreate): Observable<Respuesta> {
    return this.http.post<Respuesta>(`https://localhost:44372/API/PlanPago/Create`, planpago);

  }

  obtener(id:number){
    return this.http.get<PLanPago>(`${this.apiUrl}Edit/${id}`);
  }

  actualizar(idDepartamento:number,modelo:PLanPago):Observable<PLanPago>{
    return this.http.put<PLanPago>(`${this.apiUrl}Edit/${idDepartamento}`,modelo);
  }
  
  eliminar(idDepartamento:number):Observable<void>{
    return this.http.delete<void>(`${this.apiUrl}Delete/${idDepartamento}`);
  }

}
