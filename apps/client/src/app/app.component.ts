import { Component, OnInit } from '@angular/core';
import { EMPTY, Observable } from 'rxjs';
import { YodaService } from '@todo/fire-client';
import { schemaBuildable } from '@todo/schema-buildable';

@Component({
  selector: 'todo-root',
  template: `
    <p>
      Functions!
      <code>{{ response$ | async | json }}</code>
      <button (click)="request()">Call!</button>
    </p>
  `,
})
export class AppComponent {
  title = 'client';
  response$: Observable<any> = EMPTY;

  constructor(private yada: YodaService) {}

  async request() {
    this.response$ = this.yada.yada({});
  }
}
