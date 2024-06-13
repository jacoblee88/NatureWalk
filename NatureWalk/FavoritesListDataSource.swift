//
//  FavoritesListDataSource.swift
//  NatureWalk
//
//  Created by Jacob Lee on 2024-06-13.
//

import Foundation

class FavoritesListDataSource : ObservableObject{
    @Published var sessionList : [Session]
    
    init() {
        if let data = standardUserDefaults.value(forKey: UserDefaultsKey.user.rawValue) as? Data,
           let user = try? JSONDecoder().decode(User.self, from: data),
            let sessionData = standardUserDefaults.value(forKey: user.email) as? Data,
           let sessionList = try? JSONDecoder().decode([Session].self, from: sessionData) {
            self.sessionList = sessionList
        } else {
            self.sessionList = []
        }
    }
    
    func insetSession(_ session: Session) {
        if !sessionList.contains(where: { $0.name == session.name }) {
            sessionList.append(session)
            save()
        }
        
    }
    
    func deleteSession(at offsets: IndexSet) {
        sessionList.remove(atOffsets: offsets)
        save()
    }
    
    func save() {
        if let data = standardUserDefaults.value(forKey: UserDefaultsKey.user.rawValue) as? Data,
           let user = try? JSONDecoder().decode(User.self, from: data) {
            standardUserDefaults.set(try? JSONEncoder().encode(sessionList), forKey: user.email)
        }
    }
    
    func clear() {
        sessionList.removeAll()
        save()
    }
}

