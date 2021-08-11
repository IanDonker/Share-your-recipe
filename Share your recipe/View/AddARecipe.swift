//
//  AddARecipe.swift
//  Share your recipe
//
//  Created by Ian Donker on 25/05/2021.
//

import SwiftUI


struct AddARecipe: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var recipes = Recipe()
    @State private var recipeName = ""
    @State private var ingredient = ""
    @State private var ingredientCount = 0
    @State private var people = 0
    @State private var amount = 0
    @State private var steps = 3
    @State private var recipe = ""
    @State private var preperationTime = ""
    @State private var ovenDish: Bool = false
    @State private var bakingTime = ""
    @State private var bakingTemp = ""
    @State private var microwaveDish: Bool = false
    @State private var microwaveTime = ""
    @State private var microwaveWatt = ""
    
   
    var validInput: Bool {
        if recipeName.isEmpty || recipe.isEmpty {
            return false
        } else {
            return true
        }
    }
   
    
    var body: some View {
        NavigationView {
        Form {
            Section {
            TextField("Please enter your recipe's name", text: $recipeName)
           
            Stepper(value: $people, in: 1...10, step: 1) {
                if people == 1 {
                Text("Recipe is for \(people) person")
                .font(.headline)
                } else {
                Text("Recipe is for \(people) people")
                .font(.headline)
            }
            }
                
            TextField("Preperation time in minutes", text: $preperationTime)
                    .keyboardType(.numberPad)
            Toggle(isOn: $ovenDish) {
                    Text("Needs to reheat in the oven")
                        .font(.headline)
                     
                }
                if ovenDish == true {
                    TextField("Baking time", text: $bakingTime)
                        .keyboardType(.numberPad)
                    TextField("Baking temperature", text: $bakingTemp)
                        .keyboardType(.numberPad)
                }
                
            
                Toggle(isOn: $microwaveDish) {
                    Text("Needs to reheat in the microwave")
                        .font(.headline)
                }
            if microwaveDish == true {
                    TextField("Seconds", text: $microwaveTime)
                        .keyboardType(.numberPad)
                    TextField("Watt", text: $microwaveWatt)
                        .keyboardType(.numberPad)
            }
            }
           
            Section(header: Text("Ingredients")) {
                Stepper(value: $ingredientCount, in: 1...20, step: 1) {
                    Text("\(ingredientCount)")
                }
            HStack {
                TextField("Ingredient", text: $ingredient); Stepper(value: $amount, in: 1...20, step: 1) {
                Text("\(amount)")
                    .font(.headline)
                    .labelsHidden()
            }
                // Het moet automatisch een nieuwe TextField en Stepper toevoegen voor nieuwe ingrediënten. Misschien koppen aan het aantal ingredientCount
            }
            }
            
            
            Section(header: Text("Please write down your recipe")) {
                Stepper(value: $steps, in: 3...6, step: 1) {
                    Text("\(steps) steps for preperation")
                }
                TextEditor(text: $recipe)
            }
            
        }
           
        .navigationBarTitle("Add a new recipe")
        .navigationBarItems(trailing:
          Button("Save") {
//            if let actualPrep = Int(self.preperationTime)
//            {
//                let item = RecipeStep(recipeName: self.recipeName, ingredient: self.ingredient, ingredienCount: self.ingredientCount, people: self.people, amount: self.amount, recipe: self.recipe, preperationTime: self.preperationTime, ovenDish: self.ovenDish, bakingTime: self.bakingTime, bankingTemp: self.bakingTemp, microwaveDish: self.microwaveDish, microwaveTime: self.microwaveTime, microwabeWatt: self.microwaveWatt)
//                    self.recipes.items.append(item)
//
//                self.presentationMode.wrappedValue.dismiss()
//            }
                                })
            // code

        }
        .disabled(validInput == false)
    }
    
    func writeYourRecipe(step: Int) -> String {
        var recipe = ""

        if step == 3 {
             recipe =
                """
        Step 1:
        Step 2:
        Step 3
        """
        } else if steps == 4 {
            recipe =
            """
    Step 1:
    Step 2:
    Step 3:
    Step 4:
    """
        } else if steps == 5 {
            recipe =
            """
    Step 1:
    Step 2:
    Step 3:
    Step 4:
    Step 5:
    """
        } else if steps == 6 {
            recipe =
            """
    Step 1:
    Step 2:
    Step 3:
    Step 4:
    Step 5:
    Step 6:
    """
        }

        return recipe
    }
}

struct AddARecipe_Previews: PreviewProvider {
    static var previews: some View {
        AddARecipe(recipes: Recipe())
    }
}
