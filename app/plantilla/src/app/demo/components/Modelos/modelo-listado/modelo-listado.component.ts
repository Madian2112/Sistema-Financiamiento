import { Component, OnInit, NgModule } from '@angular/core';
import { Router } from '@angular/router';
import { Modelo, Fill } from '../../../models/ModeloViewModel';
import { Marca } from '../../../models/MarcaViewModel';
import { ModeloServiceService } from '../../../service/modelo_service';
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
  selector: 'app-modelo-listado',
  templateUrl: './modelo-listado.component.html',
  styleUrls: ['./modelo-listado.component.scss'],
  providers: [MessageService]
})
export class ModeloListadoComponent implements OnInit {

  display: boolean = false;
  modelo!: Modelo[];
  marcas: Marca[];
  formModelo: FormGroup;
  listadoModelo: Modelo[] = [];
  selectedDepartamento: any;
  modalTitle: string = 'Nuevo Registro';
  modalButtonLabel: string = 'Guardar';
  confirmacionVisible: boolean = false;
  departamentoAEliminar: Modelo | null = null;

  constructor(
    private service:  ModeloServiceService, 
    private router: Router ,
    private fb:FormBuilder,
    private _modeloServicio:ModeloServiceService,
    private messageService: MessageService,
    private dialog: MatDialog,
  ) {

    this.formModelo = this.fb.group({
      codigo:[0],
      modelo:["",Validators.required],
      marca:[],
     
    })
    this._modeloServicio.getModelo().subscribe(
      (data : any) =>{
        this.listadoModelo = data;
    },error => {
      console.log(error)
    }
    
  );}

  tabla: string = "";
  detalless: string = "collapse";

  mode_Id?: number = 0;
  mode_Descripcion?:string = "";   
  marc_Descripcion?:string = "";  
  usua_Creacion?:string = "";   
  mode_Fecha_Creacion?:string ="";    
  usua_Modifica?:string ="";   
  mode_Fecha_Modifica?:string = "";  

  detalles(codigo){
    this.tabla = "collapse";
    this.detalless = "";
    this.service.getFill(codigo).subscribe({
        next: (data: Fill) => {
          this.mode_Id = data.mode_Id;
          this.mode_Descripcion = data.mode_Descripcion;
          this.marc_Descripcion = data.marc_Descripcion;
          this.usua_Creacion = data.usua_Creacion;
          this.mode_Fecha_Creacion = data.mode_Fecha_Creacion;
          this.usua_Modifica = data.usua_Modifica;
          this.mode_Fecha_Modifica = data.mode_Fecha_Modifica;
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

  NuevoModelo(){
    console.log(this.formModelo.value)
    const modelo : Modelo = {
      mode_Id : this.formModelo.value.codigo,
      mode_Descripcion : this.formModelo.value.modelo,
      marc_Descripcion : this.formModelo.value.marca,
      marc_Id: this.formModelo.value.marca 
    }
    this._modeloServicio.agregar(modelo).subscribe({
      next:(data)=>{
        this.service.getModelo().subscribe(
          (data: any) => {
            console.log(data);
            this.modelo = data;
            console.log(this.modelo);
             this.display = false;
        
          },
           error => {
            console.log(error);
          }
        );
   
      },error:(e)=>{}
    })
  }



  getMarca() {
    this.service.getModelo().subscribe(
      (data: any) => {
        this.modelo = data;
      },
      error => {
        console.log(error);
      }
    );
  }

  confirmarEliminar(departamento: Modelo) {
    this.departamentoAEliminar = departamento;
    this.confirmacionVisible = true;
  }
  
  eliminar() {
    if (this.departamentoAEliminar) {
      const idDepartamento = this.departamentoAEliminar.mode_Id;
      this._modeloServicio.eliminar(idDepartamento).subscribe({
        next: (data) => {
          this.getMarca();
          this.confirmacionVisible = false;
          this.messageService.add({severity:'success', summary:'Éxito', detail:'Modelo eliminado correctamente!'});
        },
        error: (e) => {
          console.log(e);
          this.messageService.add({severity:'error', summary:'Error', detail:'Este modelo no se puede eliminar.'});
        }
      });
    }
  }
  cancelarEliminar() {
    this.confirmacionVisible = false;
  }

  campoVacio(campo: string): boolean {
    return this.formModelo.get(campo)?.hasError('required') && this.formModelo.get(campo)?.touched;
  }

  displayNuevo(){
    this.formModelo.reset();
    this.modalTitle = 'Nuevo Registro';
    this.modalButtonLabel = 'Guardar';
    this.display = true;
  }

  guardar() {
    if (this.formModelo.invalid) {
      return;
    }
    if (this.modalTitle === 'Nuevo Registro') {
      this.NuevoModelo();
    } else {
      this.actualizar();
    }
  }

  editar(departamento: any) {
    this.selectedDepartamento = departamento;
    this.modalTitle = 'Editar Registro';
    this.modalButtonLabel = 'Actualizar';
    console.log(departamento);
    this.formModelo.patchValue({
      codigo: departamento.mode_Id,
      modelo: departamento.mode_Descripcion,
      marca: departamento.marc_Id
    });
    this.display = true;
  }

  actualizar() {
    const idDepartamento = this.selectedDepartamento.mode_Id;
    const modelo: Modelo = {
      mode_Descripcion : this.formModelo.value.modelo,
      marc_Descripcion :"",
      marc_Id: this.formModelo.value.marca,
      mode_Id: this.selectedDepartamento.mode_Id,
    }
    this._modeloServicio.actualizar(idDepartamento, modelo).subscribe({
      next: (data) => {
        this.getMarca();
        this.display = false;
        this.messageService.add({severity:'success', summary:'Éxito', detail:'Modelo editado correctamente!'});
      },
      error: (e) => {
        console.log(e);
        this.messageService.add({severity:'error', summary:'Error', detail:'Modelo ya existente.'});
      }
    })
  }



  ngOnInit(): void {
    this.service.getModelo().subscribe(
      (data: any) => {
        console.log(data);
        this.modelo = data;
        console.log(this.modelo);
      },
       error => {
        console.log(error);
      }
    );

    this.service.getMarcas().subscribe(data => {
      this.marcas = data;
    });

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
  declarations: [ModeloListadoComponent]
})
export class ModelosListadoModule {}