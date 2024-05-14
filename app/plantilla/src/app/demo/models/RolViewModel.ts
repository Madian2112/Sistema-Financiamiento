import { an } from "@fullcalendar/core/internal-common";

export class Rol{
    rol_Id?:String;
    rol_Descripcion?:String;
}

export class RolEnviar {
    Rol_Id?:String;
    txtRol: string;
    pantallasSeleccionadas: any;
}
export class dropRol{
    value?:String;
    text?:String;
}

export class Fill {
    rol_Id: string;
    pant_Id: string;
    rol_Descripcion: string;
    usuarioCreacion: string;
    usuarioModificacion: string;
    fechaCreacion : string;
    fechaModificacion : string;
}