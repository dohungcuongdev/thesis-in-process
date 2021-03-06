import { Injectable, Injector } from '@angular/core';
import { Http, Response } from '@angular/http';
import ApiService from './api.service';
import { Activity } from '../model/activity';
import { Observable } from "rxjs/Observable";
import 'rxjs/add/operator/map';

@Injectable()
export class ActivityService extends ApiService<Activity> {

    constructor(injector: Injector, public _http: Http) {
        super(injector)
        this.apiUrl += 'activity/';
    }

    getAllActivity(): Observable<Activity[]> {
        return this.getAll()
    }

    getActivityByID(id: string): Observable<Activity> {
        return this.get(id)
    }

    getAllActivityByUserName(username: string): Observable<Activity[]> {
        return this.getAllby(username, this.apiUrl + "username/")
    }

    getFeedbackRoomById(room_id: string): Observable<Activity[]> {
        return this.getAllby(room_id, this.apiUrl + "feedback-room/")
    }

    addActivity(activity: Activity): Observable<Response> {
        return this.add(activity)
    }

    removeActivity(id: string): Observable<Response> {
        return this.remove(id)
    }

    editActivity(activity: Activity): Observable<Response> {
        return this.edit(activity._id, activity)
    }
}