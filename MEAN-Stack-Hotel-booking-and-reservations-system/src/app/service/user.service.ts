import { Injectable, Injector } from '@angular/core';
import { Http, Response } from '@angular/http';
import ApiService from './api.service';
import { User } from '../model/user';
import { Observable } from "rxjs/Observable";
import 'rxjs/add/operator/map';

@Injectable()
export class UserService extends ApiService<User> {
    
    constructor(injector: Injector, public _http: Http) {
        super(injector)
        this.apiUrl += 'users/';
    }

    getUser(id: string): Observable<User> {
        return this.get(id)
    }

    editUser(user: User): Observable<Response> {
        return this.edit(user._id, user)
    }
}