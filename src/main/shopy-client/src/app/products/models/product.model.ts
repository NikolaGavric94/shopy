import { Color } from './color.model';
import { Size } from './size.model';
import { Brand } from './brand.model';
import { Core } from './core.model';
import { Category } from './category.model';

export class Product extends Core {
    price: number;
    isHotDeal: boolean;
    brand: Brand;
    sizes: Size[];
    imageUrl: string;
    colors: Color[];
    category: Category;
}
