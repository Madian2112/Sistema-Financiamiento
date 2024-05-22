import { Component, OnInit, NgModule } from '@angular/core';
import { Router } from '@angular/router';
import { Empleado, Fill } from '../../../models/EmpleadoViewModel';
import { Cargo } from '../../../models/CargoViewModel';
import { EstadoCivil } from '../../../models/EstadoCivilViewModel'
import { Departamento } from 'src/app/demo/models/Departamentoviewmodel';
import { EmpleadoServiceService } from '../../../service/empleado_service';
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
import { CreationGuard } from '../../../service/autguardUrl';

@Component({
  selector: 'app-empleados-listado',
  templateUrl: './empleados-listado.component.html',
  styleUrls: ['./empleados-listado.component.scss']
})
export class EmpleadosListadoComponent implements OnInit  {

  displ: boolean= true;
  display: boolean = false;
  empleado!: Empleado[];
  cargos!: Cargo[];
  estados!: EstadoCivil[];
  departamentos!: Departamento[];
  formEmpleado: FormGroup;
  listadoEmpleado: Empleado[] = [];
  municipios: any[] = [];
  selectedDepartamento: any;
  modalTitle: string = 'Nuevo Registro';
  modalButtonLabel: string = 'Guardar';
  MunicipioCodigo: String = "";

   constructor(   
    private service:  EmpleadoServiceService, 
    private router: Router ,
    private fb:FormBuilder,
    private _Empleadoservice:EmpleadoServiceService,
    private dialog: MatDialog,
    private creationGuard: CreationGuard
  ) 
   {
    this.formEmpleado = this.fb.group({
      dni:[""],
      nombre:["",],
      apellido:[""],
      sexo:[""],
      departamento:["Seleccione"],
      municipio:["",],
      cargo:["Seleccione"],
      estado:["Seleccione"],
      correo: [""],
    })

    this._Empleadoservice.getEmpleado().subscribe(
      (data : any) =>{
        this.listadoEmpleado = data;
    },error => {
      console.log(error)
    }
  );
   }

   tabla: string = "";
   detalless: string = "collapse";
   edit: string = "collapse";

  esta_Id?: number = 0;
  empl_DNI?:string = "";   
  empl_Nombre?:string = "";   
  empl_Apellido?:string = "";   
  empl_Sexo?:string = "";   
  esta_Descripcion?:string = "";  
  carg_Descripcion?:string = "";  
  usua_Creacion?:string = "";   
  empl_Fecha_Creacion?:string ="";    
  usua_Modifica?:string ="";   
  empl_Fecha_Modifica?:string = "";  

  detalles(codigo){
    this.tabla = "collapse";
    this.detalless = "";
    this.service.getFill(codigo).subscribe({
        next: (data: Fill) => {
          this.empl_DNI = data.empl_DNI;
          this.empl_Nombre = data.empl_Nombre;
          this.empl_Apellido = data.empl_Apellido;
          this.empl_Sexo = data.empl_Sexo; 
          this.esta_Descripcion = data.esta_Descripcion; 
          this.carg_Descripcion = data.carg_Descripcion; 
          this.usua_Creacion = data.usua_Creacion;
          this.empl_Fecha_Creacion = data.empl_Fecha_Creacion;
          this.usua_Modifica = data.usua_Modifica;
          this.empl_Fecha_Modifica = data.empl_Fecha_Modifica;
        }
      });
  }

  volver(){
    this.tabla = "";
    this.detalless = "collapse";
  }

  onDepartmentChange(departmentId) {
    if (departmentId !== '0') {
      this.service.getMunicipios(departmentId).subscribe(
        (data: any) => {
          this.municipios = data;
          console.log(data);
          this.formEmpleado.get('municipio').setValue('0'); 
        },
        error => {
          console.error('Error fetching municipios:', error);
        }
      );
    } else {
      this.municipios = []; // Clear municipios if the department is invalid or reset
    }
  }

