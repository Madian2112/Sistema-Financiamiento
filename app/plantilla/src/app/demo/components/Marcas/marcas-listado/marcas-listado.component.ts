import { Component, OnInit, NgModule  } from '@angular/core';
import { Router } from '@angular/router';
import { Marca, Fill } from '../../../models/MarcaViewModel';
import { MarcaServiceService } from '../../../service/marca_service';
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
  selector: 'app-marcas-listado',
  templateUrl: './marcas-listado.component.html',
  styleUrls: ['./marcas-listado.component.scss'],
  providers: [MessageService]
})
export class MarcasListadoComponent implements OnInit  {
  marca!: Marca[];
  display: boolean = false;
  formMarca: FormGroup;
  listadoMarca: Marca[] = [];
  selectedDepartamento: any;
  modalTitle: string = 'Nuevo Registro';
  modalButtonLabel: string = 'Guardar';
  confirmacionVisible: boolean = false;
  departamentoAEliminar: Marca | null = null;

  constructor(    
    private service: MarcaServiceService,
    private router: Router,
    private fb:FormBuilder,
    private _marcaServicio:MarcaServiceService,
    private messageService: MessageService,
    private dialog: MatDialog,) 
    {
      this.formMarca = this.fb.group({
        codigo:[0],
        marca:["", Validators.required],
       
      })
      this._marcaServicio.getMarca().subscribe(
        (data : any) =>{
          this.listadoMarca = data;
      },error => {
        console.log(error)
      }
      
    );
    }

    tabla: string = "";
    detalless: string = "collapse";
  
    marc_Id?: number = 0;
    marc_Descripcion?:string = "";   
    usua_Creacion?:string = "";   
    marc_Fecha_Creacion?:string ="";    
    usua_Modifica?:string ="";   
    marc_Fecha_Modificacion?:string = "";  
  
    detalles(codigo){
      this.tabla = "collapse";
      this.detalless = "";
      this.service.getFill(codigo).subscribe({
          next: (data: Fill) => {
            this.marc_Id = data.marc_Id;
            this.marc_Descripcion = data.marc_Descripcion;
            this.usua_Creacion = data.usua_Creacion;
            this.marc_Fecha_Creacion = data.marc_Fecha_Creacion;
            this.usua_Modifica = data.usua_Modifica;
            this.marc_Fecha_Modificacion = data.marc_Fecha_Modificacion;
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
    console.log(this.formMarca.value)
    const modelo : Marca = {
      marc_Id : 0,
      marc_Descripcion : this.formMarca.value.marca
    }
    this._marcaServicio.agregarMarca(modelo).subscribe({
      next:(data)=>{
        this.service.getMarca().subscribe(
          (data: any) => {
            console.log(data);
            this.marca = data;
            console.log(this.marca);
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
    this.service.getMarca().subscribe(
      (data: any) => {
        this.marca = data;
      },
      error => {
        console.log(error);
      }
    );
  }

  confirmarEliminar(departamento: Marca) {
    this.departamentoAEliminar = departamento;
    this.confirmacionVisible = true;
  }
  
  eliminar() {
    if (this.departamentoAEliminar) {
      const idDepartamento = this.departamentoAEliminar.marc_Id;
      this._marcaServicio.eliminar(idDepartamento).subscribe({
        next: (data) => {
          this.getMarca();
          this.confirmacionVisible = false;
          this.messageService.add({severity:'success', summary:'Éxito', detail:'Marca eliminado correctamente!'});
        },
        error: (e) => {
          console.log(e);
          this.messageService.add({severity:'error', summary:'Error', detail:'Esta Marca no se puede eliminar.'});
        }
      });
    }
  }
  cancelarEliminar() {
    this.confirmacionVisible = false;
  }

  campoVacio(campo: string): boolean {
    return this.formMarca.get(campo)?.hasError('required') && this.formMarca.get(campo)?.touched;
  }

  displayNuevo(){
    this.formMarca.reset();
    this.modalTitle = 'Nuevo Registro';
    this.modalButtonLabel = 'Guardar';
    this.display = true;
  }

  editar(departamento: any) {
    this.selectedDepartamento = departamento;
    this.modalTitle = 'Editar Registro';
    this.modalButtonLabel = 'Actualizar';
    this.formMarca.patchValue({
      codigo: departamento.marc_Id,
      marca: departamento.marc_Descripcion
    });
    this.display = true;
  }

  guardar() {
    if (this.formMarca.invalid) {
      return;
    }
    if (this.modalTitle === 'Nuevo Registro') {
      this.NuevoDepartamento();
    } else {
      this.actualizar();
    }
  }

  actualizar() {
    const idDepartamento = this.selectedDepartamento.marc_Id;
    const modelo: Marca = {
      marc_Id : this.selectedDepartamento.marc_Id,
      marc_Descripcion : this.formMarca.value.marca
    }
    this._marcaServicio.actualizar(idDepartamento, modelo).subscribe({
      next: (data) => {
        this.getMarca();
        this.display = false;
        this.messageService.add({severity:'success', summary:'Éxito', detail:'Marca editado correctamente!'});
      },
      error: (e) => {
        console.log(e);
        this.messageService.add({severity:'error', summary:'Error', detail:'Marca ya existente.'});
      }
    })
  }

  ngOnInit(): void {
    this.service.getMarca().subscribe(
      (data: any) => {
        console.log(data);
        this.marca = data;
        console.log(this.marca);
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
  declarations: [MarcasListadoComponent]
})
export class MarcasListadoModul {}