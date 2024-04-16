//
//  DashBoardViewModel.swift
//  OpeninAppAssignment
//
//  Created by Praval Gautam on 16/04/24.
//

import Foundation

class DashboardViewModel: ObservableObject {
    
    @Published var dashboardStats: DashboardResponseModel?
    
    let networkManager = LinkManager()
    
    init() {
        fetchDashboard()
    }
    
    private func fetchDashboard() {
        Task {
            let data = await networkManager.fetchdashboard()
            if let data {
                DispatchQueue.main.async {
                    self.dashboardStats = data
                }
            }
        }
    }
    
}
