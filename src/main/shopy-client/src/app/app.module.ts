import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { RouterModule } from '@angular/router';

import { CookieService } from 'ngx-cookie-service';
import { SliderModule } from 'primeng/slider';

import { AppComponent } from './app.component';
import {
    appRoutes,
    PageNotFoundComponent,
    ProductListComponent,
    LoginComponent
} from './routes';
import { HeaderComponent } from './shared/components/bundle';
import { MyHttpInterceptor } from './shared/http-interceptors/bundle';
import { AuthService } from './shared/services/bundle';
import { AuthGuard } from './shared/guards/bundle';
import { ProductService } from './products/products.service';
import { SortBy } from './shared/pipes/sort.pipe';

@NgModule({
    declarations: [
        AppComponent,
        PageNotFoundComponent,
        ProductListComponent,
        LoginComponent,
        HeaderComponent,
        SortBy
    ],
    imports: [
        RouterModule.forRoot(appRoutes),
        BrowserModule,
        HttpClientModule,
        FormsModule,
        SliderModule,
        BrowserAnimationsModule
    ],
    providers: [
        AuthGuard,
        CookieService,
        AuthService,
        ProductService,
        {
            provide: HTTP_INTERCEPTORS,
            useClass: MyHttpInterceptor,
            multi: true
        }
    ],
    bootstrap: [AppComponent]
})
export class AppModule {}
