import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Petcarer } from './petcarer';
import { PetCarerProfile } from './petcarerprofile';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class EnrollmentService {

  _url = 'http://localhost:3000/enroll';
  _getUrl = 'http://localhost:3000/carerProfile';

  constructor( 
    private _http:HttpClient 
  ) 
  { }

  enroll(user: Petcarer){
    return this._http.post<any>(this._url, user); //req, res the response component should be sent to petcarer.component.ts
  }

  getProfile(): Observable <PetCarerProfile[]> {
    return this._http.get<PetCarerProfile[]>(this._getUrl);
  }
}
