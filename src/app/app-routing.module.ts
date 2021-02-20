import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { PetCarerComponent } from './pet-carer/pet-carer.component';
import { SigninComponent } from './signin/signin.component';

const routes: Routes = [
  { path:'', redirectTo: '/home', pathMatch:'full'},
  { path:'home', component: HomeComponent},
  { path:'petCarer', component:PetCarerComponent},
  { path: 'signin', component:SigninComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
