//
//  RecipeViewModel.swift
//  Share your recipe
//
//  Created by Ian Donker on 11/08/2021.
//

import Foundation

class Recipe: ObservableObject {
    @Published var recipes = [RecipeStep]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try?
                encoder.encode(recipes) {
                UserDefaults.standard.set(encoded,
                   forKey: "Recipes")
            }
        }
    }
    
    init() {
        if let recipes =
            UserDefaults.standard.data(forKey: "Recipes") {
            let decoder = JSONDecoder()
            
            if let decoded = try?
                decoder.decode([RecipeStep].self,
                               from: recipes) {
                self.recipes = decoded
                return
            }
        }
        self.recipes = []
    }
}
