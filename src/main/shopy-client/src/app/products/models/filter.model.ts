export class FilterModel {
    page: number;
    category: string;
    priceRange: number[];
    sizes: string[];
    brands: string[];
    isHotDeal: boolean;

    options: {max: number, min: number, pageCount: number};

    constructor(page = 0, category = '', priceRange = [0, 40], sizes = [], brands = [], isHotDeal = false, options = {max: 450, min: 0, pageCount: 0}) {
        this.page = page;
        this.category = category;
        this.priceRange = priceRange;
        this.sizes = sizes;
        this.brands = brands;
        this.isHotDeal = false;
        this.options = options;
    }
}
