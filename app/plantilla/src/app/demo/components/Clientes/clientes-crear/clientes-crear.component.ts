import { Component, OnInit, NgModule } from '@angular/core';
import { Router } from '@angular/router';
import { Cliente } from '../../../models/ClienteViewModel';
import { dropMunicipio } from '../../../models/MunicipioViewModel';
import { EstadoCivil } from '../../../models/EstadoCivilViewModel';
import { ClienteServiceService } from '../../../service/cliente_service';
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
  selector: 'app-clientes-crear',
  templateUrl: './clientes-crear.component.html',
  styleUrls: ['./clientes-crear.component.scss']
})
export class ClientesCrearComponent implements OnInit  {

  displ: boolean= true;
  display: boolean = false;
  cliente!: Cliente[];
  estados!: EstadoCivil[];
  departamentos!: Departamento[];
  formClientes: FormGroup;
  listadoCliente: Cliente[] = [];
  municipios: any[] = [];

  constructor
  ( 
    private service:  ClienteServiceService, 
    private router: Router ,
    private fb:FormBuilder,
    private _Clienteservice:ClienteServiceService,
    private dialog: MatDialog,    
  ){
    this.formClientes = this.fb.group({
      dni:[""],
      nombre:["",],
      apellido:[""],
      numero:[""],
      sexo:[""],
      departamento:["Seleccione"],
      municipio:["",],
      estado:["Seleccione"],
    })

    this._Clienteservice.getCliente().subscribe(
      (data : any) =>{
        this.listadoCliente = data;
    },error => {
      console.log(error)
    }
  );
  }

  Regresar() {
    // Lógica de autenticación (por ejemplo, verificación de credenciales)
    console.log("se hizo click");
    // Si la autenticación es exitosa, redirige al usuario a la página de dashboard
    this.router.navigate(['/app/cliente']); // Ajusta la ruta según tu configuración de enrutamiento
}

onDepartmentChange(departmentId) {
  if (departmentId !== '0') {
    this.service.getMunicipios(departmentId).subscribe(
      (data: any) => {
        this.municipios = data;
        console.log(data);
        this.formClientes.get('municipio').setValue('0'); 
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
  console.log(this.formClientes.value);
    const cliente: Cliente = {
      clie_DNI: this.formClientes.value.dni,
      clie_Apellido: this.formClientes.value.apellido, 
      clie_Id: 0,
      clie_Nombre: this.formClientes.value.nombre, 
      clie_Sexo: this.formClientes.value.sexo, 
      clie_Telefono: this.formClientes.value.numero, 
      esta_Descripcion: "", 
      esta_Id: this.formClientes.value.estado, 
      muni_Id: this.formClientes.value.municipio,
      dept_Id: this.formClientes.value.depar
    }
    this.formClientes = this.fb.group({
      dni:[""],
      nombre:["",],
      apellido:[""],
      numero:[""],
      sexo:[""],
      departamento:["Seleccione"],
      municipio:[""],
      estado:["Seleccione"],
    })
    // Llamar al servicio solo si los valores necesarios están definidos
    this._Clienteservice.agregar(cliente).subscribe({
      next: (data) => {
        this.service.getCliente().subscribe(
          (data: any) => {
            console.log(data);
            this.cliente = data;
            console.log(this.cliente);
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
  declarations: [ClientesCrearComponent]
})
export class ClientesListadoModule {}

