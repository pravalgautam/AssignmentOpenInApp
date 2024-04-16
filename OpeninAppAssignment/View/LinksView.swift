//
//  LinksView.swift
//  OpeninAppAssignment
//
//  Created by Praval Gautam on 15/04/24.
//

import SwiftUI

struct LinksView: View {
    @StateObject private var dashViewModel = DashboardViewModel()
    
    @State private var selectedOption = 0
    var body: some View {
        VStack{
            ScrollView(showsIndicators:false) {

                    HStack {
                        Text("Dashboard")
                            .bold()
                            .font(.system(size: 24))
                            .foregroundStyle(.white)
                        Spacer()
                        RoundedRectangle(cornerRadius: 12.0)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                            .opacity(0.2)
                            .overlay {
                                Image("wrench")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 26.67, height: 26.67)
                            }
                        
                    }
                    .padding(.top,40)
                    .frame(height: 124)
                    .padding(.horizontal, 16)
                    .background(.tabBar)
                
                ZStack{
                    Color.bg
                    .cornerRadius(20)
            
                    VStack{
                    
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(getGreeting())
                                    .foregroundStyle(.gray)
                                    .padding(.top, 32)
                                    .padding(.horizontal, 16)
                                
                                Text("Ajay Manva 👋")
                                    .foregroundColor(.black)
                                    .font(.system(size: 24))
                                    .padding(.horizontal, 16)
                            }
                            Spacer()
                        }
                        SaleChartCard()
                                   .padding(.top,24)
                                    HStack {
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            HStack {
                                                ForEach(CardData, id: \.id) { i in
                                                    item(itemCardModel: i)
                                                }
                                            }
                                            .padding(.leading, 16)
                        
                                        }
                                    }
                                    .padding(.top, 20)
                                   CustomPicker(selectedOption: $selectedOption)
                                        .padding(.top, 40)
                                    if selectedOption == 0 {
                                        if let topLinks = dashViewModel.dashboardStats?.data.top_links {
                                            ForEach(topLinks, id: \.url_id) { link in
                                                LinkCard(topLinkData: link)
                                                    .padding(.top,36)
                                            }
                                        }
                                    } else {
                                        if let recentLinks = dashViewModel.dashboardStats?.data.recent_links {
                                            ForEach(recentLinks, id: \.url_id) { link in
                                                LinkCard(topLinkData: link)
                                                    .padding(.top,36)
                                            }
                                        }
                                    }
                        
                      
                        ButtonsView()
                        
                    }
                    
                    
                }        .offset(y:-16)
           
                
            }
            }
            .padding(.bottom, 60)
            
        }
    
    func getGreeting() -> String {
         let calendar = Calendar.current
         let hour = calendar.component(.hour, from: Date())
         switch hour {
             case 0..<5:
                 return "Good night"
             case 5..<12:
                 return "Good morning"
             case 12..<17:
                 return "Good afternoon"
             default:
                 return "Good evening"
         }
     }
    }


#Preview{
    LinksView()
}

struct ButtonsView:View {
    var body: some View {
        VStack{
            Button(action: {
                
            }) {
                HStack(spacing:12) {
                    Image("link")
                        .resizable()
                        .frame(width: 19, height: 19)
                        .rotationEffect(.degrees(12))
                    
                    Text("View all links")
                        .bold()
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                }
                .frame(width: 357, height: 48)
                
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
            }        .padding(.top,20)
            Button(action: {
                // Action when the button is tapped
            }) {
                HStack(spacing:12) {
                    Image("Group 7571")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .rotationEffect(.degrees(12))
                    
                    Text("Talk with us")
                        .bold()
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                    Spacer()
                }.padding(.horizontal,12)
                .frame(width: 357, height: 48)
                
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                        .fill(.talk)
                        .opacity(0.12)
                )
                            }        .padding(.top,40)
            Button(action: {
                
            }) {
                HStack(spacing:12) {
                    Image("question-mark")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .rotationEffect(.degrees(12))
                    
                    Text("Frequently asked Question")
                        .bold()
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                    Spacer()
                }.padding(.horizontal,12)
                .frame(width: 357, height: 48)
                
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                        .fill(.faq)
                )
            }
            .padding(.top,16)
        }
        }
    }
