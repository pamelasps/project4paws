import { Component, OnInit } from '@angular/core';
import { Petcarer } from '../petcarer';
import { PetCarerProfile } from '../petcarerprofile';
import { EnrollmentService } from '../enrollment.service';


@Component({
  selector: 'app-pet-carer-profile',
  templateUrl: './pet-carer-profile.component.html',
  styleUrls: ['./pet-carer-profile.component.css']
})
export class PetCarerProfileComponent implements OnInit {
//petCarerInfo = new Petcarer('', '', '', '', '', '', 12345);  
petCarerProfile = new PetCarerProfile('','','','','');

  constructor(
    private _enrollmentService: EnrollmentService
  ) { }

  ngOnInit(): void {
  }
  onSubmit(){
    console.log(this.petCarerProfile);
    //this._enrollmentService.enroll(this.petCarerProfile)
    //.subscribe(
     // data => console.log('Success!', data),
     // error => console.error('Error!', error)
   // )
  }

}
