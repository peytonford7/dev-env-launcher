import { bootstrapApplication } from '@angular/platform-browser';
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  standalone: true,
  template: '<h1>Put Your Application Here!</h1>'
})
class AppComponent {}

bootstrapApplication(AppComponent).catch((err) => console.error(err));
