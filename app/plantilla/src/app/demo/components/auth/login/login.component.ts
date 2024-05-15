import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { FormBuilder, FormGroup } from '@angular/forms';
import { UsuarioServiceService } from '../../../service/usuario_service';
import { Respuesta } from 'src/app/demo/models/ServiceResult';
import { AuthService } from 'src/app/demo/service/AuthService'; 

@Component({
    selector: 'app-login',
    templateUrl: './login.component.html',
    styles: [`
        :host ::ng-deep .pi-eye,
        :host ::ng-deep .pi-eye-slash {
            transform: scale(1.6);
            margin-right: 1rem;
            color: var(--primary-color) !important;
        }
    `]
})
export class LoginComponent {
    formUsuario: FormGroup;
    loginvalidacion = true;

    constructor(
        private router: Router, 
        private fb: FormBuilder,
        private _usuarioservice: UsuarioServiceService,
        private authService: AuthService 
    ) {
        this.formUsuario = this.fb.group({
            usuario: [''],
            clave: ['']
        });
    }

    login() {
        const { usuario, clave } = this.formUsuario.value;

        this._usuarioservice.getLogin(usuario, clave).subscribe(
            (respuesta: Respuesta) => {
                if (respuesta.message === 'exito') {
                    this.loginvalidacion = true;
                    this.authService.setUsuarioLogueado(usuario);
                    this.router.navigate(['/app/IndexPrueba']);
                } else {
                    this.loginvalidacion = false;
                }
            },
            error => {
                console.error('Error al iniciar sesión:', error);
            }
        );
    }
}
