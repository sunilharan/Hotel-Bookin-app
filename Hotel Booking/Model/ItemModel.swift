//
//  ItemModel.swift
//  Hotel Booking
//
//  Created by PC_iOS on 02/06/23.
//

import Foundation

struct Item : Identifiable{
    var id : String = ""
    var user_name : String = ""
    var user_photo : String = ""
    var user_address: String = ""
    var hotel_name: String = ""
    var hotel_desc: String = ""
    var hotel_date: String = ""
    var hotel_rent: String = ""
    var is_official: Bool = false
    var hotel_photos : [String] = []
}
