//
//  HotelCellView.swift
//  Hotel Booking
//
//  Created by PC_iOS on 02/06/23.
//

import SwiftUI

struct HotelCellView: View {
    
    @State var item: Item

    var body: some View {
        VStack(alignment: .leading, spacing:0){
            VStack(alignment: .leading, spacing:0){
                HStack(spacing:12){
                    Image(item.user_photo)
                        .resizable()
                        .frame(width: 48, height: 48)
                        .scaledToFill()
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing:0){
                        HStack(spacing: 4){
                            Text(item.user_name)
                                .font(FontHelper.SFProText_SemiboldFontWithSize(size: 16))
                                .foregroundColor(.black)
                            if item.is_official{
                                Image("ic_official_tick_mark")
                                    .resizable()
                                    .frame(width: 14, height: 14)
                                    .scaledToFit()
                            }
                            Spacer()
                            Button{
                                
                            } label: {
                                Image(systemName: "ellipsis")
                                    .foregroundColor(.black)
                            }
                        }
                        Text(item.user_address)
                            .font(FontHelper.SFProText_RegularFontWithSize(size: 15))
                            .foregroundColor(Color(hex: "#3C3C43"))
                            .opacity(0.6)
                    }
                    Spacer()
                }
                TabView {
                    ForEach(item.hotel_photos, id: \.self) { item in
                        Image(item)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 250)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(height: 250)
                .padding(.vertical)
                VStack(alignment: .leading, spacing: 4){
                    Text(item.hotel_name)
                        .font(FontHelper.SFProText_SemiboldFontWithSize(size: 16))
                        .foregroundColor(.black)
                    Text(item.hotel_desc)
                        .font(FontHelper.SFProText_RegularFontWithSize(size: 13))
                        .foregroundColor(Color(hex: "#3C3C43"))
                        .opacity(0.6)
                    Text(item.hotel_date)
                        .font(FontHelper.SFProText_RegularFontWithSize(size: 13))
                        .foregroundColor(Color(hex: "#3C3C43"))
                        .opacity(0.6)
                    Text(item.hotel_rent)
                        .font(FontHelper.SFProText_RegularFontWithSize(size: 15))
                        .foregroundColor(.black)
                }
            }
            .padding()
            .background(.white)
            Divider()
                .frame(height: 4)
                .background(Color(hex: "#F2F2F7"))
        }
    }
}

struct HotelCellView_Previews: PreviewProvider {
    static var previews: some View {
        HotelCellView(item: Item())
    }
}
