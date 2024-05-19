import { Component, ElementRef, ViewChild, OnInit } from '@angular/core';
import { MenuItem } from 'primeng/api';
import { LayoutService } from "./service/app.layout.service";
import { OverlayPanel } from 'primeng/overlaypanel';
import { CookieService } from 'ngx-cookie-service';
import { Router } from '@angular/router';
import { UsuarioServiceService } from '../demo/service/usuario_service';
import { FillPerfilUsuario } from '../demo/models/UsuarioViewModel';

@Component({
    selector: 'app-topbar',
    templateUrl: './app.topbar.component.html'
})
export class AppTopBarComponent implements OnInit {
    items!: MenuItem[];

    @ViewChild('menubutton', { static: true }) menuButton!: ElementRef;
    @ViewChild('topbarmenubutton', { static: true }) topbarMenuButton!: ElementRef;
    @ViewChild('topbarmenu', { static: true }) menu!: ElementRef;
    @ViewChild('op', { static: true }) overlayPanel!: OverlayPanel;

    userName: string = 'Usuario';
    editMode: boolean = false;
    showPencil: boolean = true; 
    color: string = '#9c27b0';

    constructor(
        public layoutService: LayoutService,  
        private cookieService: CookieService, 
        private router: Router,
        private usuarioService: UsuarioServiceService
    ) { }

    ngOnInit() {
        this.userName = this.cookieService.get('Usuario') || 'Usuario';
        const savedColor = this.cookieService.get('usua_Color');
        if (savedColor) {
            this.color = savedColor;
        }
    }

    showProfile(event: Event) {
        this.overlayPanel.toggle(event);
    }

    saveName() {
        if (this.userName.length >= 3) {
            console.log('Nombre de usuario actualizado:', this.userName);
            this.editMode = false;
            this.showPencil = true;
            this.cookieService.set('Usuario', this.userName); // Guardar el nombre de usuario en las cookies
            this.cookieService.set('usua_Color', this.color); // Guardar el color en las cookies

            // Llamar al servicio para actualizar el perfil del usuario
            const perfilActualizado: FillPerfilUsuario = {
                usua_Usuario: this.userName,
                usua_Color: this.color
            };

            this.usuarioService.actualizarPerfil(this.userName, perfilActualizado).subscribe({
                next: (response) => {
                    console.log('Perfil actualizado correctamente:', response);
                },
                error: (error) => {
                    console.error('Error actualizando el perfil:', error);
                }
            });
        } else {
            console.error('El nombre de usuario no cumple con los requisitos.');
        }
    }

    editName() {
        this.editMode = true;
        this.showPencil = false;
    }

    onColorChange(event: any) {
        this.color = event;
        this.cookieService.set('usua_Color', this.color); // Guardar el color en las cookies
    }

    logOut() {
        this.cookieService.deleteAll();
        window.location.reload();
        // Alternativamente, usa Angular Router para navegar
        // this.router.navigate(['/app/Login']);
        window.location.replace('http:/');
    }
}
