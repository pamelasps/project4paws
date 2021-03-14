import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Petcarer } from './petcarer';
<<<<<<< HEAD
// Daniele
//import{ RegisterComponent } from './register/register.component';
import { Petowner } from './petowner';
//import { PetCarerProfile } from '../petcarerprofile';
=======
// import { PetCarerProfile } from './petcarerprofile';
// import { Observable } from 'rxjs';

>>>>>>> main

@Injectable({
  providedIn: 'root'
})
export class EnrollmentService {

  _url = 'http://localhost:3000/enroll';
<<<<<<< HEAD
  _geturl = 'http://localhost:3000/petOwner';

=======
  // _getUrl = 'http://localhost:3000/carerProfile';
>>>>>>> main

  constructor( 
    private _http:HttpClient 
  ) 
  { }

  enroll(user: Petcarer){
    return this._http.post<any>(this._url, user); //req, res the response component should be sent to petcarer.component.ts
  }

  // getProfile(): Observable <PetCarerProfile[]> {
  //   return this._http.get<PetCarerProfile[]>(this._getUrl);
  // }

  petOwner(user: Petowner){
    return this._http.post<any>(this._geturl, user); //req, res the response component sholud be sent to register.component.ts
  }

}

