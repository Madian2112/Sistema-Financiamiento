import { Component, ElementRef, ViewChild } from '@angular/core';
import { MenuItem } from 'primeng/api';
import { LayoutService } from "./service/app.layout.service";
import { OverlayPanel } from 'primeng/overlaypanel';
import { CookieService } from 'ngx-cookie-service';
import { Router } from '@angular/router';

@Component({
    selector: 'app-topbar',
    templateUrl: './app.topbar.component.html'
})
export class AppTopBarComponent {
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
        private router: Router
    ) { }

    showProfile(event: Event) {
        this.overlayPanel.toggle(event);
    }

    saveName() {
        if (this.userName.length >= 3) {
            console.log('Nombre de usuario actualizado:', this.userName);
            this.editMode = false;
            this.showPencil = true; 
        } else {
            console.error('El nombre de usuario no cumple con los requisitos.');
        }
    }

    editName() {
        this.editMode = true; 
        this.showPencil = false; 
    }

    onColorChange(event: any) {
        this.color = event.value;
    }

    logOut() {
        this.cookieService.deleteAll();
        window.location.reload();
        // Alternativamente, usa Angular Router para navegar
        // this.router.navigate(['/app/Login']);
        window.location.replace('http://localhost:52845');
    }
}
