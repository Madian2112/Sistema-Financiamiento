import { OnInit } from '@angular/core';
import { Component } from '@angular/core';
import { LayoutService } from './service/app.layout.service';

@Component({
    selector: 'app-menu',
    templateUrl: './app.menu.component.html'
})
export class AppMenuComponent implements OnInit {

    model: any[] = [];

    constructor(public layoutService: LayoutService) { }

    ngOnInit() {
        this.model = [
            {
                label: 'Inicio',
                items: [
                    { label: 'Inicio', icon: 'pi pi-fw pi-home', routerLink: ['/app/IndexEstadistico'] },
                    { label: 'Dashboard', icon: 'pi pi-fw pi-chart-pie', routerLink: ['/app/IndexPrueba'] },
                    // { label: 'Reportes', icon: 'pi pi-fw pi-file', routerLink: ['/app/IndexReportes'] },
                    // { label: 'Reporte Mensual', icon: 'pi pi-fw pi-file', routerLink: ['/app/IndexReporteMensual'] },
                    // { label: 'Reporte de Modelos', icon: 'pi pi-fw pi-file', routerLink: ['/app/IndexReporteModelos'] },
                    // { label: 'Reporte  de Estados Civiles', icon: 'pi pi-fw pi-file', routerLink: ['/app/IndexReporteEstadoCivil'] },
                    // { label: 'Reporte Por Sexo', icon: 'pi pi-fw pi-file', routerLink: ['/app/IndexReportesSexo'] },
                    {
                        label: 'Reportes',
                        icon: 'pi pi-fw pi-file',
                        items: [
                            // {
                            //     label: 'Reporte Prueba',
                            //     icon: 'pi pi-fw pi-file',
                            //     routerLink: ['/app/IndexReportes']
                            // },
                            {
                                label: 'Prestamos Aprobados',
                                icon: 'pi pi-fw pi-file',
                                routerLink: ['/app/IndexReportePrestamos']
                            },
                            // {
                            //     label: 'Modelos de Vehiculos',
                            //     icon: 'pi pi-fw pi-file',
                            //     routerLink: ['/app/IndexReporteModelosVehiculos']
                            // },
                            {
                                label: 'Ventas Hechas por Empleados',
                                icon: 'pi pi-fw pi-file',
                                routerLink: ['/app/IndexReporteVentasEmpleado']
                            },
                            {
                                label: 'Clientes en Mora',
                                icon: 'pi pi-fw pi-file',
                                routerLink: ['/app/IndexReporteClientesMora']
                            },
                            // {
                            //     label: 'Clientes en Mora',
                            //     icon: 'pi pi-fw pi-file',
                            //     routerLink: ['/app/IndexReporteClientesMora']
                            // },
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
                            {
                                label: 'Usuario',
                                icon: 'pi pi-fw pi-sign-in',
                                routerLink: ['/app/IndexUsuario']
                            },
                            {
                                label: 'Rol',
                                icon: 'pi pi-fw pi-sign-in',
                                routerLink: ['/app/IndexRol']
                            },
                        ]
                    },
                    {
                        label: 'General',
                        icon: 'pi pi-fw pi-user',
                        items: [
                            {
                                label: 'Departamento',
                                icon: 'pi pi-fw pi-sign-in',
                                routerLink: ['/app/IndexDepartamento']
                            },
                            {
                                label: 'Cargo',
                                icon: 'pi pi-fw pi-sign-in',
                                routerLink: ['/app/IndexCargo']
                            },
                            {
                                label: 'Estado Civil',
                                icon: 'pi pi-fw pi-sign-in',
                                routerLink: ['/app/IndexEstadoCivil']
                            },
                            {
                                label: 'Marca',
                                icon: 'pi pi-fw pi-sign-in',
                                routerLink: ['/app/IndexMarca']
                            },
                            {
                                label: 'Municipio',
                                icon: 'pi pi-fw pi-sign-in',
                                routerLink: ['/app/IndexMunicipio']
                            },
                            {
                                label: 'Sucursal',
                                icon: 'pi pi-fw pi-sign-in',
                                routerLink: ['/app/IndexSucursal']
                            },
                            {
                                label: 'Cliente',
                                icon: 'pi pi-fw pi-sign-in',
                                routerLink: ['/app/IndexCliente']
                            },
                            {
                                label: 'Empleado',
                                icon: 'pi pi-fw pi-sign-in',
                                routerLink: ['/app/IndexEmpleado']
                            },
                            {
                                label: 'Error',
                                icon: 'pi pi-fw pi-times-circle',
                                routerLink: ['/app/auth/error']
                            },
                            {
                                label: 'Access Denied',
                                icon: 'pi pi-fw pi-lock',
                                routerLink: ['/app/auth/access']
                            }
                        ]
                    },
                    {
                        label: 'CrediRapi',
                        icon: 'pi pi-fw pi-car',
                        items: [
                            {
                                label: 'Tipo de Cuota',
                                icon: 'pi pi-fw pi-sign-in',
                                routerLink: ['/app/IndexTipoCuota']
                            },
                            {
                                label: 'Modelo',
                                icon: 'pi pi-fw pi-sign-in',
                                routerLink: ['/app/IndexModelo']
                            },
                            {
                                label: 'Vehiculo',
                                icon: 'pi pi-fw pi-sign-in',
                                routerLink: ['/app/IndexVehiculo']
                            },
                            {
                                label: 'PlanPago',
                                icon: 'pi pi-fw pi-sign-in',
                                routerLink: ['/app/IndexPlanPago']
                            },
                        ]
                    },
                    {
                        label: 'Crud',
                        icon: 'pi pi-fw pi-pencil',
                        routerLink: ['/app/pages/crud']
                    },
                ]
            },
        ];
    }
}
