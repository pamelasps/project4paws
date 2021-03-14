import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Petcarer } from './petcarer';
// Daniele
//import{ RegisterComponent } from './register/register.component';
import { Petowner } from './petowner';
//import { PetCarerProfile } from '../petcarerprofile';

@Injectable({
  providedIn: 'root'
})
export class EnrollmentService {

  _url = 'http://localhost:3000/enroll';
  _geturl = 'http://localhost:3000/petOwner';


  constructor( 
    private _http:HttpClient 
  ) 
  { }

  enroll(user: Petcarer){
    return this._http.post<any>(this._url, user); //req, res the response component sholud be sent to petcarer.component.ts
  }

  petOwner(user: Petowner){
    return this._http.post<any>(this._geturl, user); //req, res the response component sholud be sent to register.component.ts
  }

}

