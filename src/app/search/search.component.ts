import { Component, OnInit } from '@angular/core';
import { Booking } from '../booking';
import { EnrollmentService } from '../enrollment.service';

@Component({
    selector: 'search',
    templateUrl: './search.component.html',
    styleUrls: ['./search.component.css']
    })

    
    // for testing DB purpose but not visible in the browser
    export class SearchComponent {
      booking = new Booking ('', '', '', '','');
      res: any;

      constructor(
        private _enrollmentService: EnrollmentService
      ) { }

      // elements: any = [
      //   {id: 1, first: 'Mark', last: 'Otto', handle: '@mdo'},
      //   {id: 2, first: 'Jacob', last: 'Thornton', handle: '@fat'},
      //   {id: 3, first: 'Larry', last: 'the Bird', handle: '@twitter'},
      // ];
    
      // headElements = ['ID', 'First', 'Last', 'Handle'];

      // myFunction() {
      //   alert("Request sent!");
      
      // }

      myFunction(){
        this._enrollmentService.getBooking(this.booking)
       .subscribe(      
         data => {
         this.res = data;
         console.log('Success!' + this.res);
        },
         error => console.error('Error!', error)
       )
      }

      cancelFunc(){
        this._enrollmentService.getCancel(this.booking)
       .subscribe(      
         data => {
         this.res = data;
         console.log('Success!' + this.res);
        },
         error => console.error('Error!', error)
       )
      }
    
    }

    

  
  