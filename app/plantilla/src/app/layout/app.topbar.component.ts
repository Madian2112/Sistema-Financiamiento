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
    originalUserName: string = 'Usuario'; 
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
        this.originalUserName = this.userName;
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
            this.cookieService.set('Usuario', this.userName);
            this.cookieService.set('usua_Color', this.color); 

        
            const perfilActualizado: FillPerfilUsuario = {
                usua_Usuario: this.userName,
                usua_Color: this.color
            };

            this.usuarioService.actualizarPerfil(this.originalUserName, perfilActualizado).subscribe({
                next: (response) => {
                    if (response.success) {
                        console.log('Perfil actualizado correctamente:', response);
                        this.originalUserName = this.userName; 
                    } else {
                        console.error('Error actualizando el perfil:', response.message);
                    }
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
        this.cookieService.set('usua_Color', this.color); 
    }

    logOut() {
        this.cookieService.deleteAll();
        window.location.reload();
  
        // this.router.navigate(['/app/Login']);
        window.location.replace('http:/');
    }
}
