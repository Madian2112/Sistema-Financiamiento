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
    pap_Intereses_Porcentaje!: number; 
    papa_Numero_Cuota!: number;
    papa_Mora!: number;
    vecl_Id!: number;
    ticu_Id!: number;  
    resultado!: number;
}

export class Fill{
    papa_Id!: number;
    papa_Financiamiento!:string;   
    papa_Precio_Mercado!: string;
    pap_Intereses_Porcentaje!: string;
    pap_Intereses_Monto!: string;  
    papa_Numero_Cuota!: string;
    papa_Estado_PlanesPagos!: string; 
    marc_Descripcion!: string;  
    mode_Descripcion!: string;
    cliente!: string;
    ticu_Descripcion!: string;
    usua_Creacion!:string;   
    papa_Fecha_Creacion!:string;   
    usua_Modifica!:string;   
    papa_Fecha_Modificacion!:string;    
}