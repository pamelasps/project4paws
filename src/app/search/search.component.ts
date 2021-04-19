import { Component, OnInit } from '@angular/core';
import { Booking } from '../booking';
import { EnrollmentService } from '../enrollment.service';

@Component({
    selector: 'search',
    templateUrl: './search.component.html',
    styleUrls: ['./search.component.css']
    })

    
    export class SearchComponent {
      showAlertCF2: boolean = false;
      showCF2: boolean = false;
      hideCF1:boolean = true;
      booking = new Booking ('', '', '', '','');
      res: any;

      constructor(
        private _enrollmentService: EnrollmentService
      ) { }

    

      onSubmit(){
        
        this._enrollmentService.getBooking(this.booking)
       .subscribe(      
         data => {
         this.res = data;
         console.log('Success!' + this.res);
        },
         error => console.error('Error!', error)
       );
       this.showCF2=!this.showCF2;
       this.showAlertCF2=!this.showAlertCF2;
       
      }

      trigger(){
        
        this.hideCF1=!this.hideCF1;
        this.showCF2=!this.showCF2;
      }

      trigger2(){
        this.showCF2=!this.showCF2;
        this.showAlertCF2=!this.showAlertCF2;
      }
    
      
    }

    

  
  