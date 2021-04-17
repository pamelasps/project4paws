
import { Component, OnInit } from '@angular/core';


@Component({
  selector: 'cancel',
  templateUrl: './cancel.component.html',
  styleUrls: ['./cancel.component.css']
})
export class CancelComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

  myFunction() {
    alert("Cancellation Request sent!");
  
  }
  
  
}

