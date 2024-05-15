import { Injectable } from '@angular/core';

@Injectable({
    providedIn: 'root'
})
export class AuthService {
    private static readonly USUARIO_KEY = 'usuarioLogueado';

    setUsuarioLogueado(usuario: string) {
        localStorage.setItem(AuthService.USUARIO_KEY, usuario);
    }

    getUsuarioLogueado(): string {
        return localStorage.getItem(AuthService.USUARIO_KEY) || '';
    }

    clearUsuarioLogueado() {
        localStorage.removeItem(AuthService.USUARIO_KEY);
    }
}
