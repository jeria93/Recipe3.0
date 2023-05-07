//
//  LocalData.swift
//  RecipesList
//
//  Created by Nicholas Gaete Jeria on 2023-05-01.
//

import Foundation

class Dataservice {
    
    static func getLocalData() -> [Recipe] {
        
        let path = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard path != nil else {
            
            return [Recipe]()
            
        }
        
        let url = URL(filePath: path!)
        
        do {
            
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            
            do {
                
                let dataRecipe = try decoder.decode([Recipe].self, from: data)
                
                //Looping thru ID:S both in the same scope
                for r in dataRecipe {
                    
                    //Adding unique ID for recipes
                    r.id = UUID()
                    
                    //Adding unique ID for ingridients:
                    for i in r.ingredients {
                        
                        i.id = UUID()
                        
                    }
                    
                }
                
          
                

                
                return dataRecipe
                
            } catch {
                
                print(error)
                
            }
            
            
        } catch {
            
            print(error)
            
        }
        
        
        
        
        return [Recipe]()
    }
    
    
}
