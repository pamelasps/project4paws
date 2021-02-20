import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { PetCarerComponent } from './pet-carer/pet-carer.component';
import { PetCarerProfileComponent } from './pet-carer-profile/pet-carer-profile.component';

const routes: Routes = [
  { path:'', redirectTo: '/home', pathMatch:'full'},
  { path:'home', component: HomeComponent},
  { path:'petCarer', component:PetCarerComponent},
  { path:'profile', component:PetCarerProfileComponent}

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
