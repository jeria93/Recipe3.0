//
//  RecipeModel.swift
//  RecipesList
//
//  Created by Nicholas Gaete Jeria on 2023-05-01.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        self.recipes = Dataservice.getLocalData()
        
        
    }
    
    static func getPortion(ingredient: Ingredients, recipeServings: Int, targetServings: Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            //Get a single serving size by multiplying denominator by the recipe servings
            denominator = denominator * recipeServings
            
            //Get target portion by multiplying numerator by the target servings
            numerator = numerator * targetServings
            
            //Reduce fractoin by the greatest common divisior
            
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator = numerator / divisor
            denominator = denominator / divisor
            
            //Gete the whole portion if numerator > denominator
            
            if numerator >= denominator {
                
                //Calculated the whole portions
                wholePortions = numerator / denominator
                
                //Calculate the remainder
                numerator = numerator % denominator
                
                //Assign to portion String
                
                portion = portion + String(wholePortions)
            }
            
            //Express the remainder as a fraction
            if numerator > 0 {
                
                //Assign remainder as fraction to the portion String
                portion += wholePortions > 0 ? " ": ""
                portion += "\(numerator)/\(denominator)"
                
            }
            
            
            if var unit = ingredient.unit {
                
                
                //If we need to pluralize
                if wholePortions > 1 {
                    
                    
                    //Calculate appropiate suffix
                    
                    if unit.suffix(2) == "ch" {
                        
                        unit = unit + "es"
                        
                        
                    } else if unit.suffix(1) == "f" {
                        
                        unit = String(unit.dropLast())
                        unit = unit + "ves"
                        
                    } else {
                        
                        unit = unit + "s"
                        
                    }
                    
                    
                }

                
                portion += ingredient.num == nil && ingredient.denom == nil ? "": " "
                
                return portion + unit
                
                
            }
            
            
            
        }
        
        return portion
    }
    
}
