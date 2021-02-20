import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavbarComponent } from './navbar/navbar.component';
import { HomeComponent } from './home/home.component';
import { FooterComponent } from './footer/footer.component';
import { PetCarerComponent } from './pet-carer/pet-carer.component';
import { PetCarerProfileComponent } from './pet-carer-profile/pet-carer-profile.component';

import { SigninComponent } from './signin/signin.component';

import { FormsModule } from '@angular/forms';


@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    HomeComponent,
    FooterComponent,
    PetCarerComponent,
<<<<<<< HEAD
    PetCarerProfileComponent   
=======
    SigninComponent
>>>>>>> 3264736feab6efbd821f306880661342e6fc6ca1
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
