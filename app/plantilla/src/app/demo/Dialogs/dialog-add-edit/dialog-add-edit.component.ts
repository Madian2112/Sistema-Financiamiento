import { Component, OnInit } from '@angular/core';
import {
  MatDialog,
  MatDialogActions,
  MatDialogClose,
  MatDialogContent,
  MatDialogTitle,
} from '@angular/material/dialog';
import {MatButtonModule} from '@angular/material/button';
import {ReactiveFormsModule,FormBuilder,FormGroup,Validators} from '@angular/forms';
import {MatDialogRef} from '@angular/material/dialog';
import {Departamento} from 'src/app/demo/models/Departamentoviewmodel';
import {DepartamentoServiceService} from 'src/app/demo/service/departamento_service';
import {MatGridListModule} from '@angular/material/grid-list'
import {MatIconModule} from '@angular/material/icon';
import {MatInputModule} from '@angular/material/input';
import {MatFormFieldModule} from '@angular/material/form-field';

@Component({
  selector: 'app-dialog-add-edit',
  standalone: true,
  imports: [MatDialogTitle,
     MatDialogContent, MatFormFieldModule, MatInputModule, MatIconModule,MatDialogActions,MatGridListModule, MatDialogClose, ReactiveFormsModule, MatButtonModule],
  templateUrl: './dialog-add-edit.component.html',
  styleUrl: './dialog-add-edit.component.scss'
})
export class DialogAddEditComponent implements OnInit{

  formDepa: FormGroup;

  constructor(
    private dialogoReferencia: MatDialogRef<DialogAddEditComponent>,
    private fb: FormBuilder,
    private _departamentoServicio:DepartamentoServiceService,
  ){
    this.formDepa = this.fb.group({
      codigo:["",Validators.required],
      departamento:["",Validators.required],
     
    })
  }

  ngOnInit(): void {
    
  }
}
