import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { PetCarerComponent } from './pet-carer/pet-carer.component';
<<<<<<< HEAD
import { PetCarerProfileComponent } from './pet-carer-profile/pet-carer-profile.component';
=======
import { SigninComponent } from './signin/signin.component';
>>>>>>> 3264736feab6efbd821f306880661342e6fc6ca1

const routes: Routes = [
  { path:'', redirectTo: '/home', pathMatch:'full'},
  { path:'home', component: HomeComponent},
  { path:'petCarer', component:PetCarerComponent},
<<<<<<< HEAD
  { path:'profile', component:PetCarerProfileComponent}

=======
  { path: 'signin', component:SigninComponent}
>>>>>>> 3264736feab6efbd821f306880661342e6fc6ca1
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
