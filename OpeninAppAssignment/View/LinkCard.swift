//
//  LinkCard.swift
//  OpeninAppAssignment
//
//  Created by Praval Gautam on 15/04/24.
//
import SwiftUI
struct LinkCard: View {
    var topLinkData: Links
    

    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        if let date = dateFormatter.date(from: topLinkData.created_at!) {
            dateFormatter.dateFormat = "dd MMMM yyyy"
            return dateFormatter.string(from: date)
        } else {
            return "Invalid Date"
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color.white) 
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
            
            VStack {
                Spacer()
                HStack(alignment: .top) {
                    AsyncImage(url: URL(string: topLinkData.original_image!)) { image in
                        image.image?
                            .resizable()
                            .frame(width: 48, height: 48)
                            .cornerRadius(8)
                    }
                    VStack(alignment: .leading) {
                        Text(topLinkData.title!)
                            .lineLimit(1)
                        Text(formattedDate())
                            .foregroundStyle(.gray)
                            .lineLimit(1)
                    }
                    Spacer()
                    VStack {
                        Text("\(topLinkData.total_clicks)")
                            .bold()
                        Text("Clicks")
                            .foregroundStyle(.gray)
                    }
                }
                .padding(.horizontal, 16)
                
                HStack {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [4, 4]))
                        .foregroundColor(.blue)
                        .frame(height: 40)
                        .background(Color.clear)
                        .padding()
                        .overlay(
                            Link(destination: URL(string: topLinkData.web_link)!) {
                                HStack {
                                    Text(topLinkData.web_link)
                                        .padding(.leading, 20)
                                        .lineLimit(1)
                                        .foregroundColor(.blue)
                                        .padding()
                                    Spacer()
                                    Image("copy")
                                        .resizable()
                                        .frame(width: 11.51, height: 14.25)
                                        .padding(.trailing,30)
                                }
                            })
                    
                }
            }
        }.padding(16)
        .frame(height: 116)
        
    }
}

struct RoundedBottomRectangle: Shape {
    var cornerRadius: CGFloat = 8
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        let radius = min(cornerRadius, min(width, height) / 2)
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: width, y: height - radius))
        path.addArc(center: CGPoint(x: width - radius, y: height - radius), radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        path.addLine(to: CGPoint(x: radius, y: height))
        path.addArc(center: CGPoint(x: radius, y: height - radius), radius: radius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        path.closeSubpath()
        
        return path
    }
}

