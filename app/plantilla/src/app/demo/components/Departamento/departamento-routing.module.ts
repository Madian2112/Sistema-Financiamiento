import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DepartamentoListadoComponent } from './departamento-listado/departamento-listado.component'; // Importa el componente de detalle


const routes: Routes = [
  { path: '', redirectTo: '/departamentos', pathMatch: 'full' },
  { path: 'departamentos', component: DepartamentoListadoComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
