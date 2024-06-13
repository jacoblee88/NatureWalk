//
//  SessionListView.swift
//  NatureWalk
//
//  Created by Simon Chan on 2024-06-12.
//

import SwiftUI

struct SessionListView: View {
    
    @StateObject var dataSource : DataSource = DataSource()
    
    @StateObject var favoritesListDataSource : FavoritesListDataSource = FavoritesListDataSource()

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack{
                List(dataSource.sessionList){ session in
                    ListItemView(session: session)
                }
            } //VStack
            .navigationTitle(Text("Sessions List"))
            .navigationBarTitleDisplayMode(.large)
            .navigationBarBackButtonHidden()
            .shareToolbar()
        }
        .environmentObject(dataSource)
        .environmentObject(favoritesListDataSource)
        //NavigationStack
    } //body

    
} //SessionListView

#Preview {
    SessionListView()
}
