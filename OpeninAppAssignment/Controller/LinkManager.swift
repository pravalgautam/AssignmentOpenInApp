//
//  LinkManager.swift
//  OpeninAppAssignment
//
//  Created by Praval Gautam on 15/04/24.
//
import Foundation

class LinkManager {
    
    let authToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"
    
    func fetchdashboard() async -> DashboardResponseModel? {
        
        let url = URL(string: "https://api.inopenapp.com/api/v1/dashboardNew")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NSError(domain: "HTTP Error", code: (response as? HTTPURLResponse)?.statusCode ?? 0, userInfo: nil)
            }
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(DashboardResponseModel.self, from: data)
            print(decodedData)
            return decodedData
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
}
