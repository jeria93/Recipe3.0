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
                
                for r in dataRecipe {
                    
                    r.id = UUID()
                    
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
