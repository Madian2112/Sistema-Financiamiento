export class Respuesta {
    code: number;
    data: {
      codeStatus: number;
      messageStatus: string;
      message?: string; // El mensaje puede ser opcional
    };
    messageStatus:string;
    message?: string;
    success: boolean;
  }