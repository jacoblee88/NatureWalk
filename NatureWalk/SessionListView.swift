//
//  SessionListView.swift
//  NatureWalk
//
//  Created by Simon Chan on 2024-06-12.
//

import SwiftUI

struct SessionListView: View {
    
    @StateObject var dataSource : DataSource = DataSource()
    
    var body: some View {
        NavigationStack{
            VStack{
                List(dataSource.sessionList){ session in
                    ListItemView(session: session).environmentObject(self.dataSource)
                }
            } //VStack
//            .padding()
            .navigationTitle(Text("Sessions List"))
            .navigationBarTitleDisplayMode(.large)
        } //NavigationStack
    } //body
} //SessionListView

#Preview {
    SessionListView()
}
