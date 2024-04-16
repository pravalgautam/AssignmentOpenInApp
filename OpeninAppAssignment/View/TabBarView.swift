//
//  TabBarView.swift
//  OpeninAppAssignment
//
//  Created by Praval Gautam on 15/04/24.
//
import SwiftUI

struct TabBarView: View {
    @Binding var selectedTab: Int
    let tabItemsLeft = ["Links", "Courses"]
    let leftImages = ["link","magazine"]
    let tabItemsRight = ["Links", "Courses"]
    let RightImages = ["fast-forward","user"]
    
    var body: some View {
        ZStack {
            VStack {
                Image("Union")
                    .resizable()
                    .frame(width: 150, height: 25)
                    .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
                
                RectangleView()
                    .frame(height: 100)
                    .background(Color.white)
               
                    .offset(y: -10)
                    .overlay(
                   
                        HStack(spacing: 30) {
                           
                               
                            TabBarButton(imageName: leftImages[0], tabNumber: 0, titleName: tabItemsLeft[0], selectedTab: $selectedTab)
                                .padding(.bottom,25)
                            TabBarButton(imageName: leftImages[1], tabNumber: 1, titleName: tabItemsLeft[1], selectedTab: $selectedTab)
                                .padding(.bottom,25)
                            Button(action: {
                       
                            }) {
                                Circle()
                                    .fill(.blue)
                                    .frame(width: 60,height: 60)
                             
                                    .overlay(
                                Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.white)
                                )
                            }.offset(y:-31)
                          
                                TabBarButton(imageName: RightImages[0], tabNumber: 3, titleName:  tabItemsRight[0], selectedTab: $selectedTab)
                                .padding(.bottom,25)
                                TabBarButton(imageName: RightImages[1], tabNumber: 4, titleName:  tabItemsRight[1], selectedTab: $selectedTab)
                                .padding(.bottom,25)
                            
                        }
                    )
            }
        }.frame(height: 77)
    }
}

struct RectangleView: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height = geometry.size.height
                let startX: CGFloat = 0
                let startY: CGFloat = 0
                let rectWidth = width
                let rectHeight = height
                
                path.move(to: CGPoint(x: startX, y: startY))
                path.addLine(to: CGPoint(x: startX + rectWidth, y: startY))
                path.addLine(to: CGPoint(x: startX + rectWidth, y: startY + rectHeight))
                path.addLine(to: CGPoint(x: startX, y: startY + rectHeight))
                path.closeSubpath()
            }
            .fill(Color.white)
        }
    }
}

struct TabBarButton: View {
   
    let imageName: String
    let tabNumber: Int
    let titleName : String
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack(){
            Button(action: {
                selectedTab = tabNumber
            }) {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding(8)
                
            }
            Text(titleName)
                .foregroundStyle(.black)
                .font(.system(size: 11))
        }


    }
}

