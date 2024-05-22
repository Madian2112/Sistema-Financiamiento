import { OnInit, OnDestroy } from '@angular/core';
import { Component } from '@angular/core';
import { LayoutService } from './service/app.layout.service';
import { AppLayoutComponent } from '../layout/app.layout.component';
import { UsuarioServiceService } from '../../../src/app/demo/service/usuario_service';
import { CookieService } from 'ngx-cookie-service';
import { Subscription } from 'rxjs';

@Component({
    selector: 'app-menu',
    templateUrl: './app.menu.component.html'
})
export class AppMenuComponent implements OnInit, OnDestroy {
    model: any[] = [];
    permisosPermitidos: Set<string> = new Set();
    private subscription: Subscription = new Subscription();

    constructor(
        public layoutService: LayoutService,
        public usuariosService: UsuarioServiceService,
        public cookieService: CookieService,
        private layoutComponent: AppLayoutComponent
    ) {}

    ngOnInit() {
        const admin = this.cookieService.get('esAdmin').toString();

       
        const storedPermissions = localStorage.getItem('allowedScreens');
        if (storedPermissions) {
            this.permisosPermitidos = new Set(JSON.parse(storedPermissions));
        }
        if (admin !== 'true') {
            const roleId = Number.parseInt(this.cookieService.get('roleID'));

            this.subscription.add(
                this.usuariosService.getPantallasDeRol(roleId).subscribe(pantallasPermitidas => {
                    const nombresPermitidos = new Set(
                        pantallasPermitidas
                            .map(pant => pant.pant_Descripcion ? pant.pant_Descripcion.toLowerCase().replace(/\s+/g, '') : '')
                            .filter(pantalla => pantalla !== '')
                    );

                    const filtrarItems = (items) => {
                        return items
                            .map(opcion => {
                                if (opcion.items) {
                                    const subItemsFiltrados = filtrarItems(opcion.items);
                                    if (subItemsFiltrados.length > 0) {
                                        return { ...opcion, items: subItemsFiltrados };
                                    }
                                } else if (nombresPermitidos.has(opcion.label.toLowerCase().replace(/\s+/g, ''))) {
                                    return opcion;
                                }
                                return null;
                            })
                            .filter(opcion => opcion !== null);
                    };

                    this.model = this.Menucompleto.map(section => {
                        const itemsFiltrados = filtrarItems(section.items);
                        if (itemsFiltrados.length > 0) {
                            return { ...section, items: itemsFiltrados };
                        }
                        return null;
                    }).filter(section => section !== null);
                })
            );
        } else {
            this.model = this.Menucompleto;
        }
    }

    ngOnDestroy() {
        this.subscription.unsubscribe();
    }

    Menucompleto = [
        {
            label: 'Principal',
            items: [
                { label: 'Inicio', icon: 'pi pi-fw pi-home', routerLink: ['/app/inicio'] },
                { label: 'Graficos', icon: 'pi pi-fw pi-chart-pie', routerLink: ['/app/graficos'] },
                {
                    label: 'Reportes',
                    icon: 'pi pi-fw pi-file',
                    items: [
                        { label: 'Prestamos Aprobados', icon: 'pi pi-fw pi-file', routerLink: ['/app/prestamosaprobados'] },
                        { label: 'Ventas Hechas por Empleados', icon: 'pi pi-fw pi-file', routerLink: ['/app/ventashechasporempleados'] },
                        { label: 'Clientes en Mora', icon: 'pi pi-fw pi-file', routerLink: ['/app/clientesenmora'] },
                    ]
                }
            ]
        },
        {
            label: 'Esquemas',
            icon: 'pi pi-fw pi-briefcase',
            items: [
                {
                    label: 'Acceso',
                    icon: 'pi pi-fw pi-lock',
                    items: [
                        { label: 'Usuarios', icon: 'pi pi-fw pi-sign-in', routerLink: ['/app/usuarios'] },
                        { label: 'Roles', icon: 'pi pi-fw pi-sign-in', routerLink: ['/app/roles'] },
                    ]
                },
                {
                    label: 'General',
                    icon: 'pi pi-fw pi-user',
                    items: [
                        { label: 'Departamento', icon: 'pi pi-fw pi-sign-in', routerLink: ['/app/departamento'] },
                        { label: 'Cargo', icon: 'pi pi-fw pi-sign-in', routerLink: ['/app/cargo'] },
                        { label: 'EstadoCivil', icon: 'pi pi-fw pi-sign-in', routerLink: ['/app/estadocivil'] },
                        { label: 'Marca', icon: 'pi pi-fw pi-sign-in', routerLink: ['/app/marca'] },
                        { label: 'Municipio', icon: 'pi pi-fw pi-sign-in', routerLink: ['/app/municipio'] },
                        { label: 'Sucursal', icon: 'pi pi-fw pi-sign-in', routerLink: ['/app/sucursal'] },
                        { label: 'Cliente', icon: 'pi pi-fw pi-sign-in', routerLink: ['/app/cliente'] },
                        { label: 'Empleado', icon: 'pi pi-fw pi-sign-in', routerLink: ['/app/empleado'] },
                        { label: 'Imagenes Clientes', icon: 'pi pi-fw pi-sign-in', routerLink: ['/app/imagenesclientes'] },
                        { label: 'Access Denied', icon: 'pi pi-fw pi-lock', routerLink: ['/app/auth/accessdenied'] },
                    ]
                },
                {
                    label: 'CrediRapi',
                    icon: 'pi pi-fw pi-car',
                    items: [
                        { label: 'Tipo de Cuota', icon: 'pi pi-fw pi-sign-in', routerLink: ['/app/tipodecuota'] },
                        { label: 'Modelo', icon: 'pi pi-fw pi-sign-in', routerLink: ['/app/modelo'] },
                        { label: 'Vehiculo', icon: 'pi pi-fw pi-sign-in', routerLink: ['/app/vehiculo'] },
                        { label: 'PlanPago', icon: 'pi pi-fw pi-sign-in', routerLink: ['/app/planpago'] },
                        { label: 'PlanPagoCliente', icon: 'pi pi-fw pi-sign-in', routerLink: ['/app/planpagocliente'] },
                    ]
                },
                { label: 'Cerrar Sesión', icon: 'pi pi-fw pi-sign-out', routerLink: ['/'] },
            ]
        }
    ];
}
