//
//  SharedToolbar.swift
//  NatureWalk
//
//  Created by Simon Chan on 2024-06-12.
//

import SwiftUI

struct Toolbar: ViewModifier {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var dataSource : DataSource
    @EnvironmentObject var favoritesListDataSource : FavoritesListDataSource
   
    func body(content: Content) -> some View {
        content
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        NavigationLink(destination: FavoritesListView()
                            .environmentObject(dataSource)
                            .environmentObject(favoritesListDataSource)) {
                            Text("FavoritesList")
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
//        standardUserDefaults.removeObject(forKey: UserDefaultsKey.user.rawValue)
        if let window = UIApplication.shared.windows.first{
            window.rootViewController = UIHostingController(rootView: ContentView())
            window.makeKeyAndVisible()
        }
    }
}

extension View {
    func shareToolbar() -> some View {
        self.modifier(Toolbar())
    }
}
