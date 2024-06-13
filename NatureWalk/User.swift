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

struct User: Codable {
    var email: String
    var password: String

    func saveToUserDefaults() {
        standardUserDefaults.set(try? JSONEncoder().encode(self), forKey: UserDefaultsKey.user.rawValue)
    }
}

