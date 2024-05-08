import { Component, OnInit, NgModule  } from '@angular/core';
import { Router } from '@angular/router';
import { Municipio, Fill } from '../../../models/MunicipioViewModel';
import { Departamento } from '../../../models/Departamentoviewmodel';
import { MunicipioServiceService } from '../../../service/municipio_service';
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
  selector: 'app-municipios-listado',
  templateUrl: './municipios-listado.component.html',
  styleUrls: ['./municipios-listado.component.scss'],
  providers: [MessageService]
})
export class MunicipiosListadoComponent implements OnInit {
  municipio!: Municipio[];
  display: boolean = false;
  departamentos: Departamento[];
  formMunicipio: FormGroup;
  listadoMunicipio: Municipio[] = [];
  selectedDepartamento: any;
  modalTitle: string = 'Nuevo Registro';
  modalButtonLabel: string = 'Guardar';
  confirmacionVisible: boolean = false;
  departamentoAEliminar: Municipio | null = null;

  

  codigo: string = '';
  depa: string = 'Seleccione';
  valor: string = '';


  constructor(    
    private service:  MunicipioServiceService, 
    private router: Router ,
    private fb:FormBuilder,
    private _municipioservice:MunicipioServiceService,
    private messageService: MessageService,
    private dialog: MatDialog,) 
    {
      this.formMunicipio = this.fb.group({
        codigo:["",Validators.required],
        municipio:["",Validators.required],
        departamento:[this.depa],
        depaid:["Seleccione"],
       
      })
      this._municipioservice.getMunicipio().subscribe(
        (data : any) =>{
          this.listadoMunicipio = data;
      },error => {
        console.log(error)
      }
    );
    }

    tabla: string = "";
    detalless: string = "collapse";
  
    muni_Id?: string = "";
    muni_Descripcion?:string = "";   
    dept_Descripcion?:string = "";  
    usua_Creacion?:string = "";   
    muni_Fecha_Creacion?:string ="";    
    usua_Modifica?:string ="";   
    muni_Fecha_Modifica?:string = "";  
  
    detalles(codigo){
      this.tabla = "collapse";
      this.detalless = "";
      this.service.getFill(codigo).subscribe({
          next: (data: Fill) => {
            this.muni_Id = data.muni_Id;
            this.muni_Descripcion = data.muni_Descripcion;
            this.dept_Descripcion = data.dept_Descripcion;
            this.usua_Creacion = data.usua_Creacion;
            this.muni_Fecha_Creacion = data.muni_Fecha_Creacion;
            this.usua_Modifica = data.usua_Modifica;
            this.muni_Fecha_Modifica = data.muni_Fecha_Modifica;
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

    AbrirModal() {
      this.formMunicipio = this.fb.group({
        codigo:["",Validators.required],
        municipio:["",Validators.required],
        departamento:[this.depa],
        depaid:["Seleccione"],
       
      })

      this.display = true;
      // Ajusta la ruta según tu configuración de enrutamiento
  }
  
    NuevoModelo(){
      console.log(this.formMunicipio.value)
      const municipio : Municipio = {
        dept_Descripcion : this.formMunicipio.value.departamento,
        dept_Id : this.formMunicipio.value.departamento,
        muni_Descripcion : this.formMunicipio.value.municipio,
        muni_Id : this.formMunicipio.value.codigo,
      }
      this._municipioservice.agregar(municipio).subscribe({
        next:(data)=>{
          this.service.getMunicipio().subscribe(
            (data: any) => {
              console.log(data);
              this.municipio = data;
              console.log(this.municipio);
               this.display = false;
          
            },
             error => {
              console.log(error);
            }
          );
     
        },error:(e)=>{}
      })
    }


    getMunicipio() {
      this.service.getMunicipio().subscribe(
        (data: any) => {
          this.municipio = data;
        },
        error => {
          console.log(error);
        }
      );
    }
  
    confirmarEliminar(departamento: Municipio) {
      this.departamentoAEliminar = departamento;
      this.confirmacionVisible = true;
    }
    
    eliminar() {
      if (this.departamentoAEliminar) {
        const idDepartamento = this.departamentoAEliminar.muni_Id;
        this._municipioservice.eliminar(idDepartamento).subscribe({
          next: (data) => {
            this.getMunicipio();
            this.confirmacionVisible = false;
            this.messageService.add({severity:'success', summary:'Éxito', detail:'Municipio eliminado correctamente!'});
          },
          error: (e) => {
            console.log(e);
            this.messageService.add({severity:'error', summary:'Error', detail:'Esta municipio no se puede eliminar.'});
          }
        });
      }
    }
    cancelarEliminar() {
      this.confirmacionVisible = false;
    }
  
    campoVacio(campo: string): boolean {
      return this.formMunicipio.get(campo)?.hasError('required') && this.formMunicipio.get(campo)?.touched;
    }
  
    displayNuevo(){
      this.formMunicipio.reset();
      this.modalTitle = 'Nuevo Registro';
      this.modalButtonLabel = 'Guardar';
      this.display = true;

      this.formMunicipio = this.fb.group({
        codigo:["",Validators.required],
        municipio:["",Validators.required],
        departamento:["Seleccione"],
        depaid:["Seleccione"],
       
      })

    }
   
    editar(departamento: any) {
      this.depa = "";
      this.selectedDepartamento = departamento;
      console.log(this.selectedDepartamento);
      // Usar el nombre del departamento en lugar del código
      this.valor = departamento.dept_Descripcion !== null ? departamento.dept_Descripcion : '';
      this.codigo = departamento.muni_Id;
      this.depa = departamento.dept_Descripcion;
      console.log(this.depa + ' ' + departamento.dept_Id);
      this.formMunicipio = this.fb.group({
        codigo: [departamento.muni_Id],
        municipio: [departamento.muni_Descripcion],
        departamento: [departamento.dept_Id],
      });
      this.modalTitle = 'Editar Registro';
      this.modalButtonLabel = 'Actualizar';
      this.display = true;
    }
  
    guardar() {
      if (this.formMunicipio.invalid) {
        return;
      }
      if (this.modalTitle === 'Nuevo Registro') {
        this.NuevoModelo();
      } else {
        this.actualizar();
      }
    }
  
    actualizar() {
      const idDepartamento = this.selectedDepartamento.muni_Id;
      const modelo: Municipio = {
        dept_Descripcion : this.formMunicipio.value.departamento,
        dept_Id : this.formMunicipio.value.departamento,
        muni_Descripcion : this.formMunicipio.value.municipio,
        muni_Id : this.formMunicipio.value.codigo,
      }
      this._municipioservice.actualizar(idDepartamento, modelo).subscribe({
        next: (data) => {
          this.getMunicipio();
          this.display = false;
          this.messageService.add({severity:'success', summary:'Éxito', detail:'Municipio editado correctamente!'});
        },
        error: (e) => {
          console.log(e);
          this.messageService.add({severity:'error', summary:'Error', detail:'Municipio ya existente.'});
        }
      })
    }
  


  ngOnInit(): void {
    this.service.getMunicipio().subscribe(
      (data: any) => {
        console.log(data);
        this.municipio = data;
        console.log(this.municipio);
      },
       error => {
        console.log(error);
      }
    );

    this.service.getDepartamento().subscribe(data => {
      this.departamentos = data;
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
  declarations: [MunicipiosListadoComponent]
})
export class MunicipiosListadoModule {}
