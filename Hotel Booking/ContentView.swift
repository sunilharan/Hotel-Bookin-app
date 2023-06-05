//
//  ContentView.swift
//  Hotel Booking
//
//  Created by PC_iOS on 02/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 0
    @State var isPushToDetail = false
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().unselectedItemTintColor = UIColor.black
    }
    
    var body: some View {
        ZStack{
            NavigationView {
                TabView(selection: $selection){
                    HomeView(homeVM: .init(), isPushToDetail: $isPushToDetail)
                        .tabItem {
                            Image("ic_tab_house")
                            Text("")
                        }
                        .tag(0)
                    
                    VStack{
                        Text("Chat")
                    }
                    .tabItem {
                        Image("ic_tab_chat")
                        Text("")
                    }
                    .tag(1)
                    
                    VStack{
                        Text("Notification")
                    }
                    .tabItem {
                        Image("ic_tab_notifications")
                        Text("")
                    }
                    .tag(2)
                    
                    VStack{
                        Text("Profile")
                    }
                    .tabItem {
                        Image("ic_tab_profile")
                        Text("")
                    }
                    .tag(3)
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
            .navigate(to: HotelDetailView(homeDetailVM: .init()), when: $isPushToDetail)
            .navigationViewStyle(.stack)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
