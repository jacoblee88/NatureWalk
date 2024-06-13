//
//  FavoritesListView.swift
//  NatureWalk
//
//  Created by Simon Chan on 2024-06-12.
//
import SwiftUI

struct FavoritesListView: View {
    @ObservedObject var user: User

    var body: some View {
        NavigationView {
            List {
                ForEach(user.favoriteSessions) { session in
                    NavigationLink(destination: SessionDetailView(selectedSession: session)) {
                        ListItemView(session: session)
                    }
                }
                .onDelete(perform: deleteSession)
            }
            .navigationBarTitle("Favorites")
            .navigationBarItems(trailing: Button(action: {
                user.clearFavorites()
            }) {
                Text("Clear All")
            })
        }
    }

    private func deleteSession(at offsets: IndexSet) {
        user.favoriteSessions.remove(atOffsets: offsets)
    }
}

struct FavoritesListView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(email: "test@gmail.com", password: "test123")
        return FavoritesListView(user: user)
    }
}


