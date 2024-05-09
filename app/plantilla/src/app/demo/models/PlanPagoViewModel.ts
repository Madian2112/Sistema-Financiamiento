export class PLanPago{
    papa_Id!: number;
    papa_Financiamiento!:number;   
    papa_Precio_Mercado!: number;
    pap_Intereses_Porcentaje!: number;
    pap_Intereses_Monto!: number;  
    papa_Numero_Cuota!: number;
    marc_Descripcion!: string;  
    mode_Descripcion!: string;
    cliente!: string;
    ticu_Descripcion!: string;  
    vecl_Id!: number;
    ticu_Id!: number;  
}


export class PLanPagoCreate{
    papa_Id!: number;
    papa_Financiamiento!:number;   
    papa_Precio_Mercado!: number;
    papa_Numero_Cuota!: number;
    vecl_Id!: number; 
}

export class Fill{
    papa_Id!: number;
    papa_Financiamiento!:string;   
    papa_Precio_Mercado!: string;
    papa_Intereses_Porcentaje!: string;
    papa_Intereses_Monto!: string;  
    papa_Numero_Cuota!: string;
    papa_Mora!: string;
    papa_Estado_PlanesPagos!: string; 
    marc_Descripcion!: string;  
    mode_Descripcion!: string;
    cliente!: string;
    usua_Creacion!:string;   
    papa_Fecha_Creacion!:string;   
    usua_Modifica!:string;   
    papa_Fecha_Modificacion!:string;    
}