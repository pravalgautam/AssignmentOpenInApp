//
//  ChartCard.swift
//  OpeninAppAssignment
//
//  Created by Praval Gautam on 15/04/24.
//

import SwiftUI
import Charts

struct SaleChartCard: View {
    
    let saleData = [
        SaleData(year: 2024, month: 1, day: 1, amount: 23),
        SaleData(year: 2024, month: 2, day: 1, amount: 36),
        SaleData(year: 2024, month: 3, day: 1, amount: 49),
        SaleData(year: 2024, month: 4, day: 1, amount: 75),
        SaleData(year: 2024, month: 5, day: 1, amount: 100),
        SaleData(year: 2024, month: 6, day: 1, amount: 50),
        SaleData(year: 2024, month: 7, day: 1, amount: 26),
        SaleData(year: 2024, month: 8, day: 1, amount: 100)
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Sales Overview")
                    .foregroundStyle(.primary)
                    .font(.custom("Figtree-Regular", size: 14))
                Spacer()
                HStack {
                    Text("Jan 24 - Aug 24")
                        .foregroundStyle(.black)
                        .font(.custom("Figtree-Regular", size: 12))
                    Image(systemName: "clock")
                        .resizable()
                        .foregroundStyle(.gray)
                        .frame(width: 12, height: 12)
                }
                .padding(.all, 5)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                        .opacity(0.5)
                        .foregroundStyle(.clear)
                }
            }
            .padding(.bottom, 10)
            Chart {
                ForEach(saleData) { item in
                    LineMark(
                        x: .value("Month", item.date),
                        y: .value("Amount", item.amount)
                    )
                }
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .month)) { value in
                    AxisGridLine()
                    AxisValueLabel(format: .dateTime.month(.abbreviated))
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .frame(height: 150)
        }
        .padding(.all, 10)
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 8))
        .padding([.horizontal, .bottom])
    }
}

#Preview {
    SaleChartCard()
}
