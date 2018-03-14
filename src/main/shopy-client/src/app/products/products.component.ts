import {
    Component,
    OnInit,
    ChangeDetectorRef,
    ViewEncapsulation,
    AfterViewInit,
    OnDestroy
} from '@angular/core';
import { HttpResponse, HttpErrorResponse } from '@angular/common/http';

import { ProductService } from './products.service';
import { Category, Product, FilterModel, Size, Brand } from './models/bundle';

@Component({
    templateUrl: './products.component.html',
    styleUrls: ['./products.component.css'],
    encapsulation: ViewEncapsulation.None
})
export class ProductListComponent implements OnInit, AfterViewInit, OnDestroy {
    filter: FilterModel;
    products: Product[];
    categories: Category[];
    sizes: Size[];
    brands: Brand[];
    hoveredElementIndex: number;
    throttle: any;

    script: any;

    constructor(private _productService: ProductService) {}

    // Load navigation animation
    private _loadScripts() {
        const body = <HTMLDivElement>document.body;
        this.script = document.createElement('script');
        this.script.innerHTML = '';
        this.script.src = 'assets/script.js';
        this.script.async = true;
        this.script.defer = true;
        body.appendChild(this.script);
    }

    // Destroy navigation animation
    private _destroyScripts() {
        const body = <HTMLDivElement>document.body;
        const elems = body.getElementsByTagName('script');
        body.removeChild(elems[elems.length - 1]);
    }

    // Load all categories
    private _loadCategories() {
        this._productService
            .loadCategories()
            .subscribe(
                (data: Category[]) => (this.categories = data),
                (err: HttpErrorResponse) => console.log(err)
            );
    }

    // Load all sizes
    private _loadSizes() {
        this._productService
            .loadSizes()
            .subscribe(
                (data: Size[]) => (this.sizes = data),
                (err: HttpErrorResponse) => console.log(err)
            );
    }

    // Load all sizes
    private _loadBrands() {
        this._productService
            .loadBrands()
            .subscribe(
                (data: Brand[]) => (this.brands = data),
                (err: HttpErrorResponse) => console.log(err)
            );
    }

    // Load all products
    loadProducts(filter: FilterModel) {
        this._productService.loadProducts(filter).subscribe(
            (data: any[]) => {
                if (this.filter.page > 0) {
                    data['products'].forEach(product => {
                        this.products.push(product);
                    });
                } else {
                    this.products = data['products'];
                }
                this.filter.options = data['options'];
            },
            (err: HttpErrorResponse) => console.log(err)
        );
    }

    // Load all products
    loadProductsPageSize() {
        this._productService.loadProductsPageSize().subscribe(
            (data: HttpResponse<JSON>) => {
                this.filter.options = <any>data;
                this.filter.priceRange = [
                    this.filter.options.min,
                    this.filter.options.max
                ];
                this.loadProducts(this.filter);
            },
            (err: HttpErrorResponse) => console.log(err)
        );
    }

    loadMore() {
        if (this.filter.page <= this.filter.options.pageCount) {
            this.filter.page += 1;
            this.loadProducts(this.filter);
        }
    }

    // Keyup Event
    onKeyUpRange(event, key: number) {
        // Current value
        const val = event.target.value;
        // Copy object
        const oldPriceRange = Object.assign({}, this.filter.priceRange);
        if (key === 0) {
            // Start value can't be non existant or less than :min or more than :max
            if (
                !val ||
                val < this.filter.options.min ||
                val > oldPriceRange[key + 1]
            ) {
                oldPriceRange[key] = this.filter.options.min;
            } else {
                oldPriceRange[key] = val;
            }
        } else if (key === 1) {
            // End value can't be non existant or more than :max or less than :min
            if (
                !val ||
                val > this.filter.options.max ||
                val < oldPriceRange[key - 1]
            ) {
                oldPriceRange[key] = this.filter.options.max;
            } else {
                oldPriceRange[key] = val;
            }
        }
        this.filter.priceRange = oldPriceRange;
    }

    onCategoryChange(category) {
        if (category.hasOwnProperty('code')) {
            this.filter.category = category.code;
            this.filter.isHotDeal = false;
        } else {
            this.filter.category = null;
            this.filter.isHotDeal = true;
        }
        this._onFilterChange();
    }

    onPriceChange() {
        this._onFilterChange();
    }

    onSizeChange(size: Size) {
        const index = this.filter.sizes.findIndex(obj => obj === size.code);
        console.log(index);
        if (index !== -1) {
            this.filter.sizes.splice(index, 1);
        } else {
            this.filter.sizes.push(size.code);
        }
        this._onFilterChange();
    }

    onBrandChange(brand: Brand) {
        const index = this.filter.brands.findIndex(obj => obj === brand.code);
        console.log(index);
        if (index !== -1) {
            this.filter.brands.splice(index, 1);
        } else {
            this.filter.brands.push(brand.code);
        }
        this._onFilterChange();
    }

    private _onFilterChange() {
        clearTimeout(this.throttle);
        this.throttle = setTimeout(() => {
            this.filter.page = 0;
            this.loadProducts(this.filter);
        }, 1000);
    }

    loadData() {
        this._loadCategories();
        this._loadSizes();
        this._loadBrands();
        this.loadProductsPageSize();
    }

    ngAfterViewInit() {
        this._loadScripts();
    }

    ngOnInit() {
        this.products = [];
        this.filter = new FilterModel();
        this.loadData();
    }

    ngOnDestroy() {
        this._destroyScripts();
    }
}
