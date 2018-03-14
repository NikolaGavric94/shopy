import { Injectable } from '@angular/core';
import {
    HttpClient,
    HttpHeaders,
    HttpResponse,
    HttpErrorResponse
} from '@angular/common/http';
import { CookieService } from 'ngx-cookie-service';
import { LoginModel } from '../../login/models/login.model';
import { Observable } from 'rxjs/Observable';

@Injectable()
export class AuthService {
    baseUrl = 'http://localhost:8080';
    tokenName = 'X-Auth-Token';
    headers: HttpHeaders = new HttpHeaders({
        'Content-Type': 'application/json'
    });

    constructor(private _http: HttpClient, private _cookies: CookieService) {}

    login(login: LoginModel): Observable<any> {
        return this._http.post(
            this.baseUrl + '/login',
            { username: login.username, password: login.password },
            { headers: this.headers, observe: 'response' }
        );
    }

    logout(): Observable<any> {
        return this._http.post(
            this.baseUrl + '/logout',
            {},
            { headers: this.headers }
        );
    }

    removeToken(): void {
        this._cookies.delete(this.tokenName);
    }

    addToken(token: string): void {
        this._cookies.set(this.tokenName, token);
    }

    getToken(): string {
        return this._cookies.get(this.tokenName);
    }

    isLoggedIn(): boolean {
        return this._cookies.check(this.tokenName);
    }
}
