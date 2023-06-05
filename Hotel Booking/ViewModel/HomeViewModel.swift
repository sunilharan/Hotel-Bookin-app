//
//  HomeViewModel.swift
//  Hotel Booking
//
//  Created by PC_iOS on 02/06/23.
//

import Foundation
import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {

    // MARK: Output
    @Published var hotelsArray: [Item] = []
    @Published var filterArray: [HotelFilterTypeEnum] = []
    @Published var selectedFilter : HotelFilterTypeEnum = .booked
    
    init() {
        self.getHotelArrayData()
        self.filterArray = [.booked, .partner, .rented]
    }
    
    func getHotelArrayData(){
        self.hotelsArray.removeAll()
        let dataDict = loadJson(filename: "hotels_data")
        if let dataArray    = dataDict?.value(forKey: "data") as? NSArray {
            for objDict in dataArray{
                hotelsArray.append(self.parseItemData(dict: objDict as! NSDictionary))
            }
        }
    }
    
    func parseItemData(dict: NSDictionary) -> Item {
        var obj             = Item()
        obj.id              = dict.value(forKey: "id") as? String ?? ""
        obj.user_name       = dict.value(forKey: "user_name") as? String ?? ""
        obj.user_photo      = dict.value(forKey: "user_photo") as? String ?? ""
        obj.user_address    = dict.value(forKey: "user_address") as? String ?? ""
        obj.hotel_name      = dict.value(forKey: "hotel_name") as? String ?? ""
        obj.hotel_desc      = dict.value(forKey: "hotel_desc") as? String ?? ""
        obj.hotel_date      = dict.value(forKey: "hotel_date") as? String ?? ""
        obj.hotel_rent      = dict.value(forKey: "hotel_rent") as? String ?? ""
        obj.is_official     = dict.value(forKey: "is_official") as? Bool ?? false
        let hotel_photos    = dict.value(forKey: "hotel_photos") as? NSArray ?? NSArray()
        for objData in hotel_photos{
            obj.hotel_photos.append(objData as! String)
        }
        return obj
    }
}

func loadJson(filename fileName: String) -> NSDictionary? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let dictionary = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? NSDictionary
            return dictionary
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
