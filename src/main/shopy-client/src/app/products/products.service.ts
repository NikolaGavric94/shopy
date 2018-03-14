import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs/Observable';
import { Category, FilterModel } from './models/bundle';

@Injectable()
export class ProductService {
    baseUrl = 'http://localhost:8080/api';
    headers: HttpHeaders = new HttpHeaders({
        'Content-Type': 'application/json'
    });

    constructor(private _http: HttpClient) {}

    loadCategories(): Observable<any> {
        return this._http.get(this.baseUrl + '/categories');
    }

    loadSizes(): Observable<any> {
        return this._http.get(this.baseUrl + '/sizes');
    }

    loadBrands(): Observable<any> {
        return this._http.get(this.baseUrl + '/brands');
    }

    loadProducts(filter: FilterModel): Observable<any> {
        return this._http.post(this.baseUrl + '/products', filter);
    }

    loadProductsPageSize() {
        return this._http.get(this.baseUrl + '/products/options');
    }
}
