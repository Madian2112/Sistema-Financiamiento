import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { ListRolComponent } from './rol-listado.component';

@NgModule({
	imports: [RouterModule.forChild([
		{ path: '', component: ListRolComponent }
	])],
	exports: [RouterModule]
})
export class ListRolRoutingModule { }