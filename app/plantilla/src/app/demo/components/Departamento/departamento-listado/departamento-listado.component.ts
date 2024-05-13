import { Component, OnInit, NgModule,Inject } from '@angular/core';
import { Router } from '@angular/router';
import { Departamento } from '../../../models/Departamentoviewmodel';
import { Fill } from '../../../models/Departamentoviewmodel';
import { DepartamentoServiceService } from '../../../service/departamento_service';
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
import { MatDialog } from '@angular/material/dialog';
import { MatButtonModule } from '@angular/material/button';
import { MessageService } from 'primeng/api';
import {Mensaje} from 'src/app/demo/models/MensajeViewModel';
import { Prueba } from '../../../models/Departamentoviewmodel';


@Component({
  selector: 'app-departamento-listado',
  templateUrl: './departamento-listado.component.html',
  styleUrls: ['./departamento-listado.component.scss'],
  providers: [MessageService]
})
export class DepartamentoListadoComponent implements OnInit {
  
  display: boolean = false;
  departamento: Departamento[] = [];
  formDepartamento: FormGroup;
  selectedDepartamento: any;
  modalTitle: string = 'Nuevo Registro';
  modalButtonLabel: string = 'Guardar';
  confirmacionVisible: boolean = false;
  departamentoAEliminar: Departamento | null = null;
  fill: Fill[] = [];
  tabla: string = "";
  detalless: string = "collapse";

  dept_Id?: string = "";
  dept_Descripcion?:string = "";   
  dept_Usua_Creacion?: string ="";
  dept_Fecha_Creacion?:string ="";    
  dept_Usua_Modifica?: string ="";
  dept_Fecha_Modifica?:string ="";   
  usua_Creacion?: string ="";
  usua_Modifica?:string ="";    
 

  constructor(
    private service: DepartamentoServiceService,
    private router: Router,
    private fb: FormBuilder,
    private _departamentoServicio: DepartamentoServiceService,
    private dialog: MatDialog,
    private messageService: MessageService,
   
  ) {
    this.formDepartamento = this.fb.group({
      codigo: ["", Validators.required],
      departamento: ["", Validators.required],
    });
  }

  
  ngOnInit(): void {
    this.getDepartamentos();
  }

  getDepartamentos() {
    this.service.getDepartamento().subscribe(
      (data: any) => {
        this.departamento = data;
        console.log(this.departamento);
      },
      error => {
        console.log(error);
      }
    );
  }

  detalle(obeto:Departamento){
    this.router.navigate(['/departamento',obeto.dept_Id])
  }

  Detalle(){
    this.router.navigate(['app/DetalleDepartamento'])
  }


  detalles(codigo){
    this.tabla = "collapse";
    this.detalless = "";
    this.service.getFill(codigo).subscribe({
        next: (data: Fill) => {

          this.dept_Id = data.dept_Id;
          this.dept_Descripcion = data.dept_Descripcion;
          this.dept_Usua_Creacion = data.dept_Usua_Creacion;
          this.dept_Fecha_Creacion = data.dept_Fecha_Creacion;
          this.dept_Usua_Modifica = data.dept_Usua_Modifica;
          this.dept_Fecha_Modifica = data.dept_Fecha_Modifica;
          this.usua_Creacion = data.usua_Creacion; 
          this.usua_Modifica = data.usua_Modifica;
        }
      });

      console.log(this.dept_Id);
  }
  volver(){
    this.tabla = "";
    this.detalless = "collapse";
  }

  confirmarEliminarDepartamento(departamento: Departamento) {
    this.departamentoAEliminar = departamento;
    this.confirmacionVisible = true;
  }
  
  eliminarDepartamento() {
    if (this.departamentoAEliminar) {
      const idDepartamento = this.departamentoAEliminar.dept_Id;
      this._departamentoServicio.eliminar(idDepartamento).subscribe({
        next: (data) => {
          this.getDepartamentos();
          this.confirmacionVisible = false;
          this.messageService.add({severity:'success', summary:'Éxito', detail:'¡Departamento eliminado correctamente!'});
        },
        error: (e) => {
          console.log(e);
          this.messageService.add({severity:'error', summary:'Error', detail:'Este Departamento no se puede eliminar.'});
        }
      });
    }
  }
  

  cancelarEliminar() {
    this.confirmacionVisible = false;
  }

  campoVacio(campo: string): boolean {
    return this.formDepartamento.get(campo)?.hasError('required') && this.formDepartamento.get(campo)?.touched;
  }

  displayNuevoDepartamento() {
    this.formDepartamento.reset();
    this.modalTitle = 'Nuevo Registro';
    this.modalButtonLabel = 'Guardar';
    this.display = true;
  }

  editDepartamento(depart: any) {
    this.selectedDepartamento = depart;
    this.modalTitle = 'Editar Registro';
    this.modalButtonLabel = 'Actualizar';

    this.formDepartamento.patchValue({
      codigo: depart.dept_Id,
      departamento: depart.dept_Descripcion,
    });
    this.display = true;
  }



  

  guardarDepartamento() {
    if (this.formDepartamento.invalid) {
      return;
    }
    if (this.modalTitle === 'Nuevo Registro') {
      this.NuevoDepartamento();
    } else {
      this.actualizarDepartamento();
    }
  }

  NuevoDepartamento() {
    const modelo: Prueba = {
      dept_Id: this.formDepartamento.value.codigo,
      dept_Descripcion: this.formDepartamento.value.departamento

    }
    this._departamentoServicio.agregar(modelo).subscribe({
      next: (data) => {
        
        this.getDepartamentos();
        this.display = false;
        this.messageService.add({severity:'success', summary:'Éxito', detail:'¡Departamento creado correctamente!'});
      },
      error: (e) => {
        console.log(e);
        this.messageService.add({severity:'error', summary:'Error', detail:'Departamento ya existente.'});
      }
    })
  }

  actualizarDepartamento() {
    const idDepartamento = this.selectedDepartamento.dept_Id;
    const modelo: Prueba = {
      dept_Id: this.formDepartamento.value.codigo,
      dept_Descripcion: this.formDepartamento.value.departamento
    }
    this._departamentoServicio.actualizar(idDepartamento, modelo).subscribe({
      next: (data) => {
        this.getDepartamentos();
        this.display = false;
        this.messageService.add({severity:'success', summary:'Éxito', detail:'¡Departamento editado correctamente!'});
      },
      error: (e) => {
        console.log(e);
        this.messageService.add({severity:'error', summary:'Error', detail:'Departamento ya existente.'});
      }
    })
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
    DepartamentoListadoComponent
  ]
})
export class DepartamentosListadoModule { }
