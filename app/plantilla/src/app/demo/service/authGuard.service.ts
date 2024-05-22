import {HttpClient} from '@angular/common/http';
import { Observable } from 'rxjs';
import { Injectable } from '@angular/core';
import {UsuarioServiceService} from '../service/usuario_service'
import { CookieService } from 'ngx-cookie-service';
import { Router } from '@angular/router';

interface Pantalla {
    pant_Descripcion: string;
}

@Injectable({
    providedIn: 'root'
  })
  export class AuthService {
    private allowedScreens: Set<string> = new Set();
    private static readonly USUARIO_KEY = 'usuarioLogueado';
    private static readonly PERMISSIONS_KEY = 'allowedScreens';
  
    constructor(private http: HttpClient, private service: UsuarioServiceService,
                private cookieService: CookieService, private router: Router) {
      const storedPermissions = localStorage.getItem(AuthService.PERMISSIONS_KEY);
      if (storedPermissions) {
        this.allowedScreens = new Set(JSON.parse(storedPermissions));
      }
    }
  
    setUsuarioLogueado(usuario: string) {
      localStorage.setItem(AuthService.USUARIO_KEY, usuario);
    }
  
    getUsuarioLogueado(): string {
      return localStorage.getItem(AuthService.USUARIO_KEY) || '';
    }
  
    clearUsuarioLogueado() {
      localStorage.removeItem(AuthService.USUARIO_KEY);
      localStorage.removeItem(AuthService.PERMISSIONS_KEY);
    }
  
    loadPermissions(): void {
      const roleId = Number.parseInt(this.cookieService.get('roleID'));
  
      if (!roleId) {
        console.error('Role ID is not set or invalid.');
        return;
      }
  
      this.service.getPantallasDeRol(roleId).subscribe({
        next: (pantallas: Pantalla[]) => {
          this.allowedScreens = new Set(
            pantallas.map(pant =>
              pant.pant_Descripcion.toLowerCase().replace(/\s+/g, '')
            )
          );
          localStorage.setItem(AuthService.PERMISSIONS_KEY, JSON.stringify(Array.from(this.allowedScreens)));
        },
        error: (error) => {
          console.error('Error', error);
        }
      });
    }
  
    isUrlAllowed(url: string): boolean {
      const admin = this.cookieService.get('esAdmin').toString();
  
      if (url === '/app/login' || url === '/auth' || url === '/') {
        return true;
      }
  
      if (admin === "true") {
        return true;
      }
  
      const urlSegments = url.toLowerCase().split('/').filter(segment => segment.trim() !== '');
  
      const screenNameIndex = urlSegments.indexOf('app') + 1;
      if (screenNameIndex > 0 && screenNameIndex < urlSegments.length) {
        const screenName = urlSegments[screenNameIndex].trim();
        return this.allowedScreens.has(screenName);
      }
  
      return false;
    }
  
    isAuthenticated(): boolean {
      return this.cookieService.check('Usuario');
    }
  
    logout() {
      this.cookieService.deleteAll();
      this.clearUsuarioLogueado();
      this.router.navigate(['/']);
    }
  }
  