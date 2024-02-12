import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';

export interface LoginResponse {
  token: string;
  message:string;
  // Add other properties that your backend might return
}

export interface RegisterResponse {
  message: string;
  // Add other properties that your backend might return
}

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiURL = 'http://localhost:3000/api/auth'; // Replace with your actual API URL

  constructor(private http: HttpClient, private router: Router) {}

  login(credentials: any): Observable<LoginResponse> {
    return this.http.post<LoginResponse>(`${this.apiURL}/login`, credentials);
  }
  
  register(data: any): Observable<RegisterResponse> {
    return this.http.post<RegisterResponse>(`${this.apiURL}/register`, data);
  }
}
