import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { PetCarerComponent } from './pet-carer/pet-carer.component';
import { PetCarerProfileComponent } from './pet-carer-profile/pet-carer-profile.component';
import { SigninComponent } from './signin/signin.component';
import { RegisterComponent } from './register/register.component'
import { PetInformationComponent } from './pet-information/pet-information.component';
import { SearchComponent } from './search/search.component'
import { AboutComponent } from './about/about.component'
import { ContactusComponent } from './contactus/contactus.component'

const routes: Routes = [
  { path:'', redirectTo: '/home', pathMatch:'full'},
  { path:'home', component: HomeComponent},
  { path:'petCarer', component:PetCarerComponent},
  { path:'profile', component:PetCarerProfileComponent},
  { path: 'signin', component:SigninComponent},
  { path: 'register', component:RegisterComponent},
  { path: 'petInfo', component:PetInformationComponent},
  { path: 'about', component:AboutComponent},
  { path: 'contactUs', component:ContactusComponent},
  { path: 'search', component:SearchComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
