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
                        NavigationLink(destination: FavoritesListView()) {
                            Text("Favorites List")
                        }
                        
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
    private func logout() {
        standardUserDefaults.removeObject(forKey: UserDefaultsKey.user.rawValue)
        dismiss()
    }
}

extension View {
    func shareToolbar() -> some View {
        self.modifier(Toolbar())
    }
}
