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
    
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SessionDetailView(selectedSession: Session(name: "NA", description: "NA", starRating: 1, organizationName: "NA", photo: ["NA", "NA"], pricing: 1.0, phone: "NA"))
}
