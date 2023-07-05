//
//  haberModel.swift
//  haberler
//
//  Created by Ali Burak Baraç on 28.06.2023.
//

import Foundation

struct haberModel: Codable {
    var news: [News]  

    struct News: Codable {
        var title: String
        var videoUrl: String
        var spot: String
        var image: String?
        
    }

    
}
