import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Petcarer } from './petcarer';
import { PetCarerProfile } from './petcarerprofile';
import { Observable } from 'rxjs';
// Daniele
import { Petowner } from './petowner';


@Injectable({
  providedIn: 'root'
})
export class EnrollmentService {

  petCarerInfo: any = {};

 
  _url = 'http://localhost:3000/enroll';
  _getUrl = 'http://localhost:3000/carerProfile';
  _ownerUrl = 'http://localhost:3000/petOwner';


  constructor( 
    private _http:HttpClient 
  ) 
  { }

  setMessage(data){
    this.petCarerInfo = data
  }

  getMessage(){
    return this.petCarerInfo
  }
  

  //req, res the response should be sent to petcarer.component.ts
  enroll(user: Petcarer){
    return this._http.post<any>(this._url, user); 
  }

  //req, res the response should be sent to petcarerprofile.component.ts
  getProfile(): Observable <PetCarerProfile[]> {
    return this._http.get<PetCarerProfile[]>(this._getUrl);
  }

  getCarerSingleProfile(id: number): Observable<PetCarerProfile> {
    const url = `${this._getUrl}/${id}`;
    return this._http.get<PetCarerProfile>(url);
    //implement handle error here
  }

  petOwner(user: Petowner){
    return this._http.post<any>(this._ownerUrl, user); //req, res the response component sholud be sent to register.component.ts
  }

  // getByEmail(email: string) {
  //   return this._http.get<
  // }

 


}
