//
//  RecipeDetailView.swift
//  RecipesList
//
//  Created by Nicholas Gaete Jeria on 2023-05-02.
//

import SwiftUI

struct RecipeDetailView: View {
    
    let recipes: Recipe
    
    var body: some View {
        

            
        ScrollView {
            
            Image(recipes.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack(alignment: .leading) {
                

                
                Text("Ingredients")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                    .padding(.top, 5)
                    
                
                ForEach(recipes.ingredients) {
                    
                    item in
                    
                    Text("- \(item.name)")
                        
                                            
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
                
              
                
            }
            .padding(.horizontal)
        }.navigationBarTitle(recipes.name)
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let sample = RecipeModel()
        
        RecipeDetailView(recipes: sample.recipes[0])
    }
}
