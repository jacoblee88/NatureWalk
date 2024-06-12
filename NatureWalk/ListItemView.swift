//
//  ListItemView.swift
//  NatureWalk
//
//  Created by Simon Chan on 2024-06-12.
//

import SwiftUI

struct ListItemView: View {
    
    var session : Session
    @EnvironmentObject var dataSource : DataSource
    
    var body: some View {
        NavigationLink{
            SessionDetailView(selectedSession: session).environmentObject(self.dataSource)
        }label: {
            HStack(alignment: .center, spacing: 10){
                VStack(alignment: .leading, spacing: 10){
                    Text(session.name)
                        .font(.title3)
                        .bold()
                    Text("Price : $\(String(session.pricing)) / person")
                } //VStack_text
                Spacer()
                VStack{
                    Spacer()
                    ForEach(session.photo.prefix(2), id: \.self) { photoURL in
                        if let url = URL(string: photoURL) {
                            AsyncImage(url: url) { image in
                                image.image?.resizable()
                                .frame(width: 70, height: 70)}
                        }
                    }
                } //VStack_photo
            } //HStack
            .padding(.bottom)
            .onTapGesture {
                print(#function, "list item selected : \(session.name)")
            }
            
        }//label
    }
}


