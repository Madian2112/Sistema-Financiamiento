import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'adminStatus'
})
export class AdminStatusPipe implements PipeTransform {

  transform(value: number): string {
    return value === 1 ? 'Sí' : 'No';
  }

}
