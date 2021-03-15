import { Component, OnInit } from '@angular/core';
import { Petowner } from '../petowner';
import { EnrollmentService } from '../enrollment.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

  showAlertCF2: boolean = false;
  showCF2: boolean = false;
  hideCF1:boolean = true;

  showMe: boolean = false;
  hideMe:boolean = true;
  petOwnerInfo = new Petowner('','','','','','','','','','','','','','','');
  

  constructor(
    private _enrollmentService: EnrollmentService
  ) { }

  ngOnInit(): void {
  }

  onSubmit(){
    this._enrollmentService.petOwner(this.petOwnerInfo)
    .subscribe(
      data => console.log('Success!', data),
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