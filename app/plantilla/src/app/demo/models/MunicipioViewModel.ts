export class Municipio{
    muni_Id!: string;
    muni_Descripcion!:string;   
    dept_Id!:string;   
    dept_Descripcion!:string;  
}

export class Fill{
    muni_Id!: string;
    muni_Descripcion!:string;   
    dept_Id!:string;   
    dept_Descripcion!:string; 
    usua_Creacion!:string;   
    muni_Fecha_Creacion!:string;   
    usua_Modifica!:string;   
    muni_Fecha_Modifica!:string;  
}

export class dropMunicipio{
    value?:String;
    text?:String;
}