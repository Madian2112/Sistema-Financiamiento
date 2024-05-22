import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { UsuarioServiceService } from '../../../service/usuario_service';
import { Codigo } from '../../../models/loginViewModel';
import { Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-comparar',
  templateUrl: './comparar.component.html',
  styleUrls: ['./comparar.component.scss']
})
export class CompararComponent {
  compararForm: FormGroup;
  errorMessage: string;

  constructor(
    private formBuilder: FormBuilder,
    private compararservice: UsuarioServiceService,
    private router: Router,
    private cookieService: CookieService
  ) {
    this.compararForm = this.formBuilder.group({
      codigo: ['', [Validators.required, Validators.minLength(1)]]
    });
  }

  onSubmit(): void {
    const errorSpan = document.getElementById('error-span');
    const validarcodi = document.getElementById('validarcodi');

    if (this.compararForm.get('codigo').value === '') {
      validarcodi.classList.remove('collapse');
    } else {
      validarcodi.classList.add('collapse');
    }

    if (this.compararForm.get('codigo').value !== '') {
      if (this.compararForm.valid) {
        const codigoData: Codigo = this.compararForm.value;
        this.compararservice.getcodigo(codigoData).subscribe(
          response => {
            if (response.code === 200) {
              this.router.navigate(['/app/reestablecer1']);
            } else {
              errorSpan.classList.remove('collapse');
            }
          },
          error => {
            errorSpan.classList.remove('collapse');
          }
        );
      } else {
        console.log('Formulario inválido');
      }
    }
  }
}
