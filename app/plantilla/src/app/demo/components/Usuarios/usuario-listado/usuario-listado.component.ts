import { Component, OnInit, NgModule } from '@angular/core';
import { Router } from '@angular/router';
import { Usuario, Fill } from '../../../models/UsuarioViewModel';
import { Empleado } from '../../../models/EmpleadoViewModel';
import { Rol } from '../../../models/RolViewModel';
import { UsuarioServiceService } from '../../../service/usuario_service';
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
import { MatDialog } from '@angular/material/dialog';
import { MatButtonModule } from '@angular/material/button';
import { AdminStatusPipe } from '../../../../admin-status.pipe';

@Component({
  selector: 'app-usuario-listado',
  templateUrl: './usuario-listado.component.html',
  styleUrls: ['./usuario-listado.component.scss']
})
export class UsuarioListadoComponent implements OnInit {

  usuario!: Usuario[];
  empleados!: Empleado[];
  roles!: Rol[];
  formUsuarioC: FormGroup;
  formRestablecer: FormGroup; 
  listadoUsuario: Usuario[] = [];
  selectedDepartamento: any;
  modalTitle: string = 'Nuevo Registro';
  modalButtonLabel: string = 'Guardar';
  municipios: any[] = [];
  MunicipioCodigo: String = "";
  display: boolean = false;
  restablecerVisible: boolean = false; 

  Crear() {

    console.log("se hizo click");

    this.router.navigate(['/app/CrearUsuarios']); 
}

  constructor(
    private service: UsuarioServiceService,
    private router: Router,
    private fb: FormBuilder,
    private _Usuarioservice: UsuarioServiceService,
    private messageService: MessageService, // Inyectar el MessageService
    private dialog: MatDialog
  ) {
    this.formUsuarioC = this.fb.group({
      Usuario: ["", Validators.required],
      Claveee: ["", Validators.required],
      empleadooo: ["Seleccione"],
      rolll: ["Seleccione"],
      number: [0],
    });

    this.formRestablecer = this.fb.group({
      usua_Contra: ["", Validators.required]
    });

    this._Usuarioservice.getUsuarios().subscribe(
      (data: any) => {
        this.listadoUsuario = data;
      }, error => {
        console.log(error)
      }
    );
  }

  tabla: string = "";
  detalless: string = "collapse";
  edit: string = "collapse";

  usua_Id?: number = 0;
  usua_Usuario?: string = "";
  empleado?: string = "";
  rol_Descripcion?: string = "";
  usua_Admin?: number = 0;
  usua_Creacion?: string = "";
  usua_Fecha_Creacion?: string = "";
  usua_Modifica?: string = "";
  usua_Fecha_Modifica?: string = "";

  detalles(codigo) {
    this.tabla = "collapse";
    this.detalless = "";
    this.service.getFill(codigo).subscribe({
      next: (data: Fill) => {
        this.usua_Id = data.usua_Id;
        this.usua_Usuario = data.usua_Usuario;
        this.empleado = data.empleado;
        this.rol_Descripcion = data.rol_Descripcion;
        this.usua_Admin = data.usua_Admin;
        this.usua_Creacion = data.usua_Creacion;
        this.usua_Fecha_Creacion = data.usua_Fecha_Creacion;
        this.usua_Modifica = data.usua_Modifica;
        this.usua_Fecha_Modifica = data.usua_Fecha_Modifica;
      }
    });
  }

  volver() {
    this.tabla = "";
    this.detalless = "collapse";
  }

  Regresar() {
    console.log("se hizo click");
    this.tabla = "";
    this.detalless = "collapse";
    this.edit = "collapse";
  }

  getUsuarios() {
    this.service.getUsuarios().subscribe(
      (data: any) => {
        this.usuario = data;
      },
      error => {
        console.log(error);
      }
    );
  }

  confirmacionVisible: boolean = false;
  departamentoAEliminar: Usuario | null = null;

  confirmarEliminar(departamento: Usuario) {
    this.departamentoAEliminar = departamento;
    this.confirmacionVisible = true;
  }

  eliminar() {
    if (this.departamentoAEliminar) {
      const idDepartamento = this.departamentoAEliminar.usua_Id;
      this.service.eliminar(idDepartamento).subscribe({
        next: (data) => {
          this.getUsuarios();
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

  editar(departamento: any) {
    this.selectedDepartamento = departamento;
    console.log(this.selectedDepartamento);
    this.formUsuarioC = this.fb.group({
      Usuario: [departamento.usua_Usuario],
      empleadooo: [departamento.empl_Id],
      rolll: [departamento.rol_Id],
      number: [departamento.usua_Admin]
    });

    this.tabla = "collapse";
    this.detalless = "collapse";
    this.edit = "";
    this.modalTitle = 'Editar Registro';
    this.modalButtonLabel = 'Actualizar';
    this.display = true;
  }

  actualizar() {
    const idDepartamento = this.selectedDepartamento.usua_Id;
    const modelo: Usuario = {
      empl_Id: this.formUsuarioC.value.empleadooo,
      empleado: "",
      rol_Descripcion: "",
      rol_Id: this.formUsuarioC.value.rolll,
      usua_Admin: this.formUsuarioC.value.number,
      usua_Contra: "d",
      usua_Id: idDepartamento,
      usua_Usuario: this.formUsuarioC.value.Usuario,
    }
    this._Usuarioservice.actualizar(idDepartamento, modelo).subscribe({
      next: (data) => {
        this.getUsuarios();
        this.display = false;
      },
      error: (e) => {
        console.log(e);
      }
    })
  }

  restablecerContrasena(usuario: Usuario) {
    this.selectedDepartamento = usuario;
    this.restablecerVisible = true;
  }

  cancelarRestablecer() {
    this.restablecerVisible = false;
  }

  guardarRestablecer() {
    const idUsuario = this.selectedDepartamento.usua_Id;
    const nuevaContraseña = this.formRestablecer.value.usua_Contra;
    this._Usuarioservice.restablecerContraseña(idUsuario, nuevaContraseña).subscribe({
      next: (data) => {
        this.messageService.add({ severity: 'success', summary: 'Éxito', detail: 'Contraseña restablecida correctamente' });
        this.getUsuarios();
        this.restablecerVisible = false;
      },
      error: (e) => {
        this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Error al restablecer la contraseña' });
        console.log(e);
      }
    })
  }

  ngOnInit(): void {
    this.service.getUsuarios().subscribe(
      (data: any) => {
        console.log(data);
        this.usuario = data;
        console.log(this.usuario);
      },
      error => {
        console.log(error);
      }
    );

    this.service.getRoles().subscribe(data => {
      this.roles = data;
    });

    this.service.getEmpleado().subscribe(data => {
      this.empleados = data;
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
  ],
  declarations: [UsuarioListadoComponent, AdminStatusPipe],
  providers: [MessageService]
})
export class UsuariosListadoModule { }
