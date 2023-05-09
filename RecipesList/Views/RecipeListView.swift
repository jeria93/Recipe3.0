//
//  ContentView.swift
//  RecipesList
//
//  Created by Nicholas Gaete Jeria on 2023-05-01.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading){
                
                Text("All recipes")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 40)
                
                ScrollView {
                    
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes) { recipe in
                            
                            NavigationLink {
                                RecipeDetailView(recipes: recipe)
                            } label: {
                                HStack(spacing: 50) {
                                    
                                    Image(recipe.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 50, height: 50, alignment: .leading)
                                        .clipped()
                                    
                                    Text(recipe.name)
                                        .foregroundColor(.black)
                                    
                                    
                                }
                            }
                            
                            
                            
                            
                            
                        }
                    }
                }
            }
            .padding(.leading)
            
            
        }.navigationBarHidden(true)
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView().environmentObject(RecipeModel())
    }
}

