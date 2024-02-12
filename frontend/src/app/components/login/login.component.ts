import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService, LoginResponse } from 'src/app/services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit{
  loginForm: FormGroup;
  errorMessage: string = '';
  

  constructor(private fb: FormBuilder, private authService: AuthService,private router:Router) {
    this.loginForm = this.fb.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6)]]
    });
  }
  ngOnInit() {
    console.log('hi');
  }

  onLogin() {
    if (this.loginForm.invalid) {
      this.errorMessage = 'Please fill in all fields correctly.';
      return;
    }

    this.authService.login(this.loginForm.value).subscribe({
      next: (_) => { // Use underscore if the response is not used
        this.router.navigate(['/home']);
      },
      error: (error:LoginResponse) => {
        this.errorMessage = error.message || 'An error occurred during login.';
      }
    });
  }
}
