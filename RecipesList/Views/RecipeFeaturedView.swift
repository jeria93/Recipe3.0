//
//  RecipeFeaturedView.swift
//  RecipesList
//
//  Created by Nicholas Gaete Jeria on 2023-05-03.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        RecipeFeaturedView().environmentObject(RecipeModel())
    }
}
