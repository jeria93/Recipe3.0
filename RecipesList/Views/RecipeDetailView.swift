//
//  RecipeDetailView.swift
//  RecipesList
//
//  Created by Nicholas Gaete Jeria on 2023-05-02.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @State var selectedServingSize = 2
    var recipes: Recipe
    
    var body: some View {
        
        
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                Image(recipes.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                //MARK: Recipe Title
                Text(recipes.name)
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                
                //MARK: Serving Size Picker
                VStack(alignment: .leading) {
                    
                    Text("Select your serving size:")
                    Picker("Servings Picker", selection: $selectedServingSize) {
                        
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                        
                        
                    }.pickerStyle(.segmented)
                        .frame(width: 160)
                    
                    
                }.padding()
                
                VStack(alignment: .leading) {
                    
                    
                    //MARK: Ingredients
                    Text("Ingredients")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .padding(.bottom, 5)
                        .padding(.top, 5)
                    
                    
                    ForEach(recipes.ingredients) {
                        
                        item in
                        
                        Text("- " + RecipeModel.getPortion(ingredient: item, recipeServings: recipes.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                        
                        
                    }
                    
                    Divider()
                    
                    Text("Directions")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .padding(.top, 3)
                    
                    ForEach(0..<recipes.directions.count, id: \.self) {
                        
                        index in
                        
                        Text(String(index+1) + " . " + recipes.directions[index])
                            .padding([.leading, .bottom, .trailing], 2)
                        
                        
                    }
                    
                    
                    
                }.padding()
            }
        }
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let sample = RecipeModel()
        
        RecipeDetailView(recipes: sample.recipes[0])
    }
}
