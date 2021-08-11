//
//  UserInformation.swift
//  Share your recipe
//
//  Created by Ian Donker on 10/08/2021.
//

import SwiftUI

struct UserInformation: View //, User
{
//   @ObservedObject var user = User()
    @Environment(\.presentationMode) var presentationMode
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var showingUserEdit = false
    
    var body: some View {
        NavigationView {
            VStack {
            Form {
                Group {
                    TextField("Please enter your first name", text: $firstName)
                    TextField("Please enter your last name", text: $lastName)
                }
                
                Group {
                    TextField("Please enter your email", text: $email)
                }
            }
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Close")
                })
            }
            
            .navigationBarTitle("User information")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        showingUserEdit = true
                                    }, label: {
                                        Text("Edit")
                                    }))
        }
        .sheet(isPresented: $showingUserEdit) {
            UserEdit()
        }
    }
}

struct UserInformation_Previews: PreviewProvider {
    static var previews: some View {
        UserInformation()
    }
}
