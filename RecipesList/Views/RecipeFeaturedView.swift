//
//  RecipeFeaturedView.swift
//  RecipesList
//
//  Created by Nicholas Gaete Jeria on 2023-05-03.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model: RecipeModel
    @State var isDetailViewShowing = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Featured Recipes")
                .padding(.leading)
                .font(.largeTitle)
                .bold()
                .padding(.top, 40)
            
            GeometryReader {
                
                geo in
                
                TabView {
                    
                    ForEach(0..<model.recipes.count, id: \.self) {
                        
                        index in
                        
                        if model.recipes[index].featured {
                            
                            //Recipe Card Button
                            
                            Button {
                                
                                self.isDetailViewShowing = true
                                
                                print("AA")
                            } label: {
                                
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    
                                    //spacing 0
                                    VStack(spacing: 0) {
                                        
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                        
                                        
                                        
                                    }
                                }
                            }.sheet(isPresented: $isDetailViewShowing, content: {
                                
                                RecipeDetailView(recipes: model.recipes[index])
                                
                            })
                            .buttonStyle(.plain)
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                                .cornerRadius(15)
                                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                            
                            
                            
                            //    .shadow(radius: 10)
                            
                            
                            
                        }
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
            }
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Preparation Time")
                    .font(.headline)
                Text("1 hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, Hearty")
                
                
            }.padding([.leading, .bottom])
        }
        
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        RecipeFeaturedView().environmentObject(RecipeModel())
    }
}


