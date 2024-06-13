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
        NavigationView {
            List {
                ForEach(favoritesListDataSource.sessionList) { session in
                    NavigationLink(destination: SessionDetailView(selectedSession: session)
                        .environmentObject(favoritesListDataSource)) {
                        ListItemView(session: session)
                    }
                }
                .onDelete(perform: deleteSession)
            }
            .navigationBarTitle("Favorites")
            .navigationBarItems(trailing: Button(action: {
                favoritesListDataSource.clear()
            }) {
                Text("Clear All")
            })
        }
    }

    private func deleteSession(at offsets: IndexSet) {
        favoritesListDataSource.deleteSession(at: offsets)
    }
}



