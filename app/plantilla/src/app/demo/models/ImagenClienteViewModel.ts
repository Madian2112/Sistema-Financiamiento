export class ImagenCliente{
    imcl_Id!: number;
    imcl_Imagen!:string; 
    vecl_Id!: number;
}

export class Actualizar{
    imcl_Id!: number;
    imcl_Imagen!:string; 
    vecl_Id!: number;
    Imcl_Usua_Modifica!: number;
}

export class Fill{
    imcl_Id!: number;
    imcl_Imagen!:string;   
    usua_Creacion!:string;   
    imcl_Fecha_Creacion!:string;   
    usua_Modifica!:string;   
    imcl_Fecha_Modifica!:string; 
    vehi_Placa!:string; 
    mode_Descripcion!:string; 
    marc_Descripcion!:string; 
    cliente!:string; 
}

export class Tabla{
    imcl_Id!: number;
    imcl_Imagen!:string; 
    vecl_Id!: number;
    vehi_Placa!:string; 
    mode_Descripcion!:string; 
    marc_Descripcion!:string; 
}

export class Vehiculo{
    vehi_Id!:number; 
    vehi_Placa!:string; 
    mode_Descripcion!:string; 
    marc_Descripcion!:string; 
    clie_Nombre!:string; 
}