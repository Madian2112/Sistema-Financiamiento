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
import {ImagenclienteListadoComponent} from './demo/components/ImagenesClientes/imagencliente-listado/imagencliente-listado.component';
import {ReportesComponent} from './demo/components/reportes/reportes.component';
import { ReportePrestamosAprobadosComponent } from './demo/components/reporte-prestamos-aprobados/reporte-prestamos-aprobados.component';
import { ReporteClientesMoraComponent } from './demo/components/reporte-clientes-mora/reporte-clientes-mora.component';
import { ReporteModelosVehiculosComponent } from './demo/components/reporte-modelos-vehiculos/reporte-modelos-vehiculos.component';
import { ReporteVentasEmpleadosComponent } from './demo/components/reporte-ventas-empleados/reporte-ventas-empleados.component';
import { EstadisticosComponent } from './demo/components/estadisticos/estadisticos.component';
import { PlanpagoclienteCrearComponent } from './demo/components/PlanesPagosClientes/planpagocliente-crear/planpagocliente-crear.component';
import { AuthGuard } from './auth/auth.guard';

const routes: Routes = [
    { path: '', component: LoginComponent },
    {
      path: 'app', component: AppLayoutComponent,
      children: [
        { path: 'reestablecer', data: { breadcrumb: 'EnviarCodigo' }, loadChildren: () => import('./demo/components/restablecer/validacion/validacion.module').then(m => m.ValidacionModule) },
        { path: 'compararcodigo', data: { breadcrumb: 'CompararCodigo' }, loadChildren: () => import('./demo/components/restablecer/comparar/comparar.module').then(m => m.CompararModule) },

        { path: 'reestablecer1', data: { breadcrumb: 'Restablecer' }, loadChildren: () => import('./demo/components/restablecer/restablecer/restablecer.module').then(m => m.restablecerModule)},
        { path: 'dashboard', component: DashboardComponent, canActivate: [AuthGuard] },
        { path: 'uikit', loadChildren: () => import('./demo/components/uikit/uikit.module').then(m => m.UIkitModule), canActivate: [AuthGuard] },
        { path: 'utilities', loadChildren: () => import('./demo/components/utilities/utilities.module').then(m => m.UtilitiesModule), canActivate: [AuthGuard] },
        { path: 'documentation', loadChildren: () => import('./demo/components/documentation/documentation.module').then(m => m.DocumentationModule), canActivate: [AuthGuard] },
        { path: 'blocks', loadChildren: () => import('./demo/components/primeblocks/primeblocks.module').then(m => m.PrimeBlocksModule), canActivate: [AuthGuard] },
        { path: 'pages', loadChildren: () => import('./demo/components/pages/pages.module').then(m => m.PagesModule), canActivate: [AuthGuard] },
        { path: 'departamento', component: DepartamentoListadoComponent, canActivate: [AuthGuard] },
        { path: 'inicio', component: DashboardsComponent, canActivate: [AuthGuard] },
        { path: 'graficos', component: EstadisticosComponent, canActivate: [AuthGuard] },
        { path: 'roles', data: { breadcrumb: 'Rol' }, loadChildren: () => import('./demo/components/Rol/rol-listado/roldemo.module').then(m => m.RolDemoModule), canActivate: [AuthGuard] },
        { path: 'reportes', component: ReportesComponent, canActivate: [AuthGuard] },
        { path: 'prestamosaprobados', component: ReportePrestamosAprobadosComponent, canActivate: [AuthGuard] },
        { path: 'clientesenmora', component: ReporteClientesMoraComponent, canActivate: [AuthGuard] },
        { path: 'reporte-modelos-vehiculos', component: ReporteModelosVehiculosComponent, canActivate: [AuthGuard] },
        { path: 'ventashechasporempleados', component: ReporteVentasEmpleadosComponent, canActivate: [AuthGuard] },
        { path: 'login', component: LoginComponent },
        { path: 'cargo', component: CargosListadoComponent, canActivate: [AuthGuard] },
        { path: 'estadocivil', component: EstadoscivilesListadoComponent, canActivate: [AuthGuard] },
        { path: 'marca', component: MarcasListadoComponent, canActivate: [AuthGuard] },
        { path: 'municipio', component: MunicipiosListadoComponent, canActivate: [AuthGuard] },
        { path: 'sucursal', component: SucursalesListadoComponent, canActivate: [AuthGuard] },
        { path: 'cliente', component: ClientesListadoComponent, canActivate: [AuthGuard] },
        { path: 'empleado', component: EmpleadosListadoComponent, canActivate: [AuthGuard] },
        { path: 'usuarios', component: UsuarioListadoComponent, canActivate: [AuthGuard] },
        { path: 'tipodecuota', component: TipocuotaListadoComponent, canActivate: [AuthGuard] },
        { path: 'modelo', component: ModeloListadoComponent, canActivate: [AuthGuard] },
        { path: 'vehiculo', component: VehiculoListadoComponent, canActivate: [AuthGuard] },
        { path: 'planpago', component: PlanpagoListadoComponent, canActivate: [AuthGuard] },
        { path: 'CrearUsuarios', component: UsuarioCrearComponent },
        { path: 'CrearVehiculo', component: VehiculoCrearComponent},
        { path: 'CrearEmpleados', component: EmpleadosCrearComponent},
        { path: 'CrearClientes', component: ClientesCrearComponent},
        { path: 'CrearPlanPago', component: PlanpagoCrearComponent},
        { path: 'imagenesclientes', component: ImagenclienteListadoComponent, canActivate: [AuthGuard] },
        { path: 'planpagocliente', component: PlanpagoclienteCrearComponent, canActivate: [AuthGuard] }
      ]
       
           },
            { path: 'auth', loadChildren: () => import('./demo/components/auth/auth.module').then(m => m.AuthModule)},
            { path: 'notfound', component: NotfoundComponent },
            { path: '**', redirectTo: '/notfound'},
          ];
          
          @NgModule({
            imports: [RouterModule.forRoot(routes, { scrollPositionRestoration: 'enabled', anchorScrolling: 'enabled', onSameUrlNavigation: 'reload' })],
            exports: [RouterModule]
          })
          export class AppRoutingModule { }