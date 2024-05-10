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

  
    const addOrangeStripe = () => {
      doc.setFillColor(249, 77, 28); 
      doc.rect(0, 0, doc.internal.pageSize.width, 50, 'F'); 
      doc.rect(0, doc.internal.pageSize.height - 50, doc.internal.pageSize.width, 50, 'F'); 
    };


    addOrangeStripe();


    const img = new Image();
    img.src = 'assets/demo/images/credirapi-removebg-preview.png';
    const imgWidth = 120; 
    const imgHeight = 60;
    const imgX = (doc.internal.pageSize.width - imgWidth) / 16;
    const imgY = 60;
    doc.addImage(img, 'PNG', imgX, imgY, imgWidth, imgHeight);

 
    doc.setTextColor(0, 0, 0);
    doc.setFontSize(22);
    doc.setFont('helvetica', 'bold');
    doc.text(titulo, doc.internal.pageSize.width / 2, imgY + imgHeight + 45, { align: 'center' });



    autoTables(doc, {
      head: [encabezado],
      body: cuerpo,
      startY: imgY + imgHeight + 60
    });

   
    const pageCount = doc.getNumberOfPages();
    for (let i = 1; i <= pageCount; i++) {
      doc.setPage(i);
      addOrangeStripe(); 

  
      doc.setFontSize(12); 
      doc.setFillColor(255, 255,255); 
      doc.rect(doc.internal.pageSize.width - 80, doc.internal.pageSize.height - 35, 60, 25, 'F'); 
      doc.setTextColor(0); 
      doc.text(`Página ${i} de ${pageCount}`, doc.internal.pageSize.width - 80 + 30, doc.internal.pageSize.height - 17, { align: 'center' });
    }

   
    const blobUrl = doc.output('bloburl');
    return this.sanitizer.bypassSecurityTrustResourceUrl(blobUrl.toString());
  }
}
