import { Injectable, Injector } from '@angular/core';
import { Http, Response } from '@angular/http';
import ApiService from './api.service';
import { HotelService } from '../model/hotel-service';
import { Observable } from "rxjs/Observable";
import 'rxjs/add/operator/map';

@Injectable()
export class RestaurantService extends ApiService<HotelService> {
    
    constructor(injector: Injector, public _http: Http) {
        super(injector)
        this.apiUrl += 'hotel-services/';
    }

    getAllService(): Observable<HotelService[]> {
        return this.getAll()
    }

    getHotelService(id: string): Observable<HotelService> {
        return this.get(id)
    }

    editHotelService(hotel_service: HotelService): Observable<Response> {
        return this.edit(hotel_service._id, hotel_service)
    }
}