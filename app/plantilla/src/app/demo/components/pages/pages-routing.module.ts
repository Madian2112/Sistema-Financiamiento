import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';

@NgModule({
    imports: [RouterModule.forChild([
        { path: 'crud', loadChildren: () => import('./crud/crud.module').then(m => m.CrudModule) },
        { path: 'empty', loadChildren: () => import('./empty/emptydemo.module').then(m => m.EmptyDemoModule) },
        { path: 'timeline', loadChildren: () => import('./timeline/timelinedemo.module').then(m => m.TimelineDemoModule) },
        { path: '**', redirectTo: '/notfound' },
        { path: 'reestablecer', data: { breadcrumb: 'EnviarCodigo' }, loadChildren: () => import('../../components/restablecer/validacion/validacion.module').then(m => m.ValidacionModule) },
        { path: 'compararcodigo', data: { breadcrumb: 'CompararCodigo' }, loadChildren: () => import('../../components/restablecer/comparar/comparar.module').then(m => m.CompararModule) },

        { path: 'reestablecer1', data: { breadcrumb: 'Restablecer' }, loadChildren: () => import('../../components/restablecer/restablecer/restablecer.module').then(m => m.restablecerModule)},
    ])],
    exports: [RouterModule]
})
export class PagesRoutingModule { }
