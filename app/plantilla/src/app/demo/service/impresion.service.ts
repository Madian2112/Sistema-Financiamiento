import { Injectable } from '@angular/core';
import { jsPDF } from 'jspdf';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import autoTables from 'jspdf-autotable';

@Injectable({
  providedIn: 'root'
})
export class ImpresionService {

  constructor(private sanitizer: DomSanitizer) { } 

  imprimir(encabezado: string[], cuerpo: Array<any>, titulo: string): SafeResourceUrl {
    const doc = new jsPDF({
      orientation: 'portrait',
      unit: 'px',
      format: 'letter'
    });

    doc.setFillColor(247, 247, 247); 
    doc.rect(0, 80, doc.internal.pageSize.width, doc.internal.pageSize.height, 'F');

    const img = new Image();
    img.src = 'assets/demo/images/credirapi-removebg-preview.png';
    const imgWidth = 80; 
    const imgHeight = 40;
    const imgX = 20; 
    const imgY = 40;
    doc.addImage(img, 'PNG', imgX, imgY, imgWidth, imgHeight);

    doc.setTextColor(0, 0, 0);
    doc.setFontSize(20);
    doc.setFont('helvetica', 'bold');
    doc.text(titulo, imgX + imgWidth + 10, imgY + 30, { align: 'left' });

    doc.setFillColor(204, 91, 27);
    doc.rect(0, 0, doc.internal.pageSize.width, 30, 'F');

  
    const cuerpoConNumeros = cuerpo.map((fila, index) => [index + 1, ...fila]);

    autoTables(doc, {
      head: [['N.', ...encabezado]], 
      body: cuerpoConNumeros,
      startY: imgY + imgHeight + 30,
      theme: 'grid',
      styles: {
        fontSize: 10,
        cellPadding: 2,
        textColor: [0, 0, 0],
        valign: 'middle',
        halign: 'center'
      },
      headStyles: {
        fillColor: [204, 91, 27],
        textColor: [255, 255, 255],
        fontStyle: 'bold'
      },
      alternateRowStyles: {
        fillColor: [240, 240, 240]
      }
    });

    const pageCount = doc.getNumberOfPages();
    for (let i = 1; i <= pageCount; i++) {
      doc.setPage(i);
      doc.setFontSize(10); 
      doc.setFillColor(247, 247, 247); 
      doc.rect(doc.internal.pageSize.width - 80, doc.internal.pageSize.height - 35, 60, 25, 'F'); 
      doc.setTextColor(0); 
      doc.text(`Página ${i} de ${pageCount}`, doc.internal.pageSize.width - 80 + 30, doc.internal.pageSize.height - 22, { align: 'center' });
    
    
      doc.setFontSize(10); 
      doc.setTextColor(0, 0, 0);
      doc.text('PDF generado por: Usuario', 10, doc.internal.pageSize.height - 22); 
    }
    
    doc.setFillColor(204, 91, 27);
    doc.rect(0, doc.internal.pageSize.height - 20, doc.internal.pageSize.width, 30, 'F');
    

    doc.setFillColor(204, 91, 27);
    doc.rect(0, doc.internal.pageSize.height - 20, doc.internal.pageSize.width, 30, 'F');

    const blobUrl = doc.output('bloburl');
    return this.sanitizer.bypassSecurityTrustResourceUrl(blobUrl.toString());
  }
}






// import { Injectable } from '@angular/core';
// import { jsPDF } from 'jspdf';
// import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
// import autoTables from 'jspdf-autotable';

// @Injectable({
//   providedIn: 'root'
// })
// export class ImpresionService {

//   constructor(private sanitizer: DomSanitizer) { } 

//   imprimir(encabezado: string[], cuerpo: Array<any>, titulo: string): SafeResourceUrl {
//     const doc = new jsPDF({
//       orientation: 'portrait',
//       unit: 'px',
//       format: 'letter'
//     });

//     // Dibujar la franja de color naranja primero
//     doc.setFillColor(204, 91, 27);
//     doc.rect(0, 0, doc.internal.pageSize.width, 60, 'F');

//     // Dibujar un fondo blanco para la imagen
//     const imgWidth = 80; 
//     const imgHeight = 40;
//     const imgX = 0; // Ajusta la posición horizontal de la imagen
//     const imgY = 25; // Ajusta la posición vertical de la imagen
//     doc.setFillColor(255, 255, 255); // Color blanco
//     doc.rect(imgX, imgY, imgWidth, imgHeight, 'F'); // Rectángulo blanco detrás de la imagen

//     // Luego agregar la imagen y el encabezado
//     const img = new Image();
//     img.src = 'assets/demo/images/credirapi-removebg-preview.png';
//     doc.addImage(img, 'PNG', imgX, imgY, imgWidth, imgHeight);

//     // Ajusta la posición del encabezado al lado derecho de la imagen
//     doc.setTextColor(0, 0, 0);
//     doc.setFontSize(20);
//     doc.setFont('helvetica', 'bold');
//     doc.text(titulo, imgX + imgWidth + 10, imgY + 30, { align: 'left' });

//     autoTables(doc, {
//       head: [encabezado],
//       body: cuerpo,
//       startY: imgY + imgHeight + 60
//     });

//     const pageCount = doc.getNumberOfPages();
//     for (let i = 1; i <= pageCount; i++) {
//       doc.setPage(i);

//       doc.setFontSize(12); 
//       doc.setFillColor(204, 91, 27); // Establece el color naranja
//       // Pie de página naranja
//       doc.rect(0, doc.internal.pageSize.height - 50, doc.internal.pageSize.width, 80, 'F');

//       doc.setFillColor(255, 255, 255); // Restaura el color de relleno a blanco
//       doc.setTextColor(255, 255, 255); // Establece el color de texto a blanco
//       doc.text(`Página ${i} de ${pageCount}`, doc.internal.pageSize.width / 2, doc.internal.pageSize.height - 17, { align: 'center' });
//     }

//     const blobUrl = doc.output('bloburl');
//     return this.sanitizer.bypassSecurityTrustResourceUrl(blobUrl.toString());
//   }
// }
