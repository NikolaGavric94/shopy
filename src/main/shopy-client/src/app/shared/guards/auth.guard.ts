import {
    CanActivate,
    ActivatedRouteSnapshot,
    RouterStateSnapshot,
    Router
} from '@angular/router';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/Observable';
import { AuthService } from './../services/auth.service';

@Injectable()
export class AuthGuard implements CanActivate {
    constructor(private _auth: AuthService, private _router: Router) {}

    canActivate(
        route: ActivatedRouteSnapshot,
        state: RouterStateSnapshot
    ): Observable<boolean> | Promise<boolean> | boolean {
        const isLoggedIn = this._auth.isLoggedIn();
        if (!isLoggedIn) {
            this._router.navigate(['/login']);
        }
        return isLoggedIn;
    }
}
