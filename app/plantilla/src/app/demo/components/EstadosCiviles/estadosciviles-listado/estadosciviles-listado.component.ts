import { Component, OnInit, NgModule  } from '@angular/core';
import { Router } from '@angular/router';
import { EstadoCivil, Fill } from '../../../models/EstadoCivilViewModel';
import { EstadoCivilServiceService } from '../../../service/estadocivil_service';
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
  selector: 'app-estadosciviles-listado',
  templateUrl: './estadosciviles-listado.component.html',
  styleUrls: ['./estadosciviles-listado.component.scss'],
  providers: [MessageService]
})
export class EstadoscivilesListadoComponent implements OnInit {
  estadocivil!: EstadoCivil[];
  display: boolean = false;
  formEstadosCivil: FormGroup;
  listadoEstadoCivil: EstadoCivil[] = [];
  selectedDepartamento: any;
  modalTitle: string = 'Nuevo Registro';
  modalButtonLabel: string = 'Guardar';
  confirmacionVisible: boolean = false;
  departamentoAEliminar: EstadoCivil | null = null;
  

  constructor(    
    private service: EstadoCivilServiceService,
    private router: Router,
    private fb:FormBuilder,
    private _estadocivilservice:EstadoCivilServiceService,
    private messageService: MessageService,
    private dialog: MatDialog,) 
    {
      this.formEstadosCivil = this.fb.group({
        codigo:[0],
        estado:["",Validators.required],
       
      })
      this._estadocivilservice.getEstadoCivil().subscribe(
        (data : any) =>{
          this.listadoEstadoCivil = data;
      },error => {
        console.log(error)
      }
      
    );      
    }

    tabla: string = "";
    detalless: string = "collapse";
  
    esta_Id?: number = 0;
    esta_Descripcion?:string = "";   
    usua_Creacion?:string = "";   
    esta_Fecha_Creacion?:string ="";    
    usua_Modifica?:string ="";   
    esta_Fecha_Modifica?:string = "";  
  
    detalles(codigo){
      this.tabla = "collapse";
      this.detalless = "";
      this.service.getFill(codigo).subscribe({
          next: (data: Fill) => {
            this.esta_Id = data.esta_Id;
            this.esta_Descripcion = data.esta_Descripcion;
            this.usua_Creacion = data.usua_Creacion;
            this.esta_Fecha_Creacion = data.esta_Fecha_Creacion;
            this.usua_Modifica = data.usua_Modifica;
            this.esta_Fecha_Modifica = data.esta_Fecha_Modifica;
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
    console.log(this.formEstadosCivil.value)
    const modelo : EstadoCivil = {
      esta_Id : 0,
      esta_Descripcion : this.formEstadosCivil.value.estado
    }
    this._estadocivilservice.agregar(modelo).subscribe({
      next:(data)=>{
        this.service.getEstadoCivil().subscribe(
          (data: any) => {
            console.log(data);
            this.estadocivil = data;
            console.log(this.estadocivil);
             this.display = false;
        
          },
           error => {
            console.log(error);
          }
        );
   
      },error:(e)=>{}
    })
  }

  getEstadoCivil() {
    this.service.getEstadoCivil().subscribe(
      (data: any) => {
        this.estadocivil = data;
      },
      error => {
        console.log(error);
      }
    );
  }

  confirmarEliminar(departamento: EstadoCivil) {
    this.departamentoAEliminar = departamento;
    this.confirmacionVisible = true;
  }
  
  eliminar() {
    if (this.departamentoAEliminar) {
      const idDepartamento = this.departamentoAEliminar.esta_Id;
      this._estadocivilservice.eliminar(idDepartamento).subscribe({
        next: (data) => {
          this.getEstadoCivil();
          this.confirmacionVisible = false;
          this.messageService.add({severity:'success', summary:'Éxito', detail:'¡Estado Civil eliminado correctamente!'});
        },
        error: (e) => {
          console.log(e);
          this.messageService.add({severity:'error', summary:'Error', detail:'Este estado civil no se puede eliminar.'});
        }
      });
    }
  }
  cancelarEliminar() {
    this.confirmacionVisible = false;
  }

  campoVacio(campo: string): boolean {
    return this.formEstadosCivil.get(campo)?.hasError('required') && this.formEstadosCivil.get(campo)?.touched;
  }

  displayNuevo(){
    this.formEstadosCivil.reset();
    this.modalTitle = 'Nuevo Registro';
    this.modalButtonLabel = 'Guardar';
    this.display = true;
  }

  editar(departamento: any) {
    this.selectedDepartamento = departamento;
    this.modalTitle = 'Editar Registro';
    this.modalButtonLabel = 'Actualizar';
    this.formEstadosCivil.patchValue({
      codigo: departamento.esta_Id,
      estado: departamento.esta_Descripcion
    });
    this.display = true;
  }

  guardar() {
    if (this.formEstadosCivil.invalid) {
      return;
    }
    if (this.modalTitle === 'Nuevo Registro') {
      this.NuevoDepartamento();
    } else {
      this.actualizar();
    }
  }

  actualizar() {
    const idDepartamento = this.selectedDepartamento.esta_Id;
    const modelo: EstadoCivil = {
      esta_Id : this.formEstadosCivil.value.codigo,
      esta_Descripcion : this.formEstadosCivil.value.estado
    }
    this._estadocivilservice.actualizar(idDepartamento, modelo).subscribe({
      next: (data) => {
        this.getEstadoCivil();
        this.display = false;
        this.messageService.add({severity:'success', summary:'Éxito', detail:'Estado Civil editado correctamente!'});
      },
      error: (e) => {
        console.log(e);
        this.messageService.add({severity:'error', summary:'Error', detail:'Estado Civil ya existente.'});
      }
    })
  }

  ngOnInit(): void {
    this.service.getEstadoCivil().subscribe(
      (data: any) => {
        console.log(data);
        this.estadocivil = data;
        console.log(this.estadocivil);
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
    MatButtonModule
  ],
  declarations: [
    EstadoscivilesListadoComponent
  ]
})
export class EstadosCivilesListadoModule { }
