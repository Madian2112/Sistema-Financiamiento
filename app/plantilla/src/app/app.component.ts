import { Component, OnInit } from '@angular/core';
import { PrimeNGConfig } from 'primeng/api';
import {Router} from '@angular/router';
import { AuthService } from './demo/service/authGuard.service';
@Component({
    selector: 'app-root',
    templateUrl: './app.component.html'
})
export class AppComponent implements OnInit {
    constructor(private authService: AuthService) {}
  
    ngOnInit(): void {
      this.authService.loadPermissions();
    }
  }
