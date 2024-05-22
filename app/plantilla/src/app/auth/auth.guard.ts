import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';
import { AuthService } from '../demo/service/authGuard.service';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {

  constructor(private authService: AuthService) {}

  canActivate(
    next: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {

    const url: string = state.url;

    if (url === '/' || url === '/auth' || url.startsWith('/app/login')) {
      return true;
    }

    if (this.authService.isAuthenticated()) {
      const isAllowed = this.authService.isUrlAllowed(url);
      if (isAllowed) {
        return true;
      } else {
        console.log(`Acceso denegado a la URL: ${url}`);
        window.location.replace('/');  // Reemplaza con la URL de tu página de login
        return false; // Importante: devuelve false para cancelar la navegación
      }
    } else {
      console.log('Usuario no autenticado');
      window.location.replace('/');  // Reemplaza con la URL de tu página de inicio de sesión
      return false; // Importante: devuelve false para cancelar la navegación
    }
  }
}
