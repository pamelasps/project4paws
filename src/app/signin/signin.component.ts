import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-signin',
  templateUrl: './signin.component.html',
  styleUrls: ['./signin.component.css']
})
export class SigninComponent implements OnInit {

  username:string = "";
  password:string = "";
  message:string = "";
  constructor() { }

  ngOnInit(): void {
  }

  LoginUser(){
    if (this.username == 'admin' && this.password == '123'){
      this.message = "Login Successful!!";
    }
  }

}
