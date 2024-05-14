import { Component } from '@angular/core';
import { LayoutService } from 'src/app/layout/service/app.layout.service';
import { UsuarioServiceService } from '../../../service/usuario_service';
import { Respuesta } from 'src/app/demo/models/ServiceResult';
import { Router } from '@angular/router';
import { ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
    selector: 'app-login',
    templateUrl: './login.component.html',
    styles: [`
        :host ::ng-deep .pi-eye,
        :host ::ng-deep .pi-eye-slash {
            transform:scale(1.6);
            margin-right: 1rem;
            color: var(--primary-color) !important;
        }
    `]
})

export class LoginComponent {

    valCheck: string[] = ['remember'];

    password!: string;
    formUsuario: FormGroup;
    loginvalidacion: string = "collapse";

    constructor(
        public layoutService: LayoutService, 
        private router: Router, 
        private fb: FormBuilder,
        private _usuarioservice: UsuarioServiceService
    ) 
    {
        this.formUsuario = this.fb.group({
            usuario: [""],
            clave: [""],
          });
    }

    Dashboard(){
        this.router.navigate(['dashboard']);
    };

    login() {

        this._usuarioservice.getLogin(this.formUsuario.get('usuario').value, this.formUsuario.get('clave').value).subscribe(
            (respuesta: Respuesta) => {
                console.log(respuesta.success)
                console.log(respuesta.data)
                console.log(respuesta.data.codeStatus)
                console.log(respuesta.message)
                console.log(respuesta.code)

                if(respuesta.message == "exito")
                {
                    this.loginvalidacion = "collapse";
                    this.router.navigate(['/app/IndexPrueba']);
                }

                else
                {
                    this.loginvalidacion = "";
                }
            },
            error => {
                console.error('Error al crear el rol:', error);
           
            }
        ); // Ajusta la ruta según tu configuración de enrutamiento
    }
}
