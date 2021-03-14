import { Component, OnInit } from '@angular/core';
//import { Petcarer } from '../petcarer';
//import { PetCarerProfile } from '../petcarerprofile';
import { EnrollmentService } from '../enrollment.service';


@Component({
  selector: 'app-pet-carer-profile',
  templateUrl: './pet-carer-profile.component.html',
  styleUrls: ['./pet-carer-profile.component.css']
})
export class PetCarerProfileComponent implements OnInit {

  public carerProfile  = [] as any;

  constructor(private _profileService: EnrollmentService) { }

  ngOnInit() {
    this._profileService.getProfile()
    .subscribe(data => this.carerProfile = data);
  }
  

}
