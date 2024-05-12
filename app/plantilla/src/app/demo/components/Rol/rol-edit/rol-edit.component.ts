import { Component, OnInit, NgModule,Inject } from '@angular/core';
import { Router } from '@angular/router';
import { Departamento } from '../../../models/Departamentoviewmodel';
import { DepartamentoServiceService } from '../../../service/departamento_service';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { InputTextModule } from 'primeng/inputtext';
import { DialogModule } from 'primeng/dialog';
import { ToggleButtonModule } from 'primeng/togglebutton';
import { RippleModule } from 'primeng/ripple';
import { MultiSelectModule } from 'primeng/multiselect';
import { DropdownModule } from 'primeng/dropdown';
import { ProgressBarModule } from 'primeng/progressbar';
import { ToastModule } from 'primeng/toast';
import { SliderModule } from 'primeng/slider';
import { RatingModule } from 'primeng/rating';
import { MatDialog } from '@angular/material/dialog';
import { MatButtonModule } from '@angular/material/button';
import { FormsModule } from '@angular/forms';
import { DataViewModule } from 'primeng/dataview';
import { PickListModule } from 'primeng/picklist';
import { OrderListModule } from 'primeng/orderlist';
import { Product } from 'src/app/demo/api/product';
import { ProductService } from 'src/app/demo/service/product.service';
import { SelectItem } from 'primeng/api';
import {RolService} from 'src/app/demo/service/rol.service'; 
import { Pantallas } from 'src/app/demo/models/PantallaViewMode';
import { Rol } from 'src/app/demo/models/RolViewModel';
import { Respuesta } from 'src/app/demo/models/ServiceResult';
import { MessageService } from 'primeng/api';

@Component({
  selector: 'app-rol-edit',
  templateUrl: './rol-edit.component.html',
  styleUrl: './rol-edit.component.scss'
})
export class RolEditComponent implements OnInit {
  form: FormGroup;
  sourcePantallas: any[] = []; // Debería ser llenado con pantallas disponibles
  targetPantallas: any[] = []; // Debería ser llenado con pantallas ya asignadas al rol

  constructor(private fb: FormBuilder, private router: Router, private rolService: RolService) {
    this.form = this.fb.group({
      rolNombre: ['', Validators.required],
    });
  }

  ngOnInit(): void {
    this.cargarDatosRol();
  }

  cargarDatosRol() {
    // Aquí cargarías los datos del rol a editar, incluyendo las pantallas asignadas
    // También deberías cargar las pantallas disponibles que no están asignadas a este rol
  }

  guardar() {
    if (this.form.valid) {
      // Implementa lógica para guardar los cambios del rol y sus pantallas
    } else {
      console.log("Formulario no válido");
    }
  }

  agregarPantalla(event: any) {
    // Lógica para añadir pantalla a un rol
  }

  eliminarPantalla(event: any) {
    // Lógica para remover pantalla de un rol
  }

  Volver() {
    this.router.navigate(['/ruta-a-listado-roles']); // Asegúrate de reemplazar esto con la ruta correcta
  }
}
