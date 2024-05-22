import { NgModule } from '@angular/core';
import { HashLocationStrategy, LocationStrategy, PathLocationStrategy } from '@angular/common';
import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { AppLayoutModule } from './layout/app.layout.module';
import { NotfoundComponent } from './demo/components/notfound/notfound.component';
import { ProductService } from './demo/service/product.service';
import { CountryService } from './demo/service/country.service';
import { CustomerService } from './demo/service/customer.service';
import { EventService } from './demo/service/event.service';
import { IconService } from './demo/service/icon.service';
import { NodeService } from './demo/service/node.service';
import { PhotoService } from './demo/service/photo.service';
import { provideAnimationsAsync } from '@angular/platform-browser/animations/async';
import {ReactiveFormsModule} from '@angular/forms';
import {HttpClientModule} from '@angular/common/http';
import {MatDialogModule} from '@angular/material/dialog';
import {MatButtonModule} from '@angular/material/button';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import {BrowserModule} from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { ChartModule } from 'primeng/chart';
import { Component } from '@angular/core';
import { AvatarModule } from 'primeng/avatar';
import { BadgeModule } from 'primeng/badge';
// import { LoginComponent } from "./demo/components/auth/login/login.component";


import { CookieService } from 'ngx-cookie-service';
@NgModule({
    declarations: [AppComponent, NotfoundComponent ],
    imports: [
        AppRoutingModule, 
        AppLayoutModule,
        AvatarModule, 
        BadgeModule,
        MatButtonModule,
        ReactiveFormsModule,
        HttpClientModule,
        MatDialogModule,
        BrowserModule,
        BrowserAnimationsModule,
        FormsModule,
        ChartModule,
        AppLayoutModule 
    ],
    providers: [
        { provide: LocationStrategy, useClass: PathLocationStrategy },
        CountryService, CustomerService, EventService, IconService, NodeService,
        PhotoService,  AppLayoutModule, ProductService,CookieService, provideAnimationsAsync()
    ],
    bootstrap: [AppComponent],
})
export class AppModule {}
