//
//  HotelDetailCalendarView.swift
//  Hotel Booking
//
//  Created by PC_iOS on 03/06/23.
//

import SwiftUI

struct HotelDetailCalendarView: View {
        
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var homeDetailCalendarVM: HotelDetailCalendarViewModel
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing:17){
                Button{
                    withAnimation {
                        homeDetailCalendarVM.previousMonth()
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
                Text("\(homeDetailCalendarVM.extractSelectedDateString())")
                    .font(FontHelper.SFProText_SemiboldFontWithSize(size: 17))
                    .foregroundColor(.black)
                Button{
                    withAnimation {
                        homeDetailCalendarVM.nextMonth()
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                }
                Spacer()
                Button{
                    dismiss.callAsFunction()
                } label: {
                    ZStack{
                        Image(systemName: "xmark")
                            .frame(width: 11, height: 11)
                            .foregroundColor(Color(hex: "#3C3C43"))
                            .opacity(0.6)
                    }
                    .frame(width: 30, height: 30)
                    .background(Color(hex: "#F2F2F7"))
                    .clipShape(Circle())
                }
            }
            .padding(.horizontal)
            .padding(.vertical)
            
            ScrollView{
                VStack(alignment: .leading){
                    // Day View...
                    HStack(spacing:0){
                        ForEach(homeDetailCalendarVM.days, id: \.self) { day in
                            Text(day)
                                .font(FontHelper.SFProText_SemiboldFontWithSize(size: 13))
                                .foregroundColor(Color(hex: "#3C3C43"))
                                .opacity(0.3)
                                .frame(maxWidth:.infinity)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Date Grid View...
                    
                    let columns = Array(repeating: GridItem(.flexible()), count: 7)
                    LazyVGrid(columns: columns, spacing: 3) {
                        ForEach(homeDetailCalendarVM.extractDate()){ value in
                            CardView(value: value)
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.blue)
                                        .opacity(homeDetailCalendarVM.isDateBetweenStartAndEndDate(date: value.date) ? 1 : 0)
                                )
                                .onTapGesture {
                                    homeDetailCalendarVM.currentDate = value.date
                                    homeDetailCalendarVM.setupStartAndEndDate(date: value.date)
                                }
                        }
                    }
                    .padding(.horizontal)
                }
                VStack(alignment: .leading){
                    HStack(spacing:0){
                        Text("Guest")
                            .font(FontHelper.SFProText_SemiboldFontWithSize(size: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Button{
                            homeDetailCalendarVM.clearAll()
                        } label: {
                            Text("Clear")
                                .font(FontHelper.SFProText_RegularFontWithSize(size: 16))
                                .foregroundColor(Color(hex: "#0057FF"))
                        }
                    }
                    .padding()
                    Divider()
                        .padding(.horizontal)
                    HStack(spacing:0){
                        VStack(alignment: .leading, spacing:3){
                            Text("Adults")
                                .font(FontHelper.SFProText_RegularFontWithSize(size: 14))
                                .foregroundColor(.black)
                            Text("after 18")
                                .font(FontHelper.SFProText_RegularFontWithSize(size: 12))
                                .foregroundColor(Color(hex: "#3C3C43"))
                                .opacity(0.6)
                        }
                        Spacer()
                        HStack(spacing:5){
                            Button{
                                homeDetailCalendarVM.minusAdult()
                            } label: {
                                Text("-")
                                    .font(FontHelper.SFProText_RegularFontWithSize(size: 16))
                                    .foregroundColor(.black)
                                    .frame(width: 20, height: 20)
                            }
                            Text("\(homeDetailCalendarVM.adult_counter)")
                                .font(FontHelper.SFProText_SemiboldFontWithSize(size: 16))
                                .foregroundColor(.black)
                            
                            Button{
                                homeDetailCalendarVM.addAdult()
                            } label: {
                                Text("+")
                                    .font(FontHelper.SFProText_RegularFontWithSize(size: 16))
                                    .foregroundColor(.black)
                                    .frame(width: 20, height: 20)
                            }
                        }
                    }
                    .padding()
                    Divider()
                        .padding(.horizontal)
                    HStack(spacing:0){
                        VStack(alignment: .leading, spacing:3){
                            Text("Children's")
                                .font(FontHelper.SFProText_RegularFontWithSize(size: 14))
                                .foregroundColor(.black)
                            Text("0 - 12 years")
                                .font(FontHelper.SFProText_RegularFontWithSize(size: 12))
                                .foregroundColor(Color(hex: "#3C3C43"))
                                .opacity(0.6)
                        }
                        Spacer()
                        HStack(spacing:5){
                            Button{
                                homeDetailCalendarVM.minusChildren()
                            } label: {
                                Text("-")
                                    .font(FontHelper.SFProText_RegularFontWithSize(size: 16))
                                    .foregroundColor(.black)
                                    .frame(width: 20, height: 20)
                            }
                            Text("\(homeDetailCalendarVM.children_counter)")
                                .font(FontHelper.SFProText_SemiboldFontWithSize(size: 16))
                                .foregroundColor(.black)
                            
                            Button{
                                homeDetailCalendarVM.addChildren()
                            } label: {
                                Text("+")
                                    .font(FontHelper.SFProText_RegularFontWithSize(size: 16))
                                    .foregroundColor(.black)
                                    .frame(width: 20, height: 20)
                            }
                        }
                    }
                    .padding()
                    Divider()
                        .padding(.horizontal)
                }
                .padding(.top)
            }
            
            Button{

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
        }
        .onChange(of: homeDetailCalendarVM.currentMonth) { newValue in
            homeDetailCalendarVM.currentDate = homeDetailCalendarVM.getCurrentMonth()
        }
    }
    
    @ViewBuilder
    func CardView(value: DateValue) -> some View{
        VStack(spacing:0){
            if value.day != -1{
                Text("\(value.day)")
                    .font(homeDetailCalendarVM.isSameDay(date1: value.date, date2: Date()) ? FontHelper.SFProText_SemiboldFontWithSize(size: 20) :  FontHelper.SFProText_RegularFontWithSize(size: 20))
                    .foregroundColor(homeDetailCalendarVM.isDateBetweenStartAndEndDate(date: value.date) ? .white : .black)
                    .frame(maxWidth: .infinity)
            }
        }
        .padding(.vertical, 8)
    }
}

struct HotelDetailCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        HotelDetailCalendarView(homeDetailCalendarVM: .init(), isPresented: .constant(false))
    }
}
