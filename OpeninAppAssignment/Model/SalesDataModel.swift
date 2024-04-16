//
//  SalesDataModel.swift
//  OpeninAppAssignment
//
//  Created by Praval Gautam on 16/04/24.
//

import Foundation

struct SaleData: Identifiable {
    let id = UUID()
    let date: Date
    let amount: Double
    
    init(year: Int, month: Int, day: Int, amount: Double) {
        self.date = Calendar.current.date(from: .init(year: year, month: month, day: day)) ?? Date()
        self.amount = amount
    }
}
