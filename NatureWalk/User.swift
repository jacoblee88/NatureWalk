//
//  User.swift
//  NatureWalk
//
//  Created by Jacob Lee on 2024-06-12.
//

import Foundation
import Combine
import Foundation
import Combine

class User: ObservableObject, Codable {
    @Published var email: String
    @Published var password: String
    @Published var favoriteSessions: [Session]

    enum CodingKeys: CodingKey {
        case email, password, favoriteSessions
    }

    init(email: String, password: String, favoriteSessions: [Session] = []) {
        self.email = email
        self.password = password
        self.favoriteSessions = favoriteSessions
    }

    func clearFavorites() {
        favoriteSessions.removeAll()
    }
    
    func addFavorite(session: Session) {
        if !favoriteSessions.contains(where: { $0.id == session.id }) {
            favoriteSessions.append(session)
        }
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        email = try container.decode(String.self, forKey: .email)
        password = try container.decode(String.self, forKey: .password)
        favoriteSessions = try container.decode([Session].self, forKey: .favoriteSessions)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(email, forKey: .email)
        try container.encode(password, forKey: .password)
        try container.encode(favoriteSessions, forKey: .favoriteSessions)
    }
}

