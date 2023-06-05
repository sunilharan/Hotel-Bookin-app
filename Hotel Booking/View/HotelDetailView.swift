//
//  HotelDetailView.swift
//  Hotel Booking
//
//  Created by PC_iOS on 02/06/23.
//

import SwiftUI
import MapKit

struct HotelDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var homeDetailVM: HomeDetailViewModel
    @State var showCalendarSheet = false
    
    var body: some View {
        VStack(spacing:0){
            HStack(spacing:17){
                Button{
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
                Text(homeDetailVM.hotelDetailData.hotel_name)
                    .font(FontHelper.SFProText_SemiboldFontWithSize(size: 17))
                    .foregroundColor(.black)
                Spacer()
                Button{
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
            
            ScrollView{
                VStack(alignment: .leading){
                    ZStack{
                        TabView {
                            ForEach(homeDetailVM.hotelDetailData.hotel_photos, id: \.self) { item in
                                Image(item)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 300)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle())
                        .frame(height: 300)
                        
                        VStack{
                            Spacer()
                            HStack{
                                Spacer()
                                Button{
                                    
                                } label: {
                                    ZStack{
                                        Image("ic_map_layer")
                                    }
                                    .frame(width: 52, height: 52)
                                    .background(Color(hex: "#F2F2F7"))
                                    .clipShape(Circle())
                                    .padding()
                                }
                            }
                        }
                    }
                    .padding(.vertical)
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text(homeDetailVM.hotelDetailData.hotel_name)
                            .font(FontHelper.SFProText_SemiboldFontWithSize(size: 22))
                            .foregroundColor(.black)
                        Text(homeDetailVM.hotelDetailData.hotel_address)
                            .font(FontHelper.SFProText_RegularFontWithSize(size: 17))
                            .foregroundColor(Color(hex: "#3C3C43"))
                            .opacity(0.6)
                        
                        HStack(spacing:0){
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .foregroundColor(Color(hex: "#FFA500"))
                                .padding(.trailing, 7)
                            Text(homeDetailVM.hotelDetailData.hotel_rating)
                                .font(FontHelper.SFProText_SemiboldFontWithSize(size: 16))
                                .foregroundColor(.black)
                            Text("(\(homeDetailVM.hotelDetailData.hotel_review) reviews)")
                                .font(FontHelper.SFProText_RegularFontWithSize(size: 16))
                                .foregroundColor(Color(hex: "#3C3C43"))
                                .opacity(0.6)
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing:20){
                            Text(homeDetailVM.hotelDetailData.hotel_desc)
                                .font(FontHelper.SFProText_RegularFontWithSize(size: 16))
                                .foregroundColor(Color(hex: "#3C3C43"))
                            Text(homeDetailVM.hotelDetailData.hotel_rent)
                                .font(FontHelper.SFProText_SemiboldFontWithSize(size: 22))
                                .foregroundColor(.black)
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing:20){
                            Text("Location")
                                .font(FontHelper.SFProText_SemiboldFontWithSize(size: 16))
                                .foregroundColor(Color.black)
                            Map(coordinateRegion: $homeDetailVM.region,annotationItems: homeDetailVM.annotations) {
                                MapAnnotation(coordinate: $0.coordinate) {
                                    Image("ic_location_pin")
                                        .resizable()
                                        .frame(width: 48, height: 48)
                                        .scaledToFit()
                                }
                            }
                            .frame(width: nil, height: 215)
                        }
                    }
                    .padding()
                }
            }
            
            Button{
                self.showCalendarSheet.toggle()
            } label: {
                HStack(spacing:11){
                    Image("ic_book_now")
                    Text("Book Now")
                        .font(FontHelper.SFProText_SemiboldFontWithSize(size: 17))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: 52)
                .background(Color(hex: "#0057FF"))
                .clipShape(Capsule())
                .padding()
            }
            .buttonStyle(.plain)
        }
        .sheet(isPresented: $showCalendarSheet) {
            HotelDetailCalendarView(homeDetailCalendarVM: .init(), isPresented: $showCalendarSheet)
                .presentationDetents([.height(UIScreen.main.bounds.height-200)])
        }
        .navigationBarHidden(true)
    }
}

struct HotelDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HotelDetailView(homeDetailVM: .init())
    }
}
