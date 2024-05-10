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

    // Función para agregar la franja naranja en la parte superior e inferior
    const addOrangeStripe = () => {
      doc.setFillColor(249, 77, 28); // Color naranja
      doc.rect(0, 0, doc.internal.pageSize.width, 50, 'F'); // Franja naranja en la parte superior
      doc.rect(0, doc.internal.pageSize.height - 50, doc.internal.pageSize.width, 50, 'F'); // Franja naranja en la parte inferior
    };

    // Agregar franja naranja al inicio
    addOrangeStripe();

    // Agregar la imagen centrada
    const img = new Image();
    img.src = 'assets/demo/images/credirapi-removebg-preview.png'; // Especifica la ruta de tu imagen
    const imgWidth = 120; // Ancho de la imagen
    const imgHeight = 60; // Alto de la imagen
    const imgX = (doc.internal.pageSize.width - imgWidth) / 16; // Posición X centrada
    const imgY = 60; // Posición Y debajo del título
    doc.addImage(img, 'PNG', imgX, imgY, imgWidth, imgHeight);

    // Agregar el título del reporte
    doc.setTextColor(0, 0, 0); // Color blanco
    doc.setFontSize(20); // Tamaño de fuente para el título
    doc.text(titulo, doc.internal.pageSize.width / 2, imgY + imgHeight + 20, { align: 'center' });

    // Agregar el contenido del encabezado y el cuerpo del reporte
    autoTables(doc, {
      head: [encabezado],
      body: cuerpo,
      startY: imgY + imgHeight + 40 // Comenzar debajo de la imagen, con un espacio de 10 píxeles
    });

    // Agregar el paginado encima de la franja naranja en la parte inferior
    const pageCount = doc.getNumberOfPages();
    for (let i = 1; i <= pageCount; i++) {
      doc.setPage(i);
      addOrangeStripe(); // Agregar franja naranja en la parte inferior

      // Agregar el paginado con fondo blanco y sombra
      doc.setFontSize(12); // Tamaño de fuente para el paginado
      doc.setFillColor(255, 255,255); // Color blanco
      doc.rect(doc.internal.pageSize.width - 80, doc.internal.pageSize.height - 35, 60, 25, 'F'); // Fondo blanco
      doc.setTextColor(0); // Color negro para el texto
      doc.text(`Página ${i} de ${pageCount}`, doc.internal.pageSize.width - 80 + 30, doc.internal.pageSize.height - 17, { align: 'center' });
    }

    // Generar la URL segura del PDF
    const blobUrl = doc.output('bloburl');
    return this.sanitizer.bypassSecurityTrustResourceUrl(blobUrl.toString());
  }
}
