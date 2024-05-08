import { Component,  OnInit, NgModule } from '@angular/core';
import { Router } from '@angular/router';
import { Usuario } from '../../../models/UsuarioViewModel';
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
import {DialogAddEditComponent} from 'src/app/demo/Dialogs/dialog-add-edit/dialog-add-edit.component';
import { MatDialog} from '@angular/material/dialog';
import {MatButtonModule} from '@angular/material/button';


@Component({
  selector: 'app-usuario-crear',
  templateUrl: './usuario-crear.component.html',
  styleUrls: ['./usuario-crear.component.scss']
})

export class UsuarioCrearComponent implements OnInit {
  displ: boolean= true;
  display: boolean = false;
  usuario!: Usuario[];
  empleados!: Empleado[];
  roles!: Rol[];
  formUsuarioC: FormGroup;
  listadoUsuario: Usuario[] = [];

  constructor
  ( 
    private service:  UsuarioServiceService, 
    private router: Router ,
    private fb:FormBuilder,
    private _Usuarioservice:UsuarioServiceService,
    private dialog: MatDialog,    
  ) {

    this.formUsuarioC = this.fb.group({
      Usuario:["",Validators.required],
      Claveee:["",Validators.required],
      empleadooo:["Seleccione"],
      rolll:["Seleccione"],
      number:[0],
     
    })

    this._Usuarioservice.getUsuarios().subscribe(
      (data : any) =>{
        this.listadoUsuario = data;
    },error => {
      console.log(error)
    }
  );
  }

  Regresar() {
    // Lógica de autenticación (por ejemplo, verificación de credenciales)
    console.log("se hizo click");
    // Si la autenticación es exitosa, redirige al usuario a la página de dashboard
    this.router.navigate(['/app/IndexUsuario']); // Ajusta la ruta según tu configuración de enrutamiento
}

Nuevo() {
  console.log(this.formUsuarioC.value);
  console.log(this.formUsuarioC.value.empleado +' ' + this.formUsuarioC.value.rol);
    const usuario: Usuario = {
      usua_Id: 0,
      empl_Id: this.formUsuarioC.value.empleadooo,
      usua_Usuario: this.formUsuarioC.value.Usuario,
      empleado: "",
      rol_Descripcion: "",
      rol_Id: this.formUsuarioC.value.rolll,
      usua_Admin: this.formUsuarioC.value.number,
      usua_Contra: this.formUsuarioC.value.Claveee,
    }
    // Llamar al servicio solo si los valores necesarios están definidos
    this._Usuarioservice.agregar(usuario).subscribe({
      next: (data) => {
        this.service.getUsuarios().subscribe(
          (data: any) => {
            console.log(data);
            this.usuario = data;
            console.log(this.usuario);
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
    this.formUsuarioC = this.fb.group({
      Usuario:[""],
      Claveee:[""],
      empleadooo:["Seleccione"],
      rolll:["Seleccione"],
      number:[0],
     
    })
  };



ngOnInit(): void {

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
      DialogAddEditComponent
  ],
  declarations: [UsuarioCrearComponent]
})
export class TipoCuotasListadoModule {}
