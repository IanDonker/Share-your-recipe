//
//  MyRecipes.swift
//  Share your recipe
//
//  Created by Ian Donker on 10/08/2021.
//

import SwiftUI

struct MyRecipes: View {
    @ObservedObject var recipe = Recipe()
    @State private var showingAddRecipe = false
    @State private var rating = 3
    
    var body: some View {
        
        ReceptView(rating: $rating)
            
            .navigationBarTitle("Your recipes")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.showingAddRecipe = true
                                    }) {
                                        Image(systemName: "plus")
                                    })
            .sheet(isPresented: $showingAddRecipe)
            {
                AddARecipe(recipes: self.recipe)
            }
        
        
    }
}

struct MyRecipes_Previews: PreviewProvider {
    static var previews: some View {
        MyRecipes()
    }
}
