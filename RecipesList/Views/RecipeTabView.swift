//
//  RecipeTabView.swift
//  RecipesList
//
//  Created by Nicholas Gaete Jeria on 2023-05-02.
//

import SwiftUI

struct RecipeTabView: View {
    
    var body: some View {
        
        TabView {
            
            Text("Featured View")
                .tabItem {
                    VStack {
                        Image(systemName: "star")
                        Text("Favorites")
                    }
                }
            
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Recipes")
                    }
                }
            
            
            
        }
        
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
