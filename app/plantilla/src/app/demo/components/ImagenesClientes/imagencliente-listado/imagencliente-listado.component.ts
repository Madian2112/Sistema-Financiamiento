import { Component, OnInit, NgModule  } from '@angular/core';
import { Router } from '@angular/router';
import {  ImagenCliente, Fill, Tabla, Vehiculo } from '../../../models/ImagenClienteViewModel';
import { Departamento } from '../../../models/Departamentoviewmodel';
import { ImagenClienteService } from '../../../service/imagencliente';
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
import { MessageService } from 'primeng/api';
import {DialogAddEditComponent} from 'src/app/demo/Dialogs/dialog-add-edit/dialog-add-edit.component';
import { MatDialog} from '@angular/material/dialog';
import {MatButtonModule} from '@angular/material/button';
import {Mensaje} from 'src/app/demo/models/MensajeViewModel';
import { ImpresionService } from 'src/app/demo/service/impresion.service';
import { FormsModule } from '@angular/forms';
import { ImageModule } from 'primeng/image';
import { GalleriaModule } from 'primeng/galleria';
import { CarouselModule } from 'primeng/carousel';
import { FileUploadModule } from 'primeng/fileupload';
import { HttpClient } from '@angular/common/http';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-imagencliente-listado',
  templateUrl: './imagencliente-listado.component.html',
  styleUrls: ['./imagencliente-listado.component.scss']
})
export class ImagenclienteListadoComponent implements OnInit {

  imagencliente!: ImagenCliente[];
  display: boolean = false;
  vehiculo : Vehiculo [];
  departamentos: Departamento[];
  tablaimagencliente: Tabla [];
  formImagenCliente: FormGroup;
  listadoimagencliente: ImagenCliente[] = [];
  selectedDepartamento: any;
  modalTitle: string = 'Nuevo Registro';
  modalButtonLabel: string = 'Guardar';
  confirmacionVisible: boolean = false;
  departamentoAEliminar: ImagenCliente | null = null;
  selectedImageURL: string | null = null;
  prueba: string = "";
  showFileUpload: boolean = true;

  

  codigo: string = '';
  depa: string = 'Seleccione';
  valor: string = '';


  constructor(    
    private service:  ImagenClienteService, 
    private router: Router ,
    private fb:FormBuilder,
    private _imagenclienre:ImagenClienteService,
    private messageService: MessageService,
    private dialog: MatDialog,) 
    {
      this.formImagenCliente = this.fb.group({
        vehiculo:["Seleccione"],
        imagen:[""],
       
      })
      this._imagenclienre.getImagenCliente().subscribe(
        (data : any) =>{
          this.listadoimagencliente  = data;
      },error => {
        console.log(error)
      }
    );
    }

    tabla: string = "";
    detalless: string = "collapse";
  
    muni_Id?: string = "";
    muni_Descripcion?:string = "";   
    dept_Descripcion?:string = "";  
    usua_Creacion?:string = "";   
    muni_Fecha_Creacion?:string ="";    
    usua_Modifica?:string ="";   
    muni_Fecha_Modifica?:string = "";  
  
   /* detalles(codigo){
      this.tabla = "collapse";
      this.detalless = "";
      this.service.getFill(codigo).subscribe({
          next: (data: Fill) => {
            this.muni_Id = data.muni_Id;
            this.muni_Descripcion = data.muni_Descripcion;
            this.dept_Descripcion = data.dept_Descripcion;
            this.usua_Creacion = data.usua_Creacion;
            this.muni_Fecha_Creacion = data.muni_Fecha_Creacion;
            this.usua_Modifica = data.usua_Modifica;
            this.muni_Fecha_Modifica = data.muni_Fecha_Modifica;
          }
        });
    } */
  
    volver(){
      this.tabla = "";
      this.detalless = "collapse";
    }

    openDialog() {
      this.dialog.open(DialogAddEditComponent);
    }

    AbrirModal() {
      this.formImagenCliente = this.fb.group({
        vehiculo:["Seleccione"],
        imagen:[""],
       
      })

      this.display = true;
      // Ajusta la ruta según tu configuración de enrutamiento
  }
  
    NuevoModelo(){
      console.log(this.formImagenCliente.value)
      const municipio : ImagenCliente = {
        imcl_Id: 0, 
        imcl_Imagen :  this.prueba,
        vecl_Id : this.formImagenCliente.value.vehiculo
      }
      this._imagenclienre.agregar(municipio).subscribe({
        next:(data)=>{
          this.service.getImagenCliente().subscribe(
            (data: any) => {
              console.log(data);
              this.tablaimagencliente = data;
              console.log(this.tablaimagencliente);
               this.display = false;
          
            },
             error => {
              console.log(error);
            }
          );
     
        },error:(e)=>{}
      })
    } 


