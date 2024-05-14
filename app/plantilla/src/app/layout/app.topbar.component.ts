import { Component, ElementRef, ViewChild , OnDestroy, OnInit } from '@angular/core';
import { MenuItem } from 'primeng/api';
import { LayoutService } from "./service/app.layout.service";
import { ColorPickerModule } from 'primeng/colorpicker';


@Component({
    selector: 'app-topbar',
    templateUrl: './app.topbar.component.html',

    
})
export class AppTopBarComponent {

    items!: MenuItem[];

    @ViewChild('menubutton') menuButton!: ElementRef;

    @ViewChild('topbarmenubutton') topbarMenuButton!: ElementRef;

    @ViewChild('topbarmenu') menu!: ElementRef;
    sidebarVisible1: boolean = false;
    
    sidebarVisible2: boolean = false;
    
    sidebarVisible3: boolean = false;
    
    sidebarVisible4: boolean = false;
    
    color: string | undefined;
    display: boolean = false;

    visibleSidebar1: boolean = false;

    visibleSidebar2: boolean = false;

    visibleSidebar3: boolean = false;

    visibleSidebar4: boolean = false;

    visibleSidebar5: boolean = false;

    

    constructor(public layoutService: LayoutService) { }
}
