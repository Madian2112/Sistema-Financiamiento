export class Cliente{
    clie_Id!: number;
    clie_DNI!:string;   
    clie_Nombre!: string;
    clie_Apellido!: string;
    clie_Sexo!:string;   
    esta_Descripcion!: string;
    clie_Telefono!: number;
    esta_Id!:number;   
    muni_Id!: string;
    dept_Id!: string;
}

export class Clienteddl{
    clie_Id!: number; 
    clie_Nombre!: string;
    clie_Apellido!: string;
}

export class Fill{
    clie_Id!: string;
    clie_DNI!:string;   
    clie_Nombre!: string;
    clie_Apellido!: string;
    clie_Sexo!:string;   
    esta_Descripcion!: string;
    usua_Creacion!:string;   
    clie_Fecha_Creacion!:string;   
    usua_Modifica!:string;   
    clie_Fecha_Modifica!:string; 
}