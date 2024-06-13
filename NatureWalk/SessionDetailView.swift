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
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 10){
                    ForEach(selectedSession.photo, id: \.self) { url in
                        AsyncImage(url: URL(string: url)) { image in
                            image.image?.resizable()
                            .frame(maxWidth: .infinity, maxHeight: 240)}
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
                            //Add to favorites
                        }label: {
                            Text("Add to Favorites")
                        }
                        .buttonStyle(.borderedProminent)
                        Button{
                            //Add share
                        }label: {
                            Text("Share")
                        }
                        .buttonStyle(.borderedProminent)
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

#Preview {
    SessionDetailView(selectedSession: Session(name: "NA", description: "NA", starRating: 5, organizationName: "NA", photo: ["https://media.cntraveler.com/photos/5b2c06854c18411aa3e9f5d3/16:9/w_2560,c_limit/High-Park_GettyImages-171589236.jpg", "https://img1.10bestmedia.com/Images/Photos/373770/17103378200-4be268189d-h_55_660x440.jpg"], pricing: 1.0, phone: "11111111111"))
}
