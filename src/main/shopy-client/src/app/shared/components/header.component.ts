import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import {
    HttpClient,
    HttpResponse,
    HttpHeaders,
    HttpErrorResponse
} from '@angular/common/http';
import { AuthService } from '../services/bundle';
import { Router } from '@angular/router';

@Component({
    selector: 'app-header',
    templateUrl: './header.component.html',
    styleUrls: ['./header.component.css'],
    encapsulation: ViewEncapsulation.None
})
export class HeaderComponent implements OnInit {
    constructor(private _auth: AuthService, private _router: Router) {}

    logout() {
        this._auth.logout().subscribe(
            (res: HttpResponse<JSON>) => {
                this._auth.removeToken();
                this._router.navigate(['/login']);
            },
            (err: HttpErrorResponse) => console.log(err)
        );
    }

    ngOnInit() {}
}
