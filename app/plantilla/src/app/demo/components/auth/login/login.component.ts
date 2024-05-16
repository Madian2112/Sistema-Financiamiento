import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { UsuarioServiceService } from '../../../service/usuario_service';

import { CookieService } from 'ngx-cookie-service';
import { AuthService } from 'src/app/demo/service/authGuard.service';

@Component({
  selector: 'app-user-login',
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
  errorMessage: string = '';

  constructor(
    private router: Router,
    private userService: UsuarioServiceService,
    private cookieService: CookieService,
    private authService: AuthService,
    private fb: FormBuilder,
    private authServiceguard: AuthService,
  ) {
    this.formUsuario = this.fb.group({
      usuario: ['', Validators.required],
      clave: ['', Validators.required]
    });
  }

  onLogin() {
    if (this.formUsuario.invalid) {
      this.errorMessage = 'Usuario y clave son requeridos';
      return;
    }

    const { usuario, clave } = this.formUsuario.value;

    this.userService.getLogin(usuario, clave).subscribe({
      next: (data) => {
        if (Array.isArray(data) && data.length > 0) {
          console.log('Login successful', data);
          this.cookieService.set('roleID', data[0].rol_Id);
           
          this.cookieService.set('esAdmin', data[0].usua_Admin);
          this.cookieService.set('Usuario', data[0].usua_Usuario);

          console.log('Es admin:', data[0].usua_Admin);
          console.log('Nombre de Rol almacenado:', data[0].rol_Id);
          console.log('Nombre del Usuario almacenado:', data[0].usua_Usuario);
          this.authServiceguard.loadPermissions();  
          this.router.navigate(['/app/IndexPrueba']);
        } else {
          this.errorMessage = 'Usuario o contraseña incorrectos';
          console.error('Login failed: Incorrect credentials');
        }
      },
      error: (error) => {
        this.errorMessage = 'Error en la conexión con el servidor';
        console.error('Login failed:', error);
      }
    });
  }
}
