//
//  ItemDetailModel.swift
//  Hotel Booking
//
//  Created by PC_iOS on 02/06/23.
//

import Foundation
import MapKit

struct ItemDetail : Identifiable{
    var id : String = ""
    var hotel_address: String = ""
    var hotel_name: String = ""
    var hotel_desc: String = ""
    var hotel_rent: String = ""
    var hotel_rating: String = ""
    var hotel_review: String = ""
    var hotel_photos : [String] = []
}

struct HotelLocation: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
