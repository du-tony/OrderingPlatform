import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService, RegisterResponse } from 'src/app/services/auth.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent {
  registerForm: FormGroup;
  successMessage: string = '';
  errorMessage: string = '';

  constructor(private fb: FormBuilder, private authService: AuthService, private router:Router) {
    this.registerForm = this.fb.group({
      username: ['', [Validators.required]],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6)]],
      clinicName: [''], 
      phone: ['', [Validators.required, Validators.pattern(/^\+?\d{10,15}$/)]], // Example pattern for phone numbers
      gender: ['', [Validators.required]]
    });
  }

  onRegister() {
    if (this.registerForm.invalid) {
      this.errorMessage = 'Please fill in all fields correctly.';
      return;
    }

    this.authService.register(this.registerForm.value).subscribe({
      next: (_) => { // Use underscore if the response is not used
        this.router.navigate(['/login']);
      },
      error: (error:RegisterResponse) => {
        this.errorMessage = error.message || 'An error occurred during registration.';
      }
    });
  }
}