    getMunicipio() {
      this.service.getImagenCliente().subscribe(
        (data: any) => {
          this.imagencliente = data;
        },
        error => {
          console.log(error);
        }
      );
    }
  
   /* confirmarEliminar(departamento: Municipio) {
      this.departamentoAEliminar = departamento;
      this.confirmacionVisible = true;
    } */
    
   /* eliminar() {
      if (this.departamentoAEliminar) {
        const idDepartamento = this.departamentoAEliminar.muni_Id;
        this._municipioservice.eliminar(idDepartamento).subscribe({
          next: (data) => {
            this.getMunicipio();
            this.confirmacionVisible = false;
            this.messageService.add({severity:'success', summary:'Éxito', detail:'Municipio eliminado correctamente!'});
          },
          error: (e) => {
            console.log(e);
            this.messageService.add({severity:'error', summary:'Error', detail:'Esta municipio no se puede eliminar.'});
          }
        });
      }
    } */
    cancelarEliminar() {
      this.confirmacionVisible = false;
    }
  
    campoVacio(campo: string): boolean {
      return this.formImagenCliente.get(campo)?.hasError('required') && this.formImagenCliente.get(campo)?.touched;
    }
  
    displayNuevo(){
      this.formImagenCliente.reset();
      this.modalTitle = 'Nuevo Registro';
      this.modalButtonLabel = 'Guardar';
      this.display = true;

      this.formImagenCliente = this.fb.group({
        vehiculo:["Seleccione"],
        imagen:[""],
       
      })

    }
   
    editar(departamento: any) {
      this.depa = "";
      this.selectedDepartamento = departamento;
      console.log(this.selectedDepartamento);
      // Usar el nombre del departamento en lugar del código
      this.valor = departamento.dept_Descripcion !== null ? departamento.dept_Descripcion : '';
      this.codigo = departamento.muni_Id;
      this.depa = departamento.dept_Descripcion;
      console.log(this.depa + ' ' + departamento.dept_Id);
      this.formImagenCliente = this.fb.group({
        codigo: [departamento.muni_Id],
        municipio: [departamento.muni_Descripcion],
        departamento: [departamento.dept_Id],
      });
      this.modalTitle = 'Editar Registro';
      this.modalButtonLabel = 'Actualizar';
      this.display = true;
    }
  
    /*
    guardar() {
      if (this.formMunicipio.invalid) {
        return;
      }
      if (this.modalTitle === 'Nuevo Registro') {
        this.NuevoModelo();
      } else {
        this.actualizar();
      }
    }
  
    actualizar() {
      const idDepartamento = this.selectedDepartamento.muni_Id;
      const modelo: Municipio = {
        dept_Descripcion : this.formMunicipio.value.departamento,
        dept_Id : this.formMunicipio.value.departamento,
        muni_Descripcion : this.formMunicipio.value.municipio,
        muni_Id : this.formMunicipio.value.codigo,
      }
      this._municipioservice.actualizar(idDepartamento, modelo).subscribe({
        next: (data) => {
          this.getMunicipio();
          this.display = false;
          this.messageService.add({severity:'success', summary:'Éxito', detail:'Municipio editado correctamente!'});
        },
        error: (e) => {
          console.log(e);
          this.messageService.add({severity:'error', summary:'Error', detail:'Municipio ya existente.'});
        }
      })
    } */
  
    onUpload(event) {
      const file: File = event.files[0];
      this.selectedImageURL = URL.createObjectURL(file);
      if (file) {
        const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
        const uniqueFileName = uniqueSuffix + '-' + file.name;
        this.prueba = uniqueFileName;
        const formData: FormData = new FormData();
  
        formData.append('file', file, uniqueFileName);
        this.service.EnviarImagen(formData).subscribe(
          response => {
            console.log('Upload successful', response);
            if (response.message === "Exito") {
              // this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Imagen Subida', life: 3000 });
            } else {
              this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Formato de imagen incorrecto', life: 3000 });
            }
          },
          error => {
            console.error('Error uploading image', error);
          }
        );
      }
    }


  ngOnInit(): void {
    this.service.getImagenCliente().subscribe(
      (data: any) => {
        console.log(data);
        this.tablaimagencliente = data;
        console.log(this.tablaimagencliente);
      },
       error => {
        console.log(error);
      }
    );

    this.service.getVehiculo().subscribe(data => {
      this.vehiculo = data;
    });

  }

}

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    TableModule,
    ButtonModule,
    InputTextModule,
    ToggleButtonModule,
    CarouselModule,
    DialogModule,
    RippleModule,
    MultiSelectModule,
    ImageModule,
    GalleriaModule,
    DropdownModule,
    ProgressBarModule,
    ReactiveFormsModule,
    ToastModule,
    SliderModule,
    FileUploadModule,
    RatingModule 
    
  ],
  declarations: [ImagenclienteListadoComponent]
})
export class ImagenesClientesListadoModule {}
