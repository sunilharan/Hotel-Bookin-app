//
//  HotelFilterCellView.swift
//  Hotel Booking
//
//  Created by PC_iOS on 02/06/23.
//

import SwiftUI

struct HotelFilterCellView: View {
    
    var name: HotelFilterTypeEnum
    var isSelected : Bool
    var animation : Namespace.ID
    
    var body: some View {
        ZStack{
            if isSelected{
                Capsule()
                    .frame(height: 40)
                    .matchedGeometryEffect(id: "Tab_Change", in: animation)
            }
            Text(name.rawValue)
                .font(FontHelper.SFProText_SemiboldFontWithSize(size: 13))
                .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
                .background(isSelected ? .clear : Color(hex: "#F2F2F7"))
                .foregroundColor(isSelected ? Color.white : .black)
                .clipShape(Capsule())
        }
    }
}

struct HotelFilterCellView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homeVM: .init(), isPushToDetail: .constant(false))
    }
}
