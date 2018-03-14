import { Pipe, PipeTransform } from '@angular/core';
import { Core } from '../../products/models/core.model';

@Pipe({ name: 'sortBy' })
export class SortBy implements PipeTransform {
    transform(arr: any[], sortBy: string = 'id'): any[] {
        return arr.sort((a, b) => {
            if (a[sortBy] < b[sortBy]) {
                return -1;
            } else if (a[sortBy] > b[sortBy]) {
                return 1;
            } else {
                return 0;
            }
        });
    }
}
