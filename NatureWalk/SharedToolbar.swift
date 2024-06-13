//
//  SharedToolbar.swift
//  NatureWalk
//
//  Created by Simon Chan on 2024-06-12.
//

import SwiftUI

struct Toolbar: ViewModifier {
    
    @Environment(\.dismiss) var dismiss
   
    func body(content: Content) -> some View {
        content
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button(action: {
                            favoritesList()
                        }, label: {
                            Text("FavoritesList")
                        })
                        
                        Button(action: {
                            logout()
                        }, label: {
                            Text("Logout")
                        })
                    } label: {
                        Image(systemName: "gear")
                            .foregroundStyle(.blue)
                    }

                }
            }
    }
    private func favoritesList() {
        
    }
    
    private func logout() {
        userDefaults.removeObject(forKey: UserDefaultsKey.user.rawValue)
        dismiss()
    }
}

extension View {
    func shareToolbar() -> some View {
        self.modifier(Toolbar())
    }
}
