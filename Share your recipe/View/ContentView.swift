//
//  ContentView.swift
//  Share your recipe
//
//  Created by Ian Donker on 25/05/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var recipe = Recipe()
    
    var body: some View {
        NavigationView {
            TabView {
                MyRecipes()
                    .tabItem {
                        Label("Your recipes", systemImage: "person.fill")
                    }
                
               AddARecipe()
                .tabItem {
                    Label("Add", systemImage: "plus")
                }
                
                UserInformation()
                    .tabItem {
                        Label("Info", systemImage: "info.circle")
                    }
        
                
                
            }
            .navigationBarTitle("Home page", displayMode: .inline)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(recipe: Recipe())
    }
}

struct ButtonView: View {
    var imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .frame(width: 75, height: 75)
            .foregroundColor(.black)
    }
}
