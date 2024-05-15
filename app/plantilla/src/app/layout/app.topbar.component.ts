import { Component, ElementRef, ViewChild } from '@angular/core';
import { MenuItem } from 'primeng/api';
import { LayoutService } from "./service/app.layout.service";
import { OverlayPanel } from 'primeng/overlaypanel';

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

    color: string | undefined;
    userName: string = 'Usuario';
    editMode: boolean = false;
    showPencil: boolean = true; // Agregamos una variable para controlar la visibilidad del lápiz

    constructor(public layoutService: LayoutService) { }

    showProfile(event: Event) {
        this.overlayPanel.toggle(event);
    }

    saveName() {
        if (this.userName.length >= 3) {
            console.log('Nombre de usuario actualizado:', this.userName);
            this.editMode = false; // Ocultar el input y mostrar solo el lápiz de nuevo
            this.showPencil = true; // Mostrar el lápiz nuevamente
        } else {
            console.error('El nombre de usuario no cumple con los requisitos.');
        }
    }

    editName() {
        this.editMode = true; // Mostrar el input para editar el nombre
        this.showPencil = false; // Ocultar el lápiz
    }
}