  Crear() {
    this.creationGuard.allow();
    this.router.navigate(['/app/CrearEmpleados']);
  }

getSucursal() {
  this.service.getEmpleado().subscribe(
    (data: any) => {
      this.empleado = data;
    },
    error => {
      console.log(error);
    }
  );

  this.service.getCargos().subscribe(data => {
    this.cargos = data;
  });

  this.service.getEstados().subscribe(data => {
    this.estados = data;
  });

  this.service.getDepartamento().subscribe(data => {
    this.departamentos = data;
  });

}

Regresar() {
  // Lógica de autenticación (por ejemplo, verificación de credenciales)
  console.log("se hizo click");
  this.tabla = "";
  this.detalless = "collapse";
  this.edit = "collapse";
   // Ajusta la ruta según tu configuración de enrutamiento
}

editar(departamento: any) {
  this.selectedDepartamento = departamento;
  console.log(this.selectedDepartamento);
  // Usar el nombre del departamento en lugar del código
  this.formEmpleado = this.fb.group({

    dni:[departamento.empl_DNI],
    nombre:[departamento.empl_Nombre],
    apellido:[departamento.empl_Apellido],
    sexo:[departamento.empl_Sexo],
    departamento:[departamento.dept_Id],
    municipio:[departamento.muni_Id],
    cargo:[departamento.carg_Id],
    estado:[departamento.esta_Id],
    correo:[departamento.empl_Correo],

  });

  this.MunicipioCodigo = departamento.muni_Id;
  this.service.getMunicipios(departamento.dept_Id).subscribe(
    (data: any) => {
      this.municipios = data; 
      this.formEmpleado.get('municipio').setValue(this.MunicipioCodigo); 
    }
  );

  this.tabla = "collapse";
  this.detalless = "collapse";
  this.edit = "";
  this.modalTitle = 'Editar Registro';
  this.modalButtonLabel = 'Actualizar';
  this.display = true;
}

actualizar() {
  const idDepartamento = this.selectedDepartamento.empl_Id;
  console.log("Se hizo click")
  const modelo: Empleado = {
    carg_Descripcion: "", 
    carg_Id: this.formEmpleado.value.cargo, 
    dept_Id: this.formEmpleado.value.departamento, 
    empl_Apellido: this.formEmpleado.value.apellido, 
    empl_DNI: this.formEmpleado.value.dni, 
    empl_Id: idDepartamento, 
    empl_Nombre: this.formEmpleado.value.nombre, 
    empl_Sexo: this.formEmpleado.value.sexo, 
    esta_Descripcion: "", 
    esta_Id: this.formEmpleado.value.estado, 
    muni_Id: this.formEmpleado.value.municipio, 
    empl_Correo: this.formEmpleado.value.correo,
  }
  this._Empleadoservice.actualizar(idDepartamento, modelo).subscribe({
    next: (data) => {
      this.getSucursal();
      this.display = false;
    },
    error: (e) => {
      console.log(e);
    }
  })
}

confirmacionVisible: boolean = false;
departamentoAEliminar: Empleado | null = null;

confirmarEliminar(departamento: Empleado) {
  this.departamentoAEliminar = departamento;
  this.confirmacionVisible = true;
}

eliminar() {
  if (this.departamentoAEliminar) {
    const idDepartamento = this.departamentoAEliminar.empl_Id;
    this.service.eliminar(idDepartamento).subscribe({
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

  ngOnInit(): void {
    this.service.getEmpleado().subscribe(
      (data: any) => {
        console.log(data);
        this.empleado = data;
        console.log(this.empleado);
      },
       error => {
        console.log(error);
      }
    );

    this.service.getCargos().subscribe(data => {
      this.cargos = data;
    });

    this.service.getEstados().subscribe(data => {
      this.estados = data;
    });
  
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
  declarations: [EmpleadosListadoComponent]
})
export class EmpleadosListadoModule {}
