import { Injectable } from '@angular/core';
import { jsPDF } from 'jspdf';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { CellEditor } from 'primeng/table';
import autoTables from 'jspdf-autotable'


@Injectable({
  providedIn: 'root'
})


export class ImpresionService {

  constructor(private sanitizer: DomSanitizer) { } 

  imprimir(encabezado: string [], cuerpo: Array<any>, titulo: string): SafeResourceUrl {
    const doc = new jsPDF({
      orientation: 'portrait',
      unit: 'px',
      format: 'letter'
    });

    console.log(cuerpo)
    doc.text(titulo, doc.internal.pageSize.width / 2,25, {align: 'center'});

    autoTables(doc, {
      head: [encabezado],
      body: cuerpo,
    })

    const blobUrl = doc.output('bloburl');
    console.log(blobUrl)
    return this.sanitizer.bypassSecurityTrustResourceUrl(blobUrl.toString());
  }
}
