import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-contactus',
  templateUrl: './contactus.component.html',
  styleUrls: ['./contactus.component.css']
})
export class ContactusComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

  myFunction() {
    alert("Message sent successfully!");
    (<HTMLInputElement>document.getElementById("exampleFormControlInput1")).value = ""; 
    (<HTMLInputElement>document.getElementById("exampleFormControlInput2")).value = ""; 
    (<HTMLInputElement>document.getElementById("exampleFormControlTextarea1")).value = ""; 
  
  }

}
