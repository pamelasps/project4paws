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
import { RegisterComponent } from './register/register.component';
import { PetInformationComponent } from './pet-information/pet-information.component';

import { SearchComponent } from './search/search.component';


import { HttpClientModule } from '@angular/common/http';
import { ContactusComponent } from './contactus/contactus.component';
import { AboutComponent } from './about/about.component';
import { CancelationComponent } from './cancelation/cancelation.component';


@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    HomeComponent,
    FooterComponent,
    PetCarerComponent,
    PetCarerProfileComponent,
    SigninComponent,
    RegisterComponent,
    PetInformationComponent,
    SearchComponent,
    ContactusComponent,
    AboutComponent,
    CancelationComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
