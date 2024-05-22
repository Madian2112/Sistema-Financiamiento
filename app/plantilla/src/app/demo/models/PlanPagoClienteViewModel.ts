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

export class PagoCliente{
    pacl_Id!: number;
    papa_Id!:number;   
    pacl_Monto_Pago!: number;
    pacl_NumeroCuota!: number;

    /*
        AGREGAR EL ID DE LA SUCURSAL CUANDO USE LAS SESIONES
        sucu_Id!: number;
    */
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
    
    pacl_Total_Intereses!: number;  
    pacl_Total_Capital!: number; 
    pacl_Intereses_Restar!: number; 
    pacl_Capital_Restar!: number; 
    pacl_Total_Pago!: number; 
    pacl_Saldo!: number; 
    pacl_NumeroCuota!: number; 
    pacl_Fecha_Pago!: string;
    color!: string;
}

export class PagoClienteFechaPrevia{
    clie_DNI: string;
    papa_Id: number;
    papa_Estado_PlanesPagos: boolean;
    papa_Financiamiento: number;
    pacl_Id: number;
    pacl_Fecha_Pago: Date;
    pacl_Fecha_PreviaPago: Date;
    pacl_Monto_Pago: number;
    pacl_Pago_Capital: number;
    pacl_Pago_Intereses: number;
    pacl_Pago_Mora: number;
    pacl_Saldo_Inicial: number;
    pacl_Saldo_Sumado: number;
    pacl_Mora_Saber: string;
    pacl_NumeroCuota: number;
    pacl_Estado_Pago: string;
    papa_Intereses_Monto: number;
    monto_Mora: number;
    minimoPagar: number;
    pacl_Capital_Restar: number;
    pacl_Intereses_Restar: number;
    pacl_Total_Intereses: number;
    pacl_Fecha_Emision: string;
}

export class PagoClientePapaID{
    clie_DNI: string;
    papa_Id: number;
    papa_Estado_PlanesPagos: boolean;
    papa_Financiamiento: number;
    pacl_Id: number;
    pacl_Fecha_Pago: Date;
    pacl_Fecha_PreviaPago: Date;
    pacl_Monto_Pago: number;
    pacl_Pago_Capital: number;
    pacl_Pago_Intereses: number;
    pacl_Pago_Mora: number;
    pacl_Saldo_Inicial: number;
    pacl_Saldo_Sumado: number;
    pacl_Mora_Saber: string;
    pacl_NumeroCuota: number;
    pacl_Estado_Pago: string;
    papa_Intereses_Monto: number;
    monto_Mora: number;
    minimoPagar: number;
}