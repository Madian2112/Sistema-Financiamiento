export class PLanPagoCliente{
    pacl_Id!: number;
    papa_Id!:number;   
    pacl_Monto_Pago!: number;
    pacl_Pago_Capital!: number;
    pacl_Pago_Intereses!: number;  
    pacl_Pago_Mora!: number; 
    pacl_Fecha_Emision!: string; 
    resultado!: number; 
}

export class PLanPagoClientTB{
    pacl_Id!: number;
    papa_Id!:number;   
    pacl_Monto_Pago!: number;
    pacl_Pago_Capital!: number;
    pacl_Pago_Intereses!: number;  
    pacl_Pago_Mora!: number; 
    pacl_Financiamiento!: number; 
    pacl_Saldo_Inicial!: number; 
    pacl_Saldo_Restante!: number; 
    pacl_Fecha_Emision!: string; 
}
