import { Component, OnInit, NgModule  } from '@angular/core';
import { Router } from '@angular/router';
import { TipoCuota,Fill } from '../../../models/TipoCuotaViewModel';
import { TipoCuotaServiceService } from '../../../service/tipocuota_service';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { InputTextModule } from 'primeng/inputtext';
import { DialogModule } from 'primeng/dialog';
import { ToggleButtonModule } from 'primeng/togglebutton';
import { RippleModule } from 'primeng/ripple';
import { MultiSelectModule } from 'primeng/multiselect';
import { DropdownModule } from 'primeng/dropdown';
import { ProgressBarModule } from 'primeng/progressbar';
import { ToastModule } from 'primeng/toast';
import { SliderModule } from 'primeng/slider';
import { RatingModule } from 'primeng/rating';
import { MessageService } from 'primeng/api';
import {DialogAddEditComponent} from 'src/app/demo/Dialogs/dialog-add-edit/dialog-add-edit.component';
import { MatDialog} from '@angular/material/dialog';
import {MatButtonModule} from '@angular/material/button';
import {Mensaje} from 'src/app/demo/models/MensajeViewModel';
import { ImpresionService } from 'src/app/demo/service/impresion.service';

@Component({
  selector: 'app-tipocuota-listado',
  templateUrl: './tipocuota-listado.component.html',
  styleUrls: ['./tipocuota-listado.component.scss'],
  providers: [MessageService]
})
export class TipocuotaListadoComponent implements OnInit {

  tipocuota!: TipoCuota[];
  display: boolean = false;
  formTipocuota: FormGroup;
  listadoTipoCuota: TipoCuota[] = [];
  selectedDepartamento: any;
  modalTitle: string = 'Nuevo Registro';
  modalButtonLabel: string = 'Guardar';
  confirmacionVisible: boolean = false;
  departamentoAEliminar: TipoCuota | null = null;

  constructor(    
    private service: TipoCuotaServiceService,
    private router: Router,
    private fb:FormBuilder,
    private _tipocuotaServicio:TipoCuotaServiceService,
    private messageService: MessageService,
    private dialog: MatDialog,) 
    {
      this.formTipocuota = this.fb.group({
        tipocuota:["",Validators.required],
       
      })
      this._tipocuotaServicio.getTipoCuota().subscribe(
        (data : any) =>{
          this.listadoTipoCuota = data;
      },error => {
        console.log(error)
      }
      
    );
    }

    tabla: string = "";
    detalless: string = "collapse";
  
    ticu_Id?: number = 0;
    ticu_Descripcion?:string = "";  
    usua_Creacion?:string = "";   
    ticu_Fecha_Creacion?:string ="";    
    usua_Modifica?:string ="";   
    ticu_Fecha_Modi?:string = "";  
  
    detalles(codigo){
      this.tabla = "collapse";
      this.detalless = "";
      this.service.getFill(codigo).subscribe({
          next: (data: Fill) => {
            this.ticu_Id = data.ticu_Id;
            this.ticu_Descripcion = data.ticu_Descripcion;
            this.usua_Creacion = data.usua_Creacion;
            this.ticu_Fecha_Creacion = data.ticu_Fecha_Creacion;
            this.usua_Modifica = data.usua_Modifica;
            this.ticu_Fecha_Modi = data.ticu_Fecha_Modi;
          }
        });
    }
  
    volver(){
      this.tabla = "";
      this.detalless = "collapse";
    }

    openDialog() {
      this.dialog.open(DialogAddEditComponent);
    }
  NuevoDepartamento(){
    console.log(this.formTipocuota.value)
    const modelo : TipoCuota = {
      ticu_Id :0,
      ticu_Descripcion : this.formTipocuota.value.tipocuota
    }
    this._tipocuotaServicio.agregar(modelo).subscribe({
      next:(data)=>{
        this.service.getTipoCuota().subscribe(
          (data: any) => {
            console.log(data);
            this.tipocuota = data;
            console.log(this.tipocuota);
             this.display = false;
        
          },
           error => {
            console.log(error);
          }
        );
   
      },error:(e)=>{}
    })
  }



  getTipoCuota() {
    this.service.getTipoCuota().subscribe(
      (data: any) => {
        this.tipocuota = data;
      },
      error => {
        console.log(error);
      }
    );
  }

  confirmarEliminar(departamento: TipoCuota) {
    this.departamentoAEliminar = departamento;
    this.confirmacionVisible = true;
  }
  
  eliminar() {
    if (this.departamentoAEliminar) {
      const idDepartamento = this.departamentoAEliminar.ticu_Id;
      this._tipocuotaServicio.eliminar(idDepartamento).subscribe({
        next: (data) => {
          this.getTipoCuota();
          this.confirmacionVisible = false;
          this.messageService.add({severity:'success', summary:'Éxito', detail:'Tipo de cuota eliminada correctamente!'});
        },
        error: (e) => {
          console.log(e);
          this.messageService.add({severity:'error', summary:'Error', detail:'Esta tipo de cuota no se puede eliminar.'});
        }
      });
    }
  }
  cancelarEliminar() {
    this.confirmacionVisible = false;
  }

  campoVacio(campo: string): boolean {
    return this.formTipocuota.get(campo)?.hasError('required') && this.formTipocuota.get(campo)?.touched;
  }

  displayNuevo(){
    this.formTipocuota.reset();
    this.modalTitle = 'Nuevo Registro';
    this.modalButtonLabel = 'Guardar';
    this.display = true;
  }

  editar(departamento: any) {
    this.selectedDepartamento = departamento;
    this.modalTitle = 'Editar Registro';
    this.modalButtonLabel = 'Actualizar';
    this.formTipocuota.patchValue({
      codigo: departamento.ticu_Id,
      tipocuota: departamento.ticu_Descripcion
    });
    this.display = true;
  }

  guardar() {
    if (this.formTipocuota.invalid) {
      return;
    }
    if (this.modalTitle === 'Nuevo Registro') {
      this.NuevoDepartamento();
    } else {
      this.actualizar();
    }
  }

  actualizar() {
    const idDepartamento = this.selectedDepartamento.ticu_Id;
    const modelo: TipoCuota = {
      ticu_Id : this.formTipocuota.value.codigo,
      ticu_Descripcion : this.formTipocuota.value.tipocuota
    }
    this._tipocuotaServicio.actualizar(idDepartamento, modelo).subscribe({
      next: (data) => {
        this.getTipoCuota();
        this.display = false;
        this.messageService.add({severity:'success', summary:'Éxito', detail:'Tipo de cuota editada correctamente!'});
      },
      error: (e) => {
        console.log(e);
        this.messageService.add({severity:'error', summary:'Error', detail:'Tipo de cuota ya existente.'});
      }
    })
  }



  ngOnInit(): void {
    this.service.getTipoCuota().subscribe(
      (data: any) => {
        console.log(data);
        this.tipocuota = data;
        console.log(this.tipocuota);
      },
       error => {
        console.log(error);
      }
    );
  }
}

@NgModule({
  imports: [
    CommonModule,
    ReactiveFormsModule,
    TableModule,
    ButtonModule,
    InputTextModule,
    ToggleButtonModule,
    RippleModule,
    MultiSelectModule,
    DropdownModule,
    ProgressBarModule,
    DialogModule,
    ToastModule,
    SliderModule,
    RatingModule,
      MatButtonModule,
      DialogAddEditComponent
  ],
  declarations: [TipocuotaListadoComponent]
})
export class TipoCuotasListadoModule {}

