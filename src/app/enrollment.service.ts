import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Petcarer } from './petcarer';
//import { PetCarerProfile } from '../petcarerprofile';

@Injectable({
  providedIn: 'root'
})
export class EnrollmentService {

  _url = 'http://localhost:3000/enroll';

  constructor( 
    private _http:HttpClient 
  ) 
  { }

  enroll(user: Petcarer){
    return this._http.post<any>(this._url, user); //req, res the response component sholud be sent to petcarer.component.ts
  }
}
