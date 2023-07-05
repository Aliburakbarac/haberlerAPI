//
//  HaberlerViewModel.swift
//  haberler
//
//  Created by Ali Burak Baraç on 28.06.2023.
//

import Foundation

struct haberlerViewModel {
    typealias NewsCompletion = (haberModel?) -> Void
    
    func GetNews(completion: @escaping NewsCompletion) {
        var haber: haberModel? = nil
        
        guard let url = URL(string: "https://app.haberler.com/services/haberlercom/2.11/service.asmx/haberler?category=manset&count=35&offset=0&deviceType=1&userId=61ed99e0c09a8664") else {
            fatalError("Invalid URL")
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // Check if Error took place
            if let error = error {
                print("Error took place: \(error)")
                completion(nil)
                return
            }
            
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            // Check if Data is available
            guard let data = data else {
                print("Data is missing")
                completion(nil)
                return
            }
            
            // Convert HTTP data - JSON to struct
            let decoder = JSONDecoder()
            do {
                let haberler = try decoder.decode(haberModel.self, from: data)
                haber = haberler
                completion(haber)
            } catch {
                print("JSON decoding error: \(error)")
                completion(nil)
            }
        }
        
        task.resume()
    }
}




