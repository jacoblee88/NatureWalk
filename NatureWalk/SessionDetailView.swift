//
//  SessionDetailView.swift
//  NatureWalk
//
//  Created by Simon Chan on 2024-06-12.
//

import SwiftUI

struct SessionDetailView: View {
    
    @State var selectedSession : Session
    @EnvironmentObject var dataSource : DataSource
    @EnvironmentObject var favoritesListDataSource : FavoritesListDataSource
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 10){
                    ForEach(selectedSession.photo, id: \.self) { url in
                        AsyncImage(url: URL(string: url)) { image in
                            image.image?.resizable()
                            .frame(maxWidth: .infinity, maxHeight: 240)
                        }
                    }
                    
                    Text(self.selectedSession.name)
                        .font(.title3)
                        .bold()
                    Text("Description :  \(self.selectedSession.description)")
                    Text("Star Rating :  \(String(repeating: "★", count: self.selectedSession.starRating))")
                    Text("Organization Hosting :  \(self.selectedSession.organizationName)")
                    
                    HStack{
                        Text("Contact :")
                        Button(action: {
                            if let call = URL(string: "tel://\(selectedSession.phone)"), UIApplication.shared.canOpenURL(call){
                                UIApplication.shared.open(call, options: [:], completionHandler: nil)
                            }
                        }){
                            Text(selectedSession.phone)
                        }
                    } //HStack_contact
                   
                    Text("Price :  $\(String(self.selectedSession.pricing)) / person")
                    
                    HStack{
                        Button{
                            favoritesListDataSource.insetSession(selectedSession) // Add to favorites
                        }label: {
                            Text("Add to Favorites")
                        }
                        .buttonStyle(.borderedProminent)
                        Button{
                            // Add share functionality here
                        }label: {
                            Text("Share")
                        }
                        .buttonStyle(.borderedProminent)
                        ShareLink("Share", item: "\(selectedSession.name), $\(String(selectedSession.pricing))")
                            .buttonStyle(.borderedProminent)
//                        Button{
//              
//                        }label: {
//                            Text("Share")
//                        }
//                        .buttonStyle(.borderedProminent)
                    } //HStack_button
                    
                    
                    
                    Spacer()
                } //VStack
                .padding()
                .navigationTitle(Text("Session Details"))
                .shareToolbar()
            } //ScrollView
        } //NavigationStack
    } //body
} //View

