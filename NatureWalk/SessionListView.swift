//
//  SessionListView.swift
//  NatureWalk
//
//  Created by Simon Chan on 2024-06-12.
//

import SwiftUI

struct SessionListView: View {
    
    @StateObject var dataSource : DataSource = DataSource()
    
    @Environment(\.dismiss) var dismiss
    
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
            .navigationBarBackButtonHidden()
            .
//            .toolbar{
//                ToolbarItem(placement: .topBarTrailing) {
//                    Menu {
//                        Button(action: {
//                            favoritesList()
//                        }, label: {
//                            Text("FavoritesList")
//                        })
//                        
//                        Button(action: {
//                            logout()
//                        }, label: {
//                            Text("Logout")
//                        })
//                    } label: {
//                        Image(systemName: "gear")
//                            .foregroundStyle(.blue)
//                    }
//
//                }
//            }
        } //NavigationStack
    } //body
    
//    private func favoritesList() {
//        
//    }
//    
//    
//    private func logout() {
//        userDefaults.removeObject(forKey: UserDefaultsKey.user.rawValue)
//        dismiss()
//    }
    
} //SessionListView

#Preview {
    SessionListView()
}
