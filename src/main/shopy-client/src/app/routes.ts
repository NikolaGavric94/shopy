import { RouterModule, Routes } from '@angular/router';

import { ProductListComponent } from './products/products.component';
import { LoginComponent } from './login/login.component';
import { PageNotFoundComponent } from './error/404.component';
import { AuthGuard } from './shared/guards/bundle';

const appRoutes: Routes = [
    { path: 'login', component: LoginComponent },
    {
        path: 'products',
        component: ProductListComponent,
        canActivate: [AuthGuard]
    },
    {
        path: '',
        redirectTo: 'login',
        pathMatch: 'full'
    },
    { path: '**', component: PageNotFoundComponent }
];

export {
    appRoutes,
    LoginComponent,
    ProductListComponent,
    PageNotFoundComponent
};
