import { Component, OnInit } from '@angular/core';
import { Petcarer } from '../petcarer';
import { EnrollmentService } from '../enrollment.service';


@Component({
  selector: 'app-pet-carer',
  templateUrl: './pet-carer.component.html',
  styleUrls: ['./pet-carer.component.css']
})

export class PetCarerComponent implements OnInit {
  showMe: boolean = false;
  hideMe:boolean = true;
  petCarerInfo = new Petcarer('', '','','', '', '', '', '', 9876543210,'','','','','','');
  

  constructor(
    private _enrollmentService: EnrollmentService
  ) { }

  ngOnInit(): void {
  }

  onSubmit(){
    //console.log(this.petCarerInfo);
    this._enrollmentService.enroll(this.petCarerInfo)
    .subscribe(
      data => console.log('Success!', data),
      error => console.error('Error!', error)
    )
  }

  trigger(){
    this.showMe=!this.showMe;
    this.hideMe=!this.hideMe;
  }




}
