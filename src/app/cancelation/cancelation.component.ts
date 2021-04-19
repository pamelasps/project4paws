import { Component, OnInit } from '@angular/core';
import { Canceling } from '../canceling';
import { EnrollmentService } from '../enrollment.service';

@Component({
  selector: 'app-cancelation',
  templateUrl: './cancelation.component.html',
  styleUrls: ['./cancelation.component.css']
})
export class CancelationComponent implements OnInit {
  showAlertCF2: boolean = false;
  showCF2: boolean = false;
  hideCF1:boolean = true;
  cancelation = new Canceling ('', '', '', '','');
  res: any;

  constructor( private _enrollmentService: EnrollmentService ) { }

  ngOnInit(): void {
  }

  caFunction(){
    this._enrollmentService.getCancel(this.cancelation)
   .subscribe(      
     data => {
     this.res = data;
     console.log('Success!' + this.res);
    },
     error => console.error('Error!', error)
   );
   this.hideCF1=!this.hideCF1;
   this.showAlertCF2=!this.showAlertCF2;
  }

  trigger2(){
    this.hideCF1=!this.hideCF1;
    this.showAlertCF2=!this.showAlertCF2;
  }

}
