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

  reestablecer() {
    this.router.navigate(['/reestablecer']); 
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
          this.cookieService.set('roleID', data[0].rol_Id);
          this.cookieService.set('esAdmin', data[0].usua_Admin);
          this.cookieService.set('Usuario', data[0].usua_Usuario);
          this.authService.setUsuarioLogueado(data[0].usua_Usuario);
          this.authService.loadPermissions(); // Cargar permisos
          this.userService.getFillPerfil(data[0].usua_Usuario).subscribe({
            next: (perfil) => {
              this.cookieService.set('usua_Color', perfil.usua_Color);
              this.router.navigate(['/app/inicio']);
            },
            error: (error) => {
              console.error('Error fetching user profile:', error);
              this.router.navigate(['/app/inicio']);
            }
          });
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
