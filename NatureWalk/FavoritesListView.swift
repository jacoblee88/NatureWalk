//
//  FavoritesListView.swift
//  NatureWalk
//
//  Created by Simon Chan on 2024-06-12.
//
import SwiftUI

struct FavoritesListView: View {
    @EnvironmentObject var favoritesListDataSource : FavoritesListDataSource

    var body: some View {
        NavigationStack {
            VStack{
                List {
                    ForEach(favoritesListDataSource.sessionList) { session in
                        ListItemView(session: session)
        
                    }
                    .onDelete(perform: deleteSession)
                }
            }
            
            .navigationBarTitle("Favorites")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button(action: {
                            favoritesListDataSource.clear()
                        }){
                            Text("Clear All")
                        }
                        
                        Button(action: {
                            logout()
                        }, label: {
                            Text("Logout")
                        })
                    }label: {
                        Image(systemName: "gear")
                            .foregroundStyle(.blue)
                    }
                }
            }
            
        }
        
    }
    
    private func logout() {
        if let window = UIApplication.shared.windows.first{
            window.rootViewController = UIHostingController(rootView: ContentView())
            window.makeKeyAndVisible()
        }
    }

    private func deleteSession(at offsets: IndexSet) {
        favoritesListDataSource.deleteSession(at: offsets)
    }
}



