import { Component, NgModule, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Empleado } from '../../../models/EmpleadoViewModel';
import { dropMunicipio } from '../../../models/MunicipioViewModel';
import { Cargo } from '../../../models/CargoViewModel';
import { EstadoCivil } from '../../../models/EstadoCivilViewModel'
import { Rol } from '../../../models/RolViewModel';
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
import { Departamento } from 'src/app/demo/models/Departamentoviewmodel';

@Component({
  selector: 'app-empleados-crear',
  templateUrl: './empleados-crear.component.html',
  styleUrls: ['./empleados-crear.component.scss']
})
export class EmpleadosCrearComponent implements OnInit  {

  displ: boolean= true;
  display: boolean = false;
  empleado!: Empleado[];
  cargos!: Cargo[];
  estados!: EstadoCivil[];
  departamentos!: Departamento[];
  formEmpleado: FormGroup;
  listadoEmpleado: Empleado[] = [];
  municipios: any[] = [];

  constructor
  ( 
    private service:  EmpleadoServiceService, 
    private router: Router ,
    private fb:FormBuilder,
    private _Empleadoservice:EmpleadoServiceService,
    private dialog: MatDialog,    
  ){
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

  Regresar() {
    // Lógica de autenticación (por ejemplo, verificación de credenciales)
    console.log("se hizo click");
    // Si la autenticación es exitosa, redirige al usuario a la página de dashboard
    this.router.navigate(['/app/IndexEmpleado']); // Ajusta la ruta según tu configuración de enrutamiento
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

Nuevo() {
  console.log(this.formEmpleado.value);
    const empleado: Empleado = {
      empl_DNI: this.formEmpleado.value.dni,
      carg_Descripcion: this.formEmpleado.value.cargo,
      empl_Apellido: this.formEmpleado.value.apellido,
      empl_Nombre: this.formEmpleado.value.nombre,
      empl_Sexo: this.formEmpleado.value.sexo,
      empl_Id: 0,
      carg_Id: this.formEmpleado.value.cargo,
      esta_Descripcion: "", 
      esta_Id: this.formEmpleado.value.estado,
      muni_Id: this.formEmpleado.value.municipio,
      dept_Id: this.formEmpleado.value.departamento, 
      empl_Correo: this.formEmpleado.value.correo,
    }
    this.formEmpleado = this.fb.group({
      dni:[""],
      nombre:["",],
      apellido:[""],
      sexo:[""],
      departamento:["Seleccione"],
      municipio:[""],
      cargo:["Seleccione"],
      estado:["Seleccione"],
      correo: [""],
    })
    // Llamar al servicio solo si los valores necesarios están definidos
    this._Empleadoservice.agregar(empleado).subscribe({
      next: (data) => {
        this.service.getEmpleado().subscribe(
          (data: any) => {
            console.log(data);
            this.empleado = data;
            console.log(this.empleado);
            this.display = false;
          },
          error => {
            console.log(error);
          }
        );
      },
      error: (e) => {
        console.error(e);
      }
    })
  };

  ngOnInit(): void {

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
  declarations: [EmpleadosCrearComponent]
})
export class EmpleadosListadoModule {}

