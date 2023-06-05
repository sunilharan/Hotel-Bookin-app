//
//  HomeDetailViewModel.swift
//  Hotel Booking
//
//  Created by PC_iOS on 02/06/23.
//

import Foundation
import SwiftUI
import Combine
import MapKit

final class HomeDetailViewModel: ObservableObject {

    // MARK: Output
    @Published var hotelDetailData: ItemDetail = .init()
    var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    let annotations = [HotelLocation(name: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275))]
    
    init() {
        self.getHotelDetailData()
    }
    
    func getHotelDetailData(){
        self.hotelDetailData = .init()
        let respDict = loadJson(filename: "hotel_detail_data")
        if let dataDict    = respDict?.value(forKey: "data") as? NSDictionary {
            self.hotelDetailData = self.parseItemDetailData(dict: dataDict)
        }
    }
    
    func parseItemDetailData(dict: NSDictionary) -> ItemDetail {
        var obj             = ItemDetail()
        obj.id              = dict.value(forKey: "id") as? String ?? ""
        obj.hotel_address   = dict.value(forKey: "hotel_address") as? String ?? ""
        obj.hotel_name      = dict.value(forKey: "hotel_name") as? String ?? ""
        obj.hotel_desc      = dict.value(forKey: "hotel_desc") as? String ?? ""
        obj.hotel_rent      = dict.value(forKey: "hotel_rent") as? String ?? ""
        obj.hotel_rating    = dict.value(forKey: "hotel_rating") as? String ?? ""
        obj.hotel_review    = dict.value(forKey: "hotel_review") as? String ?? ""
        let hotel_photos    = dict.value(forKey: "hotel_photos") as? NSArray ?? NSArray()
        for objData in hotel_photos{
            obj.hotel_photos.append(objData as! String)
        }
        return obj
    }
}
