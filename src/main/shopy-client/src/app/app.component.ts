import { Component, OnInit } from '@angular/core';
import {
    HttpClient,
    HttpResponse,
    HttpHeaders,
    HttpErrorResponse
} from '@angular/common/http';
import { AuthService } from './shared/services/bundle';
import { Router } from '@angular/router';

@Component({
    selector: 'app-root',
    templateUrl: './app.component.html',
    styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
    constructor(public router: Router) {}

    ngOnInit() {}
}
