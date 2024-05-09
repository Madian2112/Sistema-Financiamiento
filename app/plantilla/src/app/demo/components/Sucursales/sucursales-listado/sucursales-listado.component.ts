import { Component, OnInit, NgModule } from '@angular/core';
import { Router } from '@angular/router';
import { Sucursal, Fill } from '../../../models/SucursalViewModel';
import { Departamento } from '../../../models/Departamentoviewmodel';
import { SucursalServiceService } from '../../../service/sucursal_service';
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
  selector: 'app-sucursales-listado',
  templateUrl: './sucursales-listado.component.html',
  styleUrls: ['./sucursales-listado.component.scss']
})
export class SucursalesListadoComponent implements OnInit {

  sucursal!: Sucursal[];
  display: boolean = false;
  departamentos: Departamento[];
  formSucursal: FormGroup;
  listadoSucursal: Sucursal[] = [];
  selectedDepartamento: any;
  modalTitle: string = 'Nuevo Registro';
  modalButtonLabel: string = 'Guardar';
  municipios: any[] = [];

  MunicipioCodigo: String = "";

  constructor(private service: SucursalServiceService, private router: Router,
    private fb:FormBuilder,
    private _sucursalservice:SucursalServiceService,
    private dialog: MatDialog,
  ) 
  {
    this.formSucursal = this.fb.group({
      codigo: ["", Validators.required],
      municipio: ["", Validators.required],
      departamento: [""],
      calleeee: [""], // Define calleeee FormControl aquí
      direccionnnn: [""], // Define direccionnnn FormControl aquí
    });
    this._sucursalservice.getSucursal().subscribe(
      (data : any) =>{
        this.listadoSucursal = data;
    },error => {
      console.log(error)
    }
  );
  }

  onDepartmentChange(departmentId) {
    if (departmentId !== '0') {
      this.service.getMunicipios(departmentId).subscribe(
        (data: any) => {
          this.municipios = data;
          console.log(data);
          this.formSucursal.get('municipio').setValue('0'); 
        },
        error => {
          console.error('Error fetching municipios:', error);
        }
      );
    } else {
      this.municipios = []; // Clear municipios if the department is invalid or reset
    }
  }

  tabla: string = "";
  detalless: string = "collapse";

  sucu_Id?: number = 0;
  sucu_Calle?:string = "";  
  sucu_Direccion?:string = "";  
  muni_Descripcion?:string = "";  
  dept_Descripcion?:string = "";  
  usua_Creacion?:string = "";   
  sucu_Fecha_Creacion?:string ="";    
  usua_Modifica?:string ="";   
  sucu_Fecha_Modi?:string = "";  

