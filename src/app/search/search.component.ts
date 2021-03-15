import { Component, OnInit } from '@angular/core';

@Component({
    selector: 'search',
    templateUrl: './search.component.html',
    styleUrls: ['./search.component.css']
    })

    
    // for testing DB purpose but not visible in the browser
    export class SearchComponent {
      elements: any = [
        {id: 1, first: 'Mark', last: 'Otto', handle: '@mdo'},
        {id: 2, first: 'Jacob', last: 'Thornton', handle: '@fat'},
        {id: 3, first: 'Larry', last: 'the Bird', handle: '@twitter'},
      ];
    
      headElements = ['ID', 'First', 'Last', 'Handle'];

      myFunction() {
        alert("Request sent!");
      
      }
    
    }