//
//  HomeView.swift
//  Hotel Booking
//
//  Created by PC_iOS on 02/06/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var homeVM: HomeViewModel
    @Namespace private var animation
    @Binding var isPushToDetail: Bool

    var body: some View {
        VStack(spacing:0){
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(homeVM.filterArray, id: \.self) { filterData in
                        Button {
                            withAnimation(.spring()) {
                                self.homeVM.selectedFilter = filterData
                            }
                        } label: {
                            HotelFilterCellView(name: filterData, isSelected: filterData == homeVM.selectedFilter ? true : false, animation: animation)
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
            }
            ScrollView{
                ForEach(homeVM.hotelsArray) { hotelData in
                    HotelCellView(item: hotelData)
                        .onTapGesture {
                            self.isPushToDetail = true
                        }
                }
            }
        }
        .onAppear(perform: { self.homeVM.getHotelArrayData()})
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homeVM: .init(), isPushToDetail: .constant(false))
    }
}
