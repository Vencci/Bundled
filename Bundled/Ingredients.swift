import Foundation
class Ingredients {
    var title = ""
    var content = ""
    var completed: Bool = false
    static func sampleIngreArray() -> [Ingredients] {
        
        
        
        let ingredient1 = Ingredients()
        ingredient1.title = "Chicken"
        ingredient1.content = "*2"
        let ingredient2 = Ingredients()
        ingredient2.title = "Onion"
        ingredient2.content = "*3"
        let ingredient3 = Ingredients()
        ingredient3.title = "garlic"
        ingredient3.content = "*1"
        
        var ingredientsArray = [Ingredients]()
        ingredientsArray.append(ingredient1)
        ingredientsArray.append(ingredient2)
        ingredientsArray.append(ingredient3)
        
        return ingredientsArray
    }
}
