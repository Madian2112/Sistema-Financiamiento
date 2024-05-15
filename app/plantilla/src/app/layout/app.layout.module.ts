import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { InputTextModule } from 'primeng/inputtext';
import { SidebarModule } from 'primeng/sidebar';
import { BadgeModule } from 'primeng/badge';
import { RadioButtonModule } from 'primeng/radiobutton';
import { InputSwitchModule } from 'primeng/inputswitch';
import { RippleModule } from 'primeng/ripple';
import { AppMenuComponent } from './app.menu.component';
import { AppMenuitemComponent } from './app.menuitem.component';
import { RouterModule } from '@angular/router';
import { AppTopBarComponent } from './app.topbar.component';
import { AppFooterComponent } from './app.footer.component';
import { AppConfigModule } from './config/config.module';
import { AppSidebarComponent } from "./app.sidebar.component";
import { AppLayoutComponent } from "./app.layout.component";
import { Component } from '@angular/core';
import { AvatarModule } from 'primeng/avatar';
import { ReactiveFormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';


import { OverlaysDemoComponent } from '../demo/components/uikit/overlays/overlaysdemo.component'; 
import { OverlaysDemoRoutingModule } from '../demo/components/uikit/overlays/overlaysdemo-routing.module';
import { ToastModule } from 'primeng/toast';
import { DialogModule } from 'primeng/dialog';
import { ButtonModule } from 'primeng/button';
import { OverlayPanelModule } from 'primeng/overlaypanel';
import { TableModule } from 'primeng/table';
import { ConfirmDialogModule } from 'primeng/confirmdialog';
import { ColorPickerModule } from 'primeng/colorpicker';
import { ConfirmPopupModule } from 'primeng/confirmpopup';
import { TooltipModule } from 'primeng/tooltip';




@NgModule({
    declarations: [
        AppMenuitemComponent,
        AppTopBarComponent,
        AppFooterComponent,
        AppMenuComponent,
        AppSidebarComponent,
        AppLayoutComponent,
      
    ],
    imports: [
        BrowserModule,
        FormsModule,
        HttpClientModule,
        BrowserAnimationsModule,
        InputTextModule,
        SidebarModule,
        BadgeModule,
        OverlaysDemoRoutingModule,
        RadioButtonModule,
        InputSwitchModule,
        ConfirmDialogModule,
        ReactiveFormsModule,
        RippleModule,
        RouterModule,
        
        AppConfigModule,
        AvatarModule,
         BadgeModule,
         SidebarModule, 
         ButtonModule,
         CommonModule,
		OverlaysDemoRoutingModule,
		ToastModule,
		DialogModule,
		TooltipModule,
		InputTextModule,
		ButtonModule,
		OverlayPanelModule,
		TableModule,
		ConfirmDialogModule,
		SidebarModule,
		RippleModule,
		ConfirmPopupModule,
        ColorPickerModule,
    ],
    exports: [AppLayoutComponent],
    providers: [],
    bootstrap: [AppLayoutComponent]
})
export class AppLayoutModule { }
