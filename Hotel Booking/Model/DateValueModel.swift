//
//  DateValueModel.swift
//  Hotel Booking
//
//  Created by PC_iOS on 03/06/23.
//

import SwiftUI

struct DateValue : Identifiable {
    var id = UUID().uuidString
    var day : Int
    var date : Date
}
