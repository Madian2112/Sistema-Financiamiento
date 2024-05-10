import { RouterModule,  Routes} from '@angular/router';
import { NgModule } from '@angular/core';
import { NotfoundComponent } from './demo/components/notfound/notfound.component';
import { AppLayoutComponent } from "./layout/app.layout.component";
import { LoginComponent } from "./demo/components/auth/login/login.component";
import { DashboardModule } from "./demo/components/dashboard/dashboard.module";
import { DashboardComponent } from "./demo/components/dashboard/dashboard.component";
import { DepartamentoListadoComponent } from "./demo/components/Departamento/departamento-listado/departamento-listado.component";
import { CargosListadoComponent } from "./demo/components/Cargos/cargos-listado/cargos-listado.component";
import { EstadoscivilesListadoComponent } from "./demo/components/EstadosCiviles/estadosciviles-listado/estadosciviles-listado.component";
import { MarcasListadoComponent } from "./demo/components/Marcas/marcas-listado/marcas-listado.component";
import { MunicipiosListadoComponent } from "./demo/components/Municipios/municipios-listado/municipios-listado.component";
import { SucursalesListadoComponent } from "./demo/components/Sucursales/sucursales-listado/sucursales-listado.component";
import { ClientesListadoComponent } from "./demo/components/Clientes/clientes-listado/clientes-listado.component";
import { EmpleadosListadoComponent } from "./demo/components/Empleados/empleados-listado/empleados-listado.component";
import { UsuarioListadoComponent } from "./demo/components/Usuarios/usuario-listado/usuario-listado.component";
import { TipocuotaListadoComponent } from "./demo/components/TipoCuotas/tipocuota-listado/tipocuota-listado.component";
import { ModeloListadoComponent } from "./demo/components/Modelos/modelo-listado/modelo-listado.component";
import { VehiculoListadoComponent } from "./demo/components/Vehiculos/vehiculo-listado/vehiculo-listado.component";
import { PlanpagoListadoComponent } from "./demo/components/PlanesPagos/planpago-listado/planpago-listado.component";
import { UsuarioCrearComponent } from "./demo/components/Usuarios/usuario-crear/usuario-crear.component";
import { VehiculoCrearComponent } from "./demo/components/Vehiculos/vehiculo-crear/vehiculo-crear.component";
import { EmpleadosCrearComponent } from "./demo/components/Empleados/empleados-crear/empleados-crear.component";
import { ClientesCrearComponent } from "./demo/components/Clientes/clientes-crear/clientes-crear.component";
import { PlanpagoCrearComponent } from "./demo/components/PlanesPagos/planpago-crear/planpago-crear.component";
import {DashboardsComponent} from './demo/components/dashboards/dashboards.component';
import {RolListadoComponent} from './demo/components/Rol/rol-listado/rol-listado.component';
import {RolCreateComponent} from './demo/components/Rol/rol-create/rol-create.component';
import {ReportesComponent} from './demo/components/reportes/reportes.component';
import { ReportePrestamosAprobadosComponent } from './demo/components/reporte-prestamos-aprobados/reporte-prestamos-aprobados.component';
import { ReporteClientesMoraComponent } from './demo/components/reporte-clientes-mora/reporte-clientes-mora.component';
import { ReporteModelosVehiculosComponent } from './demo/components/reporte-modelos-vehiculos/reporte-modelos-vehiculos.component';
import { ReporteVentasEmpleadosComponent } from './demo/components/reporte-ventas-empleados/reporte-ventas-empleados.component';
import { EstadisticosComponent } from './demo/components/estadisticos/estadisticos.component';
import { PlanpagoclienteCrearComponent } from './demo/components/PlanesPagosClientes/planpagocliente-crear/planpagocliente-crear.component';


