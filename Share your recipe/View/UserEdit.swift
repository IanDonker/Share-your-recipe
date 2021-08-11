//
//  UserEdit.swift
//  Share your recipe
//
//  Created by Ian Donker on 10/08/2021.
//

import SwiftUI

struct UserEdit: View {
     var user = User()
    @Environment(\.presentationMode) var presentationMode
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    
    var body: some View {
        NavigationView {
            Form {
                Group {
                    TextField("Please enter your first name", text: $firstName)
                    TextField("Please enter your last name", text: $lastName)
                }
                
                Group {
                    TextField("Please enter your email", text: $email)
                }
            }
            
            
            .navigationBarTitle("User settings")
            .navigationBarItems(trailing:
                                    Button(action: {
                    _ = User(firstName: self.firstName, lastName: self.lastName, email: self.email)
                    self.presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Text("Save")
                                    }))
        }
    }
}

struct UserEdit_Previews: PreviewProvider {
    static var previews: some View {
        UserEdit()
    }
}
