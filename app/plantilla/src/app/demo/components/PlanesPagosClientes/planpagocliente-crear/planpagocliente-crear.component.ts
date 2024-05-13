import { Component, NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PagoClienteFechaPrevia, PagoCliente } from '../../../models/PlanPagoClienteViewModel';
import { PLanPagoServiceService } from '../../../service/planplago_service';
import { ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { InputTextModule } from 'primeng/inputtext';
import { DialogModule } from 'primeng/dialog';
import { ToggleButtonModule } from 'primeng/togglebutton';
import { FormsModule } from '@angular/forms';
import { FileUploadModule } from 'primeng/fileupload';
import { RippleModule } from 'primeng/ripple';
import { ToastModule } from 'primeng/toast';
import { ToolbarModule } from 'primeng/toolbar';
import { RatingModule } from 'primeng/rating';
import { InputTextareaModule } from 'primeng/inputtextarea';
import { DropdownModule } from 'primeng/dropdown';
import { RadioButtonModule } from 'primeng/radiobutton';
import { InputNumberModule } from 'primeng/inputnumber';
import { Message, MessageService } from 'primeng/api';
import { MessagesModule } from 'primeng/messages';
import { MessageModule } from 'primeng/message';

@Component({
  selector: 'app-planpagocliente-crear',
  templateUrl: './planpagocliente-crear.component.html',
  styleUrls: ['./planpagocliente-crear.component.scss'],
  providers: [MessageService]
})
export class PlanpagoclienteCrearComponent {

  formCliente: FormGroup;
  formClienteInsertar: FormGroup;
  display: boolean = false;
  ppagoclientefecha: PagoClienteFechaPrevia [] = [];
  selectCliente: any ;

  vacio: string = "collapse";
  encabezado: string = "";
  tablaFecha: string = "collapse";
  tablaGeneral: string = "collapse";
  pagarCuota: string  = "collapse";
  montovacio: string = "collapse";
  label: string ="collapse";
  pagada: string = "";

  intereses: number;
  mora: number;
  minimototal: number;
  pagarcuota: string = "collapse";

  // Dentro del componente TypeScript
ocultarEncabezado: boolean = false;


  constructor(
    private messageService: MessageService, 
    private service:  PLanPagoServiceService, 
    private _PagoCliente:  PLanPagoServiceService, 
    private fb: FormBuilder,
  ) 
   {
    this.formCliente = this.fb.group({
      identidad: [""],
    });

    this.formClienteInsertar = this.fb.group({
      monto: [""],
      pacl_idddd: [""], 
      papaaaaa_id: [""], 
      pacl_NumeroCuota:[""]
    });

   }
   
   Buscar(){

    if (this.formCliente.get('identidad').value === '') 
    {
        this.vacio = ""; // Oculta el mensaje de error
        // Aquí puedes mostrar un mensaje de error adicional si lo deseas
    } 
    else 
    {
      this.service.getPlanPagoClienteFecha(this.formCliente.get('identidad').value).subscribe(data => {
        this.ppagoclientefecha = data;
        
        console.log("Los datos son: "+ data)
      });

      this.tablaFecha = "";
    }
  }

  verificarCuotasAnteriores(pagoCliente: PagoClienteFechaPrevia): boolean {
    // Obtener todas las cuotas anteriores a la cuota seleccionada
    const cuotasAnteriores = this.ppagoclientefecha.filter(cuota => cuota.pacl_NumeroCuota < pagoCliente.pacl_NumeroCuota);

    // Verificar el estado de pago de cada cuota anterior
    for (const cuota of cuotasAnteriores) {
      if (cuota.pacl_Estado_Pago != 'Pagada') {
        // Si alguna cuota anterior no está pagada, mostrar un mensaje y retornar false
        this.messageService.add({severity: 'error', summary: 'Error', detail: 'No se pueden pagar cuotas anteriores pendientes.'});
        return false;
      }
    }

    // Si todas las cuotas anteriores están pagadas, retornar true
    return true;
  }

  AbrirModal(ppagoclientefecha : any){

    if (this.verificarCuotasAnteriores(ppagoclientefecha))
    {
      this.pagarcuota = "collapse";

      this.formClienteInsertar = this.fb.group({
        monto: [""],
        pacl_idddd: [""],
        papaaaaa_id: [""],
        pacl_NumeroCuota: [""]
      });
  
      this.label = "collapse";
      this.montovacio = "collapse";
      this.selectCliente = ppagoclientefecha;
      
      this.intereses = ppagoclientefecha.papa_Intereses_Monto;
      this.mora = ppagoclientefecha.monto_Mora;
      this.minimototal = ppagoclientefecha.minimoPagar;
  
      this.formClienteInsertar.patchValue({
        pacl_idddd: ppagoclientefecha.pacl_Id,
        papaaaaa_id: ppagoclientefecha.papa_Id,
        pacl_NumeroCuota: ppagoclientefecha.pacl_NumeroCuota,
      });
  
      console.log(this.selectCliente);
      this.display = true;
    }

    else 
    {
      this.pagarcuota = "";
    }

  }

  // Dentro de tu componente de Angular
  evaluarEstadoPago(ppagoclientefecha: any) {
    if (ppagoclientefecha.pacl_Estado_Pago == 'Pagada') {
      
      this.pagada = "collapse";
       console.log("Entro al collapse");
        return 'collapse';
    } else {
        return '';
    }
}


  InsertarCuota(){
    const modelo: PagoCliente = {
      pacl_Monto_Pago: this.formClienteInsertar.value.monto, 
      pacl_NumeroCuota: this.formClienteInsertar.value.pacl_NumeroCuota,
      papa_Id: this.formClienteInsertar.value.papaaaaa_id, 
      pacl_Id: this.formClienteInsertar.value.pacl_idddd, 
    }

    if(this.formClienteInsertar.get('monto').value === '')
    {
        this.montovacio = "";
        this.label = "collapse";
    }

    else
    {
      if(this.formClienteInsertar.get('monto').value < this.minimototal)
        {
          this.label = "";
          this.montovacio = "collapse";
        }

        else
        {
          this._PagoCliente.agregarPagoCliente(modelo).subscribe({
            next: (data) => {
              console.log(data);
              this.display = false;
              this.messageService.add({severity:'success', summary:'Éxito', detail:'Cuota insertada correctamente!'});
            
              this.service.getPlanPagoClienteFecha(this.formCliente.get('identidad').value).subscribe(data => {
                this.ppagoclientefecha = data;
                console.log("Los datos son: "+ data)
              });
      
            },
            error: (e) => {
              console.log(e);
            }
          })
    
          this.display = false;
        }
    }

  }

  Limpiar(){
    this.vacio = "collapse"; 
    this.tablaFecha = "collapse";
    this.formCliente = this.fb.group({
      identidad: [""],
    });
  }

  Vercuotas(){
    if (this.formCliente.get('identidad').value === '') {
        this.vacio = ""; // Oculta el mensaje de error
        // Aquí puedes mostrar un mensaje de error adicional si lo deseas
    } else {
        console.log("Hola mundo");
        this.vacio = "collapse"; // Oculta el mensaje de error
        this.messageService.add({severity:'success', summary:'Éxito', detail:'¡Departamento eliminado correctamente!'});
    }}

}

@NgModule({
  imports: [ 
    CommonModule,
		MessagesModule,
		MessageModule,
		ButtonModule,
		ToastModule,
		InputTextModule,
    CommonModule,
    ReactiveFormsModule,
    TableModule,
    ButtonModule,
    InputTextModule,
    ToggleButtonModule,
    DialogModule,
    CommonModule,
    TableModule,
    FileUploadModule,
    FormsModule,
    ButtonModule,
    RippleModule,
    ToastModule,
    ToolbarModule,
    RatingModule,
    InputTextModule,
    InputTextareaModule,
    DropdownModule,
    RadioButtonModule,
    InputNumberModule,
    DialogModule

   ],
  declarations: [PlanpagoclienteCrearComponent]
})
export class PLanPagosListadoModule {}
