export class Usuario{
    usua_Id!: number;
    usua_Usuario!:string;   
    empleado!: string;
    rol_Descripcion!: string;
    usua_Admin!: number;  
    empl_Id!: number;
    rol_Id!: number;  
    usua_Contra!: string;
    Usua_VerificarCorreo?: string;
}

export class Fill{
    usua_Id!: number;
    usua_Usuario!:string;   
    empleado!: string;
    rol_Descripcion!: string;
    usua_Admin!: number;  
    empl_Id!: number;
    rol_Id!: number;  
    usua_Contra!: string;
    usua_Creacion!:string;   
    usua_Fecha_Creacion!:string;   
    usua_Modifica!:string;   
    usua_Fecha_Modifica!:string;  
    Usua_VerificarCorreo?: string;
}

export class FillPerfilUsuario{
    usua_Id?: number;
    usua_Usuario: string;
    usua_Color: string;
    usuario?: string;
}