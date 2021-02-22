import { Component, OnInit } from '@angular/core';
import { Petcarer } from '../petcarer';
import { EnrollmentService } from '../enrollment.service';

@Component({
  selector: 'app-pet-carer',
  templateUrl: './pet-carer.component.html',
  styleUrls: ['./pet-carer.component.css']
})
export class PetCarerComponent implements OnInit {
  petCarerInfo = new Petcarer('John', 'john@email.com', 'St Thomas', 'ON', 'M6K5R7', 'CA', 12345678);

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

}
