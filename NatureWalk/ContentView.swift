//
//  ContentView.swift
//  NatureWalk
//
//  Created by Jacob Lee on 2024-06-10.
//

import SwiftUI

struct ContentView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var isRememberMe: Bool = false
    
    @State private var showAlert: Bool = false
    
    @State private var message: String = ""
    
    @State private var linkSelection : Int? = nil
    
    private let predefinedUsers: [User] = [
        User(email: "test@gmail.com", password: "test123"),
        User(email: "admin@gmail.com", password: "admin123")
    ]
    
    var body: some View {
        NavigationStack{
            VStack {
                
                NavigationLink(
                    destination: SessionListView(),
                    tag: 1,
                    selection: self.$linkSelection){}
                
                Form{
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                    
                    SecureField("Password", text: $password)
                    
                    Toggle(isOn: $isRememberMe) {
                        Text("Remember Me")
                    }.onChange(of: isRememberMe) {
                        standardUserDefaults.set(isRememberMe, forKey: UserDefaultsKey.rememberMe.rawValue)
                    }
                    
                    Section {
                        Button(action: {
                            login()
                        }, label: {
                            Text("Login")
                        })
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Result"),
                                  message: Text(self.message),
                                  dismissButton: .default(Text("Dismiss"), action: {
                            }))
                        }
                    }
                }
            }
            .navigationTitle("Login")
            .onAppear() {
                if let data = standardUserDefaults.value(forKey: UserDefaultsKey.user.rawValue) as? Data,
                   let user = try? JSONDecoder().decode(User.self, from: data) {
                    email = user.email
                    password = user.password
                } else {
                    email = ""
                    password = ""
                }
                
                isRememberMe = standardUserDefaults.bool(forKey: UserDefaultsKey.rememberMe.rawValue)
            }
        }
        
    }
    
    private func login() {
        guard !email.isEmpty else {
            message = "Please input you email!"
            showAlert = true
            return
        }
        
        guard !password.isEmpty else {
            message = "Please input you assword!"
            showAlert = true
            return
        }
        
        guard let user = predefinedUsers.first(where: { $0.email == email }) else {
            message = "The email address is incorrect!"
            showAlert = true
            return
        }
        
        guard user.password == password else {
            message = "The password is incorrect!"
            showAlert = true
            return
        }
        linkSelection = 1
        let newUser = User(email: email, password: password)
        if isRememberMe {
            standardUserDefaults.set(try? JSONEncoder().encode(newUser), forKey: UserDefaultsKey.user.rawValue)
        }
        
    }
}

#Preview {
    ContentView()
}
