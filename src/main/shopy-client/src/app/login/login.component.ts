import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { LoginModel } from './models/login.model';
import { HttpResponse, HttpErrorResponse } from '@angular/common/http';
import { CookieService } from 'ngx-cookie-service';
import { Router } from '@angular/router';
import { AuthService } from '../shared/services/bundle';

@Component({
    templateUrl: './login.component.html',
    styleUrls: ['./login.component.css'],
    encapsulation: ViewEncapsulation.None
})
export class LoginComponent implements OnInit {
    loginModel: LoginModel;
    error: string;

    constructor(private _auth: AuthService, private _router: Router) {}

    login() {
        this._auth.login(this.loginModel).subscribe(
            (res: HttpResponse<JSON>) => {
                this._auth.addToken(res.headers.get(this._auth.tokenName));
                this._router.navigate(['products']);
            },
            (err: HttpErrorResponse) => {
                if (err.status === 401) {
                    this.error = 'Wrong credentials';
                }
            }
        );
    }

    ngOnInit() {
        if (this._auth.isLoggedIn()) {
            this._router.navigate(['products']);
        }
        this.loginModel = new LoginModel();
    }
}
