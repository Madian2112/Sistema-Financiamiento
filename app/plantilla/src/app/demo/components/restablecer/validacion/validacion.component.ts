import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { UsuarioServiceService } from '../../../service/usuario_service';
import { Login } from '../../../models/loginViewModel';
import { Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { MessageService } from 'primeng/api';

@Component({
  selector: 'app-validacion',
  templateUrl: './validacion.component.html',
  styleUrls: ['./validacion.component.scss'],
  providers: [MessageService]
})
export class ValidacionComponent {
  loginForm: FormGroup;
  errorMessage: string;

  constructor(
    private formBuilder: FormBuilder,
    private service: UsuarioServiceService,
    private router: Router,
    private cookieService: CookieService,
    private messageService: MessageService
  ) {
    this.loginForm = this.formBuilder.group({
      usuario: ['', [Validators.required, Validators.minLength(1)]]
    });
  }

  onSubmit(): void {
    const errorSpan = document.getElementById('error-span');
    const validarusu = document.getElementById('validarusu');

    if (this.loginForm.get('usuario').value === '') {
      validarusu.classList.remove('collapse');
    } else {
      validarusu.classList.add('collapse');
    }

    if (this.loginForm.get('usuario').value !== '') {
      if (this.loginForm.valid) {
        const loginData: Login = this.loginForm.value;
        this.service.getcorreo(loginData).subscribe(
          response => {
            if (response.code === 200) {
              this.cookieService.set('namee', response.data.empl_Nombre);
              this.messageService.add({ severity: 'success', summary: 'Éxito', detail: 'Correo enviado', life: 3000 });
              this.router.navigate(['/reestablecer1']);
            } else {
              errorSpan.classList.remove('collapse');
              this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se pudo enviar el correo', life: 3000 });
            }
          },
          error => {
            errorSpan.classList.remove('collapse');
            this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se pudo enviar el correo', life: 3000 });
          }
        );
      } else {
        console.log('Formulario inválido');
      }
    }
  }
}
