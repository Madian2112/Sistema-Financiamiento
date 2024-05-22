import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { UsuarioServiceService } from '../../../service/usuario_service';
import { Contra } from '../../../models/loginViewModel';
import { Router } from '@angular/router';
import { MessageService } from 'primeng/api';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-restablecer',
  templateUrl: './restablecer.component.html',
  styleUrls: ['./restablecer.component.scss'],
  providers: [MessageService]
})
export class RestablecerComponent implements OnInit {
  restaForm: FormGroup;
  isSubmit: boolean = false;

  constructor(
    private formBuilder: FormBuilder,
    private contraservice: UsuarioServiceService,
    private router: Router,
    private messageService: MessageService,
    private cookieService: CookieService
  ) {}

  ngOnInit() {


    // const errorSpan = document.getElementById('error-span');
    // const validarOtp = document.getElementById('validarOtp');

    // if (this.restaForm.get('usuario').value === '') {
    //   validarOtp.classList.remove('collapse');
    // } else {
    //   validarOtp.classList.add('collapse');
    // }
    
    this.restaForm = this.formBuilder.group({

      // usua_VerificarCorreo: ['', Validators.required],
      usua_Contra: ['', Validators.required],
      digit1: ['', [Validators.required, Validators.pattern('^[0-9]$')]],
      digit2: ['', [Validators.required, Validators.pattern('^[0-9]$')]],
      digit3: ['', [Validators.required, Validators.pattern('^[0-9]$')]],
      digit4: ['', [Validators.required, Validators.pattern('^[0-9]$')]],
      digit5: ['', [Validators.required, Validators.pattern('^[0-9]$')]],
      digit6: ['', [Validators.required, Validators.pattern('^[0-9]$')]]
    });
  }

  onSubmitEdit(): void {
    this.isSubmit = true;

    if (this.restaForm.valid) {
      const otpCode = this.restaForm.get('digit1').value +
                      this.restaForm.get('digit2').value +
                      this.restaForm.get('digit3').value +
                      this.restaForm.get('digit4').value +
                      this.restaForm.get('digit5').value +
                      this.restaForm.get('digit6').value;

      const ciudadData: Contra = {
        usua_VerificarCorreo: otpCode, 
        usua_Contra: this.restaForm.get('usua_Contra').value
      };

      this.contraservice.postrestablecer(ciudadData).subscribe(
        response => {
          if (response.code === 200) {
            this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Contraseña Reestablecida Exitosamente', life: 3000 });
            this.router.navigate(['/']);
          } else {
            this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se pudo reestablecer la contraseña', life: 3000 });
          }
        },
        error => {
          this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se pudo reestablecer la contraseña', life: 3000 });
          console.log(error);
        }
      );
    } else {
      console.log('Formulario inválido');

    }
  }
}
