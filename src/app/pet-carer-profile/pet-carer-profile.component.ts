import { Component, OnInit, Input } from '@angular/core';
import { EnrollmentService } from '../enrollment.service';

@Component({
  selector: 'app-pet-carer-profile',
  templateUrl: './pet-carer-profile.component.html',
  styleUrls: ['./pet-carer-profile.component.css']
})
export class PetCarerProfileComponent implements OnInit {
  petCarerInfo: any = {};

  public carerProfile = [] as any;
  public singleProfile = [] as any;

  constructor(private _profileService: EnrollmentService) { }

  ngOnInit() {
    this.petCarerInfo = this._profileService.getMessage()
      
    /*
    //Get all PetCarer registered
    this._profileService.getProfile()
      .subscribe(data => this.carerProfile = data);
      
    //Get Single PetCarer registered
    this._profileService.getCarerSingleProfile(9)
      .subscribe(data => this.singleProfile = data);
     */
  }
}

/*
  getCarerSingleProfile(): void {
  const id = this.route.snapshot.paramMap.get('id');
  this._profileService.getCarerSingleProfile(1)
    .subscribe(data => this.singleProfile = data);
}
*/