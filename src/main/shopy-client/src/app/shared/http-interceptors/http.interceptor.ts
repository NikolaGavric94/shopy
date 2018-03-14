import { Injectable, Injector } from '@angular/core';
import {
    HttpEvent,
    HttpInterceptor,
    HttpHandler,
    HttpRequest,
    HttpErrorResponse
} from '@angular/common/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/observable/throw';
import 'rxjs/add/operator/catch';
import { CookieService } from 'ngx-cookie-service';
import { Router } from '@angular/router';
import { AuthService } from '../services/bundle';

@Injectable()
export class MyHttpInterceptor implements HttpInterceptor {
    constructor(private _auth: AuthService, private _router: Router) {}

    intercept(
        req: HttpRequest<any>,
        next: HttpHandler
    ): Observable<HttpEvent<any>> {
        let authReq = req;

        if (this._auth.isLoggedIn()) {
            authReq = req.clone({
                headers: req.headers.set(
                    this._auth.tokenName,
                    this._auth.getToken()
                )
            });
        }

        return next
            .handle(authReq)
            .catch((error: HttpErrorResponse, caught) => {
                if (error instanceof HttpErrorResponse) {
                    if (error.status === 401 || error.status === 403) {
                        this._auth.removeToken();
                        this._router.navigate(['/login']);
                    }
                }
                return Observable.throw(error);
            });
    }
}
