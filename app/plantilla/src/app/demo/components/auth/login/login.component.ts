import { Component } from '@angular/core';
import { LayoutService } from 'src/app/layout/service/app.layout.service';
import { Router } from '@angular/router';

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

    constructor(public layoutService: LayoutService, private router: Router) { }

    Dashboard(){
        this.router.navigate(['dashboard']);
    };

    login() {
        // Lógica de autenticación (por ejemplo, verificación de credenciales)
        console.log("se hizo click");
        // Si la autenticación es exitosa, redirige al usuario a la página de dashboard
        this.router.navigate(['/app/dashboard']); // Ajusta la ruta según tu configuración de enrutamiento
    }
}
