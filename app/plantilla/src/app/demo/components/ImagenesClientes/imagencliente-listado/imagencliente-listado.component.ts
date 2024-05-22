import { Component, OnInit, NgModule  } from '@angular/core';
import { Router } from '@angular/router';
import {  ImagenCliente, Fill, Tabla, Actualizar } from '../../../models/ImagenClienteViewModel';
import {  Vehiculo } from '../../../models/VehiculoViewModel';
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
import { PLanPagoServiceService } from '../../../service/planplago_service';


@Component({
  selector: 'app-imagencliente-listado',
  templateUrl: './imagencliente-listado.component.html',
  styleUrls: ['./imagencliente-listado.component.scss']
})
export class ImagenclienteListadoComponent implements OnInit {

  imagencliente!: ImagenCliente[];
  display: boolean = false;
  vehiculos : Vehiculo [];
  departamentos: ImagenCliente[];
  tablaimagencliente: Tabla [];
  formImagenCliente: FormGroup;
  listadoimagencliente: ImagenCliente[] = [];
  selectedImagenCliente: any;
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
    private service1:  PLanPagoServiceService, 
    private router: Router ,
    private fb:FormBuilder,
    private _imagenclienre:ImagenClienteService,
    // private messageService: MessageService,
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

    imcl_Id?: number = 0 ;
    imcl_Imagen?:string = "";   
    vehi_Placa?:string = ""; 
    mode_Descripcion?:string = ""; 
    marc_Descripcion?:string = ""; 
    cliente?:string; 
    usua_Creacion?:string = "";   
    imcl_Fecha_Creacion?:string = "";   
    usua_Modifica?:string = "";   
    imcl_Fecha_Modifica?:string = ""; 
  
   detalles(codigo){
      this.tabla = "collapse";
      this.detalless = "";
      this.service.getFill(codigo).subscribe({
          next: (data: Fill) => {

            console.log("Los datos son: " + data)

            this.imcl_Id = data.imcl_Id;
            this.imcl_Imagen = data.imcl_Imagen;
            this.vehi_Placa = data.vehi_Placa;
            this.mode_Descripcion = data.mode_Descripcion;
            this.marc_Descripcion = data.marc_Descripcion;
            this.cliente = data.cliente;
            this.usua_Creacion = data.usua_Creacion;
            this.imcl_Fecha_Creacion = data.imcl_Fecha_Creacion;
            this.usua_Modifica = data.usua_Modifica;
            this.imcl_Fecha_Modifica = data.imcl_Fecha_Modifica;
          }
        });
    } 
  
    volver(){
      this.tabla = "";
      this.detalless = "collapse";
    }

    openDialog() {
      this.dialog.open(DialogAddEditComponent);
    }

    recargarPagina() {
      location.reload();
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
  
   confirmarEliminar(departamento: ImagenCliente) {
      this.departamentoAEliminar = departamento;
      this.confirmacionVisible = true;
    } 
    
   eliminar() {
      if (this.departamentoAEliminar) {
        const idImagenCliente = this.departamentoAEliminar.imcl_Id;
        this.service.eliminar(idImagenCliente).subscribe({
          next: (data) => {
            this.getMunicipio();
            this.confirmacionVisible = false;
         },
          error: (e) => {
            console.log(e);
          }
        });
        this.recargarPagina(); 
      }
    } 

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
      console.log(this.selectedImagenCliente);
      this.selectedImagenCliente = departamento;
      // Usar el nombre del departamento en lugar del código
      this.selectedImageURL = "https://localhost:44372/uploads/" + departamento.imcl_Imagen;
      console.log("La imagen es: "+ this.selectedImageURL)
      this.formImagenCliente.patchValue({
        vehiculo: departamento.vecl_Id,
      });

      this.modalTitle = 'Editar Registro';
      this.modalButtonLabel = 'Actualizar';
      this.display = true;
    }
  
    
    guardar() {
      if (this.formImagenCliente.invalid) {
        return;
      }
      if (this.modalTitle === 'Nuevo Registro') {
        this.NuevoModelo();
      } else {
        this.actualizar();
      }
    }
  
    actualizar() {
      const idImagenCliente = this.selectedImagenCliente.imcl_Id;
      const modelo: Actualizar = {
        imcl_Id :  idImagenCliente,
        imcl_Imagen : this.prueba,
        Imcl_Usua_Modifica: 1, 
        vecl_Id: this.formImagenCliente.value.vehiculo
        
      }
      this.service.actualizar(modelo).subscribe({
        next: (data) => {
          this.getMunicipio();
          this.display = false;
       },
        error: (e) => {
          console.log(e);
        }
      })
    } 
  
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
              // this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Formato de imagen incorrecto', life: 3000 });
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

    this.service1.getVehiculo().subscribe(data => {
      this.vehiculos = data;
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
    // MessageService,
    FileUploadModule,
    RatingModule 
    
  ],
  declarations: [ImagenclienteListadoComponent]
})
export class ImagenesClientesListadoModule {}