@NgModule({
    imports: [
        RouterModule.forRoot([
            {
                path: '', component: LoginComponent,
            },
            {
                path: 'app', component: AppLayoutComponent,
                children: [
                    { path: 'dashboard', loadChildren: () => import('./demo/components/dashboard/dashboard.module').then(m => m.DashboardModule) },
                    { path: 'uikit', loadChildren: () => import('./demo/components/uikit/uikit.module').then(m => m.UIkitModule) },
                    { path: 'utilities', loadChildren: () => import('./demo/components/utilities/utilities.module').then(m => m.UtilitiesModule) },
                    { path: 'documentation', loadChildren: () => import('./demo/components/documentation/documentation.module').then(m => m.DocumentationModule) },
                    { path: 'blocks', loadChildren: () => import('./demo/components/primeblocks/primeblocks.module').then(m => m.PrimeBlocksModule) },
                    { path: 'pages', loadChildren: () => import('./demo/components/pages/pages.module').then(m => m.PagesModule) },
                    { path: 'IndexDepartamento', component: DepartamentoListadoComponent },
                    { path: 'IndexPrueba', component: DashboardsComponent },
                    { path: 'IndexEstadistico', component: EstadisticosComponent },
                     { path: 'IndexRol', component: RolListadoComponent },
                     { path: 'IndexReportes', component: ReportesComponent },
                     { path: 'IndexReportePrestamos', component: ReportePrestamosAprobadosComponent },
                     { path: 'IndexReporteClientesMora', component: ReporteClientesMoraComponent },
                     { path: 'IndexReporteModelosVehiculos', component: ReporteModelosVehiculosComponent },
                     { path: 'IndexReporteVentasEmpleado', component: ReporteVentasEmpleadosComponent },
                     { path: 'CreateRol', component: RolCreateComponent } , 
                    // { path: 'departamento/:id', component: DetalleDepartamentoComponent }, // Agrega la ruta para DepartamentosListadoComponent
                    { path: 'IndexCargo', component: CargosListadoComponent }, // Agrega la ruta para CargosListadoComponent
                    { path: 'IndexEstadoCivil', component: EstadoscivilesListadoComponent },
                    { path: 'IndexMarca', component: MarcasListadoComponent },
                    { path: 'IndexMunicipio', component: MunicipiosListadoComponent },
                    { path: 'Dashboard', component: DashboardModule },
                    { path: 'IndexSucursal', component: SucursalesListadoComponent },
                    { path: 'IndexCliente', component: ClientesListadoComponent },
                    { path: 'IndexEmpleado', component: EmpleadosListadoComponent },
                    { path: 'IndexUsuario', component: UsuarioListadoComponent },
                    { path: 'IndexTipoCuota', component: TipocuotaListadoComponent },
                    { path: 'IndexModelo', component: ModeloListadoComponent },
                    { path: 'IndexVehiculo', component: VehiculoListadoComponent },
                    { path: 'IndexPlanPago', component: PlanpagoListadoComponent },
                    { path: 'CrearUsuarios', component: UsuarioCrearComponent },
                    { path: 'CrearVehiculo', component: VehiculoCrearComponent },
                    { path: 'CrearEmpleados', component: EmpleadosCrearComponent },
                    { path: 'CrearClientes', component: ClientesCrearComponent },
                    { path: 'CrearPlanPago', component: PlanpagoCrearComponent },
                    { path: 'CrearPlanPagoCliente', component: PlanpagoclienteCrearComponent }
                ]
            },
            { path: 'auth', loadChildren: () => import('./demo/components/auth/auth.module').then(m => m.AuthModule) },
            { path: 'landing', loadChildren: () => import('./demo/components/landing/landing.module').then(m => m.LandingModule) },
            { path: 'notfound', component: NotfoundComponent },
            { path: '**', redirectTo: '/notfound' },
        ], { scrollPositionRestoration: 'enabled', anchorScrolling: 'enabled', onSameUrlNavigation: 'reload' })
    ],
    exports: [RouterModule]
})
export class AppRoutingModule {
}
