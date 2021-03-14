import { Component, OnInit } from '@angular/core';
import { Petowner } from '../petowner';
import { EnrollmentService } from '../enrollment.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

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
  }

  trigger(){
    this.showMe=!this.showMe;
    this.hideMe=!this.hideMe;
  }


}


