import { Injectable } from '@angular/core';
import { jsPDF } from 'jspdf';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import autoTable from 'jspdf-autotable';

@Injectable({
    providedIn: 'root'
})
export class ImpresionService {
    constructor(private sanitizer: DomSanitizer) {}

    imprimir(encabezado: string[], cuerpo: Array<any>, titulo: string, usuario: string): SafeResourceUrl {
        const doc = new jsPDF({
            orientation: 'portrait',
            unit: 'px',
            format: 'letter'
        });

        const img = new Image();
        img.src = 'assets/demo/images/credirapi-removebg-preview.png';

        const addHeader = () => {
            doc.setFillColor(204, 91, 27);
            doc.rect(0, 0, doc.internal.pageSize.width, 20, 'F');
            doc.addImage(img, 'PNG', 20, 20, 80, 40);
            doc.setTextColor(0, 0, 0);
            doc.setFontSize(20);
            doc.setFont('helvetica', 'bold');
            doc.text(titulo, 110, 50, { align: 'left' });
        };

        const addFooter = (pageNumber: number, pageCount: number) => {
            doc.setFillColor(247, 247, 247);
            doc.rect(doc.internal.pageSize.width - 80, doc.internal.pageSize.height - 35, 60, 25, 'F');
            doc.setFontSize(10);
            doc.setTextColor(0);
            doc.text(`Página ${pageNumber} de ${pageCount}`, doc.internal.pageSize.width - 50, doc.internal.pageSize.height - 22, { align: 'center' });
            const fechaImpresion = new Date().toLocaleDateString();
            doc.text(`PDF generado por: ${usuario} | Fecha: ${fechaImpresion}`, 10, doc.internal.pageSize.height - 22);
            doc.setFillColor(204, 91, 27);
            doc.rect(0, doc.internal.pageSize.height - 20, doc.internal.pageSize.width, 20, 'F');
        };

        const cuerpoConNumeros = cuerpo.map((fila, index) => [index + 1, ...fila]);

        autoTable(doc, {
            head: [['N.', ...encabezado]],
            body: cuerpoConNumeros,
            startY: 110,
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
            },
            didDrawPage: (data) => {
                addHeader();
                const pageCount = doc.getNumberOfPages();
                addFooter(data.pageNumber, pageCount);
            },
            margin: { top: 110 }
        });

        const blobUrl = doc.output('bloburl');
        return this.sanitizer.bypassSecurityTrustResourceUrl(blobUrl.toString());
    }
}
