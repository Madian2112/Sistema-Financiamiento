import { Component,OnInit, NgModule } from '@angular/core';
import { Router } from '@angular/router';
import { Cliente, Fill} from '../../../models/ClienteViewModel';
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
import { EstadoCivil } from '../../../models/EstadoCivilViewModel';
import { CreationGuard } from '../../../service/autguardUrl';

@Component({
  selector: 'app-clientes-listado',
  templateUrl: './clientes-listado.component.html',
  styleUrls: ['./clientes-listado.component.scss']
})
export class ClientesListadoComponent implements OnInit {

  cliente!: Cliente[];
  displ: boolean= true;
  display: boolean = false;
  estados!: EstadoCivil[];
  departamentos!: Departamento[];
  formClientes: FormGroup;
  listadoCliente: Cliente[] = [];
  municipios: any[] = [];
  selectedDepartamento: any;
  modalTitle: string = 'Nuevo Registro';
  modalButtonLabel: string = 'Guardar';
  MunicipioCodigo: String = "";

  constructor(    private service:  ClienteServiceService, 
    private router: Router ,
    private fb:FormBuilder,
    private _Clienteservice:ClienteServiceService,
    private dialog: MatDialog,
    private creationGuard: CreationGuard
  ) 
  {
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
  

  tabla: string = "";
  detalless: string = "collapse";
  edit: string = "collapse";

  esta_Id?: number = 0;
  clie_DNI?:string = "";   
  clie_Nombre?:string = "";   
  clie_Apellido?:string = "";   
  clie_Sexo?:string = "";   
  esta_Descripcion?:string = "";  
  usua_Creacion?:string = "";   
  clie_Fecha_Creacion?:string ="";    
  usua_Modifica?:string ="";   
  clie_Fecha_Modifica?:string = "";  

  detalles(codigo){
    this.tabla = "collapse";
    this.detalless = "";
    this.service.getFill(codigo).subscribe({
        next: (data: Fill) => {
          this.clie_DNI = data.clie_DNI;
          this.clie_Nombre = data.clie_Nombre;
          this.clie_Apellido = data.clie_Apellido;
          this.clie_Sexo = data.clie_Sexo; 
          this.esta_Descripcion = data.esta_Descripcion;  
          this.usua_Creacion = data.usua_Creacion;
          this.clie_Fecha_Creacion = data.clie_Fecha_Creacion;
          this.usua_Modifica = data.usua_Modifica;
          this.clie_Fecha_Modifica = data.clie_Fecha_Modifica;
        }
      });
  }

  volver(){
    this.tabla = "";
    this.detalless = "collapse";
  }

  Crear() {
    this.creationGuard.allow();
    this.router.navigate(['/app/CrearClientes']);
  }

getSucursal() {
  this.service.getCliente().subscribe(
    (data: any) => {
      this.cliente = data;
    },
    error => {
      console.log(error);
    }
  );
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
  this.formClientes = this.fb.group({
    dni:[departamento.clie_DNI],
    nombre:[departamento.clie_Nombre],
    apellido:[departamento.clie_Apellido],
    numero:[departamento.clie_Telefono],
    sexo:[departamento.clie_Sexo],
    departamento:[departamento.dept_Id],
    municipio:[departamento.muni_Id],
    estado:[departamento.esta_Id]

  });

  this.MunicipioCodigo = departamento.muni_Id;
  this.service.getMunicipios(departamento.dept_Id).subscribe(
    (data: any) => {
      this.municipios = data; 
      this.formClientes.get('municipio').setValue(this.MunicipioCodigo); 
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
  const idDepartamento = this.selectedDepartamento.clie_Id;
  console.log("Se hizo click")
  const modelo: Cliente = {
    clie_Apellido: this.formClientes.value.apellido,
    clie_DNI: this.formClientes.value.dni, 
    clie_Id: idDepartamento, 
    clie_Nombre: this.formClientes.value.nombre, 
    clie_Sexo: this.formClientes.value.sexo, 
    clie_Telefono: this.formClientes.value.numero, 
    esta_Descripcion: "", 
    esta_Id: this.formClientes.value.estado, 
    muni_Id: this.formClientes.value.municipio,
    dept_Id: this.formClientes.value.departamento
  }
  this._Clienteservice.actualizar(idDepartamento, modelo).subscribe({
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
departamentoAEliminar: Cliente | null = null;

confirmarEliminar(departamento: Cliente) {
  this.departamentoAEliminar = departamento;
  this.confirmacionVisible = true;
}

eliminar() {
  if (this.departamentoAEliminar) {
    const idDepartamento = this.departamentoAEliminar.clie_Id;
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
    this.service.getCliente().subscribe(
      (data: any) => {
        console.log(data);
        this.cliente = data;
        console.log(this.cliente);
      },
       error => {
        console.log(error);
      }
    );

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
  declarations: [ClientesListadoComponent]
})
export class ClientesListadoModule {}
