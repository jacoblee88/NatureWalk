//
//  Session.swift
//  NatureWalk
//
//  Created by Simon Chan on 2024-06-12.
//

import Foundation

struct Session : Identifiable{
    var id: UUID = UUID()
    
    var name: String
    var description: String
    var starRating: Int
    var organizationName: String
    var photo: [String]
    var pricing: Double
    var phone: String
    
    init(name: String, description: String, starRating: Int, organizationName: String, photo: [String], pricing: Double, phone: String) {
        self.name = name
        self.description = description
        self.starRating = starRating
        self.organizationName = organizationName
        self.photo = photo
        self.pricing = pricing
        self.phone = phone
    }
    
}
