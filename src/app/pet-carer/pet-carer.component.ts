import { Component, OnInit } from '@angular/core';
import { Petcarer } from '../petcarer';
import { EnrollmentService } from '../enrollment.service';


@Component({
  selector: 'app-pet-carer',
  templateUrl: './pet-carer.component.html',
  styleUrls: ['./pet-carer.component.css']
})

export class PetCarerComponent implements OnInit {
  showAlertCF2: boolean = false;
  showCF2: boolean = false;
  hideCF1:boolean = true;
  petCarerInfo = new Petcarer('', '','','', '', '', '', '', '', '','','','','','','','','','','','');
  res: any;
 
  constructor(
    private _enrollmentService: EnrollmentService
  ) { }

  ngOnInit(): void {
    this._enrollmentService.setMessage(this.petCarerInfo);
  }

  onSubmit(){
     this._enrollmentService.enroll(this.petCarerInfo)
    .subscribe(      
      data => {
      this.res = data;
      console.log('Success!' + this.res);
      this._enrollmentService.getCarerSingleProfile(this.res);
    },
      error => console.error('Error!', error)
    )
    this.showCF2=!this.showCF2;
    this.showAlertCF2=!this.showAlertCF2;

  }

  trigger(){
    this.showCF2=!this.showCF2;
    this.hideCF1=!this.hideCF1;
  }

  trigger2(){
    this.showCF2=!this.showCF2;
    this.showAlertCF2=!this.showAlertCF2;
  }




}
