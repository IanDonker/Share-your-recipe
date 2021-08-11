//
//  ReceptView.swift
//  Share your recipe
//
//  Created by Ian Donker on 27/06/2021.
//

import SwiftUI

struct ReceptView: View {
    @Binding var rating: Int
    @State private var recept = ["Bami", "Nasi", "Lasagne", "Pizza", "Pasta"]
    
    var label = ""
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        List {
            ForEach(recept, id: \.self) { recept in
                HStack {
                    
                    NavigationLink(
                        destination: PreperationView(receptNaam: recept),
                        label: {
                            Text(recept)
                        
                    Spacer()
                    
                    if label.isEmpty == false {
                        Text(label)
                    }
                    
                    ForEach(1..<maximumRating + 1) { number in
                        self.image(for: number)
                            .foregroundColor(number > self.rating ? self.offColor : self.onColor)
                            .onTapGesture {
                                self.rating = number
                            }
                            .accessibility(label: Text("\(number == 1 ? "1 star" : "\(number) stars")"))
                            .accessibility(removeTraits: .isImage)
                            .accessibility(addTraits: number > self.rating ? .isButton : [.isButton, .isSelected])
                        
                    }
                        })
                }
            }
        }
        
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        ReceptView(rating: .constant(4))
    }
}