  detalles(codigo){
    this.tabla = "collapse";
    this.detalless = "";
    this.service.getFill(codigo).subscribe({
        next: (data: Fill) => {
          this.sucu_Id = data.sucu_Id;
          this.sucu_Calle = data.sucu_Calle;
          this.sucu_Direccion = data.sucu_Direccion;
          this.muni_Descripcion = data.muni_Descripcion;
          this.dept_Descripcion = data.dept_Descripcion;
          this.usua_Creacion = data.usua_Creacion;
          this.sucu_Fecha_Creacion = data.sucu_Fecha_Creacion;
          this.usua_Modifica = data.usua_Modifica;
          this.sucu_Fecha_Modi = data.sucu_Fecha_Modi;
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
    this.formSucursal = this.fb.group({
      codigo:["",Validators.required],
      calleeee: [""], // Define calleeee FormControl aquí
      direccionnnn: [""], // Define direccionnnn FormControl aquí
      municipio:["",Validators.required],
      departamento:[""],
     
    })

    this.display = true;
    // Ajusta la ruta según tu configuración de enrutamiento
}

  NuevoModelo(){
    console.log(this.formSucursal.value)
    const sucursal : Sucursal = {
      sucu_Id: 0,
      sucu_Calle: this.formSucursal.value.calleeee,
      sucu_Direccion: this.formSucursal.value.direccionnnn,
      dept_Descripcion : this.formSucursal.value.departamento,
      dept_Id: this.formSucursal.value.departamento,
      muni_Descripcion : this.formSucursal.value.municipio,
      muni_Id: this.formSucursal.value.municipio
    }
    this._sucursalservice.agregar(sucursal).subscribe({
      next:(data)=>{
        this.service.getSucursal().subscribe(
          (data: any) => {
            console.log(data);
            this.sucursal = data;
            console.log(this.sucursal);
             this.display = false;
        
          },
           error => {
            console.log(error);
          }
        );
   
      },error:(e)=>{}
    })
  }


  getSucursal() {
    this.service.getSucursal().subscribe(
      (data: any) => {
        this.sucursal = data;
      },
      error => {
        console.log(error);
      }
    );
  }
  confirmacionVisible: boolean = false;
  departamentoAEliminar: Sucursal | null = null;

  confirmarEliminar(departamento: Sucursal) {
    this.departamentoAEliminar = departamento;
    this.confirmacionVisible = true;
  }
  
  eliminar() {
    if (this.departamentoAEliminar) {
      const idDepartamento = this.departamentoAEliminar.sucu_Id;
      this._sucursalservice.eliminar(idDepartamento).subscribe({
        next: (data) => {
          this.getSucursal();
          this.confirmacionVisible = false;
        },
        error: (e) => {
          console.log(e);
        }
      });
    }
  }
  cancelarEliminar() {
    this.confirmacionVisible = false;
  }

  campoVacio(campo: string): boolean {
    return this.formSucursal.get(campo)?.hasError('required') && this.formSucursal.get(campo)?.touched;
  }

  displayNuevo(){
    this.formSucursal.reset();
    this.modalTitle = 'Nuevo Registro';
    this.modalButtonLabel = 'Guardar';
    this.display = true;

    this.formSucursal = this.fb.group({
      codigo:["",Validators.required],
      municipio:["",Validators.required],
      departamento:["Seleccione"],
      depaid:["Seleccione"],
      calleeee: [""], // Define calleeee FormControl aquí
      direccionnnn: [""] // Define direccionnnn FormControl aquí
     
    })

  }
 
  editar(departamento: any) {
    this.selectedDepartamento = departamento;
    console.log(this.selectedDepartamento);
    // Usar el nombre del departamento en lugar del código
    this.formSucursal = this.fb.group({
      codigo: [departamento.muni_Id],
      municipio: [departamento.muni_Id],
      departamento: [departamento.dept_Id],
      calleeee: [departamento.sucu_Calle],
      direccionnnn: [departamento.sucu_Direccion]
    });


    this.MunicipioCodigo = departamento.muni_Id;
    this.service.getMunicipios(departamento.dept_Id).subscribe(
      (data: any) => {
        this.municipios = data; 
        this.formSucursal.get('municipio').setValue(this.MunicipioCodigo); 
      }
    );

    this.modalTitle = 'Editar Registro';
    this.modalButtonLabel = 'Actualizar';
    this.display = true;
  }

  guardar() {
    console.log("se hizo click")
    if (this.modalTitle === 'Nuevo Registro') {
      console.log(this.modalTitle);
      this.NuevoModelo();
    } else {
      this.actualizar();
    }
  }

  actualizar() {
    const idDepartamento = this.selectedDepartamento.sucu_Id;
    const modelo: Sucursal = {
      sucu_Id : 0,
      sucu_Calle: this.formSucursal.value.calleeee, 
      sucu_Direccion: this.formSucursal.value.direccionnnn,
      dept_Descripcion : this.formSucursal.value.departamento,
      dept_Id: this.formSucursal.value.departamento,
      muni_Descripcion : this.formSucursal.value.municipio,
      muni_Id: this.formSucursal.value.municipio
    }
    this._sucursalservice.actualizar(idDepartamento, modelo).subscribe({
      next: (data) => {
        this.getSucursal();
        this.display = false;
      },
      error: (e) => {
        console.log(e);
      }
    })
  }



  ngOnInit(): void {
    this.service.getSucursal().subscribe(
      (data: any) => {
        console.log(data);
        this.sucursal = data;
        console.log(this.sucursal);
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
  declarations: [SucursalesListadoComponent]
})
export class SucursalesListadoModule {}
