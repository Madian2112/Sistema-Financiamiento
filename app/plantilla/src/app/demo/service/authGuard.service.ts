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
    private allowedScreens: Set<string>;
    private static readonly USUARIO_KEY = 'usuarioLogueado';

    constructor(private http: HttpClient, private service: UsuarioServiceService,
        private cookieService: CookieService, private router: Router) {
      this.allowedScreens = new Set();
    }


    urlsPermitidas = this.service.rolurl + 'PantallaPorRol/'


    setUsuarioLogueado(usuario: string) {
      localStorage.setItem(AuthService.USUARIO_KEY, usuario);
  }

  getUsuarioLogueado(): string {
      return localStorage.getItem(AuthService.USUARIO_KEY) || '';
  }

  clearUsuarioLogueado() {
      localStorage.removeItem(AuthService.USUARIO_KEY);
  }
    loadPermissions(): void {
    const roleId = Number.parseInt(this.cookieService.get('roleID'));

        this.service.getPantallasDeRol(roleId).subscribe({
          next: (pantallas: Pantalla[]) => {

            if (roleId !== null) {
                const pantallaAdicional = {
                    pant_Descripcion: "empty",
                };
                pantallas.push(pantallaAdicional);
            }

            this.allowedScreens = new Set(
                pantallas.map(pant =>
                    pant.pant_Descripcion.toLowerCase().replace(/\s+/g, '')
                ));

            console.log("Allowed screens :", Array.from(this.allowedScreens));
          },
          error: (error) => {
            console.error('Error', error);
          }
        });
      }

      isUrlAllowed(url: string): boolean {

        const admin = this.cookieService.get('esAdmin').toString()

        if (admin === "true"){
            console.log("authh")

            return true;
        }

        const urlSegments = url.split('/').filter(segment => segment.trim() !== '');

        const screenNameIndex = urlSegments.indexOf('pages') + 1;
        if (screenNameIndex > 0 && screenNameIndex < urlSegments.length) {
            const screenName = urlSegments[screenNameIndex].toLowerCase().trim();
            console.log(`Screen name extracted: ${screenName}`);
            return this.allowedScreens.has(screenName);
        }

        this.router.navigate(['/login']);
        // window.location.reload();
      return false;
    }

 
  }
