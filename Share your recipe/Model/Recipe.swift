//
//  Recipe.swift
//  Share your recipe
//
//  Created by Ian Donker on 25/05/2021.
//

import Foundation

struct RecipeStep: Identifiable, Codable {
    var id = UUID()
    let recipeName: String
    let ingredient: String
    let ingredienCount: Int
    let people: Int
    let amount: Int
    let recipe: String
    let preperationTime: String
    let ovenDish: Bool
    let bakingTime: String
    let bankingTemp: String
    let microwaveDish: Bool
    let microwaveTime: String
    let microwabeWatt: String
}


