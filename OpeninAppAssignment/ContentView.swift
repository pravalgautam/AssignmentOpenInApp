//
//  ContentView.swift
//  OpeninAppAssignment
//
//  Created by Praval Gautam on 15/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var dashViewModel = DashboardViewModel()
    @State  var selectedTab = 0
    
    var body: some View {
        VStack {
            ZStack {
                switch selectedTab {
                case 0:
        LinksView()
                        .cornerRadius(20)
                        .offset(y:-25)
                case 1:
                    EmptyView()
                        
                case 3:
                    EmptyView()
                case 4:
                    EmptyView()
                default:
                    EmptyView()
                }
                VStack(spacing: 0) {
                  Spacer()
                    TabBarView(selectedTab: $selectedTab)
                        .background(Color.white)
                
                }.padding(.bottom,16)
            }
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    ContentView()
}

struct item:View {
    
    var itemCardModel : ItemCardModel
    
    var body: some View {
        ZStack{
            Color.white
            HStack{
                VStack(alignment:.leading){
                    Image(itemCardModel.image)
                        .resizable()
                        .frame(width: 32,height: 32)
                        .padding(.top,12)
                    Text(itemCardModel.heading)
                        .font(.system(size: 16))
                        .padding(.top,16)
                    Text(itemCardModel.subHeading)
                        .foregroundStyle(.gray)
                        .font(.system(size: 14))
                        .padding(.bottom,12)
                }.padding(.leading,12)
                Spacer()
            }
        }.frame(width: 120,height: 120)
            .cornerRadius(8)
    }
}
struct CustomPicker: View {
    
    @Binding var selectedOption: Int
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.selectedOption = 0
                }
            }) {
                Text("Top Links")
                    .frame(width: 101,height: 36)
                    .font(.system(size: 16))
                    .foregroundColor(selectedOption == 0 ? .white : .gray)
                    .background(selectedOption == 0 ? Color.blue : Color.bg)
                    .cornerRadius(50)
            }
            
            Button(action: {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.selectedOption = 1
                }
            }) {
                Text("Recent Links")
                    .frame(width: 125,height: 36)
                    .font(.system(size: 16))
                    .foregroundColor(selectedOption == 1 ? .white : .gray)
                    .background(selectedOption == 1 ? Color.blue : Color.bg)
     
                    .cornerRadius(50)
            }
            Spacer()
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
                .fill(.clear)
                .frame(width: 36,height: 36)
                .overlay(
                    Image("Generic")
                        .resizable()
                        .frame(width: 24,height: 24)
                )
        }.padding(.horizontal,16)
    }
}


          
