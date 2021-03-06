//
//  RecipeCollectiosn.swift
//  TabbarPages
//
//  Created by Wenqi Wang on 06/04/2017.
//  Copyright © 2017 SixSix. All rights reserved.
//

import UIKit


let asianBundleCover = ["asianbundle1", "asianbundle2", "asianbundle3", "asianbundle4", "asianbundle5", "asianbundle6", "asianbundle7", "asianbundle8"]

let euroBuncleCover = ["eurobundle1", "eurobundle2", "eurobundle3", "eurobundle4", "eurobundle5"]

let amerBuncleCover = ["americanbundle1", "americanbundle2", "americanbundle3", "americanbundle4", "americanbundle5", "americanbundle6"]

let eggPath: String? = Bundle.main.path(forResource: "beategg", ofType: "mp4")
let eggURL = URL(fileURLWithPath: eggPath!)
var beatEggs = Preparation(url: eggURL, prepTime: 10, desc: "BEAT eggs, milk and nutmeg in shallow dish until blended.", imageName: "beategg")

let beefPath: String? = Bundle.main.path(forResource: "beef", ofType: "mp4")
let beefURL = URL(fileURLWithPath: beefPath!)
var sliceBeef = Preparation(url: beefURL, prepTime: 5, desc: "slice beef into thin strips.", imageName: "beef")

let carrotPath: String? = Bundle.main.path(forResource: "carrot", ofType: "mp4")
let carrotURL = URL(fileURLWithPath: carrotPath!)
var peelCarrot = Preparation(url: carrotURL, prepTime: 2, desc: "peel carrots nicely, and cut them into prices", imageName: "carrot")

let cutonionPath: String? = Bundle.main.path(forResource: "cutonion", ofType: "mp4")
let cutonionURL = URL(fileURLWithPath: cutonionPath!)
var chopOnion = Preparation(url: cutonionURL, prepTime: 2, desc: "chop onion nicely", imageName: "cutonion")

let cutpotatoPath: String? = Bundle.main.path(forResource: "cutpotato", ofType: "mp4")
let cutpotatoURL = URL(fileURLWithPath: cutpotatoPath!)
var cutPotato = Preparation(url: cutpotatoURL, prepTime: 3, desc: "peel the potatos, and cut them into pieces", imageName: "cutpotato")

let pinnapplePath: String? = Bundle.main.path(forResource: "pinnapple", ofType: "mp4")
let pinnappleURL = URL(fileURLWithPath: pinnapplePath!)
var peelPinapple = Preparation(url: pinnappleURL, prepTime: 5, desc: "peel and cut the pineapple", imageName: "pinnapple")

let beanPath: String? = Bundle.main.path(forResource: "beans", ofType: "mp4")
let beanURL = URL(fileURLWithPath: beanPath!)
var chopBeans = Preparation(url: beanURL, prepTime: 2, desc: "wash and cut the green beans", imageName: "beans")

let peelsalmonPath: String? = Bundle.main.path(forResource: "peelsalmon", ofType: "mp4")
let peelsalmonURL = URL(fileURLWithPath: peelsalmonPath!)
var peelsalmon = Preparation(url: peelsalmonURL, prepTime: 5, desc: "take the skin off a salmon", imageName: "peelsalmon")

let cutbroccoliPath: String? = Bundle.main.path(forResource: "cutbroccoli", ofType: "mp4")
let cutbroccoliURL = URL(fileURLWithPath: cutbroccoliPath!)
var trimBroccoli = Preparation(url: cutbroccoliURL, prepTime: 3, desc: "trim broccoli rabe", imageName: "cutbroccoli")

let cutchickenPath: String? = Bundle.main.path(forResource: "cutchicken", ofType: "mp4")
let cutchickenURL = URL(fileURLWithPath: cutchickenPath!)
var cutchicken = Preparation(url: cutchickenURL, prepTime: 5, desc: "slice chicken into chunks", imageName: "cutchicken")

let trimribPath: String? = Bundle.main.path(forResource: "cutchicken", ofType: "mp4")
let trimribURL = URL(fileURLWithPath: trimribPath!)
var trimrib = Preparation(url: trimribURL, prepTime: 10, desc: "trim the rib", imageName: "trimrib")


var recipeArray = [Recipe]()



//class RecipeCollection: NSObject{

let frenchToastRecipe = Recipe(id: 1, name: "FRENCH TOAST", category: "french", preparationArray: [beatEggs], imageName: "frenchtoastImage", price: 4, cookTime: 5, tag: ["vegetarian",  "breakfast", "toast", "french"], ingredients: ["EGGS" : (8, "pieces"), "MILK" : (Float(0.75), "cup"), "day-old bread" : (8, "slices")], steps: [("heatF", "HEAT lightly greased large nonstick skillet over high heat until hot."), ("placeF", "PLACE as many bread slices in hot pan as will fit in single layer. Immediately reduce heat to medium." ), ("cookF", "COOK until golden brown and no visible liquid egg remains, 2 to 3 minutes per side. REPEAT to cook remaining bread. SERVE immediately.")], details: "French toast, also known as eggy bread, Bombay toast, German toast, gypsy toast, poor knights, or Spanish toast, is a dish made of bread soaked in milk, then in beaten eggs and then fried.")

let scrambledEggsRecipe = Recipe(id: 2, name: "SCRAMBLED EGGS", category: "traditional", preparationArray: [beatEggs], imageName: "scrambledImage", price: 3, cookTime: 3, tag: ["breakfast", "traditional", "eggs", "american"], ingredients: ["EGGS" : (4, "pieces"), "MILK" : (Float(0.25), "cup"), "butter" : (2, "tsp")], steps: [("heatS", "HEAT butter in large nonstick skillet over medium heat until hot."), ("pourS", "POUR IN egg mixture. As eggs begin to set, GENTLY PULL the eggs across the pan with a spatula, forming large soft curds." ), ("cookS", "CONTINUE cooking – pulling, lifting and folding eggs – until thickened and no visible liquid egg remains. Do not stir constantly. REMOVE from heat.")], details: "Scrambled eggs is a dish made from whites and yolks of eggs stirred or beaten together in a pan while being gently heated, typically with salt and butter and variable other ingredients.")

let flatPizzaRecipe = Recipe(id: 3, name: "FLATBREAD PIZZA", category: "italian", preparationArray: [beatEggs], imageName: "flatpizzaImage", price: 4, cookTime: 3, tag: ["breakfast", "pizza", "Italian"], ingredients: ["EGGS" : (1, "pieces"), "MILK" : (1, "tbsp"), "breakfast sausage crumbles" : (2, "tbsp"), "round flatbread (6-inch)": (1, "piece"), "finely shredded Cheddar cheese": (2, "tbsp")], steps: [("coatM", "COAT in 2-cup microwave-safe cereal bowl with cooking spray. ADD egg and milk; BEAT until blended. ADD sausage."), ("cookM", "MICROWAVE on HIGH 30 seconds; push cooked edges toward center. MICROWAVE until egg is almost set, about 15 to 45 seconds longer." )], details: "pizza made with mozzarella, tomatoes, basil & garlic is called Margherita, although a combination of tomato, mozzarella & basil is called caprese.")

let asianBeefRecipe = Recipe(id: 4, name: "ASIAN BEEF", category: "asian", preparationArray: [sliceBeef, chopOnion], imageName: "asianbeefImage", price: 8, cookTime: 15, tag: ["lowfat", "beef", "asian", "dinner", "lunch"], ingredients: ["SOY SAUCE" : (2, "tbsp"), "BROWN SUGAR" : (1, "tbsp"), "minced fresh ginger root" : (1, "tbsp"), "snow peas": (8, "ounces"), "finely shredded Cheddar cheese": (2, "tbsp")], steps: [("coatM", "COAT in 2-cup microwave-safe cereal bowl with cooking spray. ADD egg and milk; BEAT until blended. ADD sausage."),("cookM", "MICROWAVE on HIGH 30 seconds; push cooked edges toward center. MICROWAVE until egg is almost set, about 15 to 45 seconds longer." )], details: "Stir-fried beef in a light gingery sauce. Serve over steamed rice or hot egg noodles.")

let balsamicGlazedCarrots = Recipe(id: 5, name: "Balsamic Glazed Carrots", category: "vegetarian", preparationArray: [peelCarrot], imageName: "glazecarrot", price: 8, cookTime: 45, tag: ["lowfat", "beef", "asian", "dinner", "lunch", "vegetarian"], ingredients: ["SOY SAUCE" : (2, "tbsp"), "BROWN SUGAR" : (1, "tbsp"), "minced fresh ginger root" : (1, "tbsp"), "snow peas": (8, "ounces"), "finely shredded Cheddar cheese": (2, "tbsp")], steps: [("coatM", "Preheat oven to 350°. On a large baking sheet, drizzle carrots with oil, then season with salt and pepper. Toss until combined and bake until carrots are tender, 38 to 40 minutes."),("stirsauceImage", "MICROWAVMeanwhile, make balsamic glaze: In a small saucepan, combine balsamic vinegar and honey. Simmer until reduced by half, stirring occasionally, 15 minutes (the mixture should coat the back of a spoon). Let cool slightly."), ("poursauceImage", "Drizzle carrots with balsamic glaze and garnish with parsley. Serve warm.")], details: "Drain and transfer to a bowl. Melt butter in the same saucepan; stir brown sugar, salt, and white pepper into butter until brown sugar and salt have dissolved. Transfer carrots into brown sugar sauce; cook and stir until carrots are glazed with sauce, about 5 more minutes.")

let greenBeanandPotatoSalad = Recipe(id: 6, name: "Green Bean and Potato Salad", category: "vegetarian", preparationArray: [cutPotato, chopOnion], imageName: "greenBeanandPotatoImage", price: 5, cookTime: 20, tag: ["lowfat", "vegetarian", "lunch"], ingredients: ["red potatoes" : (2, "pounds"), "fresh green beans" : (1, "pound"), " chopped fresh basil" : (1, "cup"), "small red onion": (1, "piece"), " clove garlic": (1, "piece")], steps: [("coatM", "Preheat oven to 350°. On a large baking sheet, drizzle carrots with oil, then season with salt and pepper. Toss until combined and bake until carrots are tender, 38 to 40 minutes."),("boilpotatoImage", "Place the potatoes in a large pot, and fill with about 1 inch of water. Bring to a boil, and cook for about 15 minutes, or until potatoes are tender. Throw in the green beans to steam after the first 10 minutes. Drain, cool, and cut potatoes into quarters. Transfer to a large bowl, and toss with fresh basil, red onion, salt and pepper. Set aside."), ("saladDressing", "In a medium bowl, whisk together the balsamic vinegar, mustard, lemon juice, garlic, Worcestershire sauce and olive oil. Pour over the salad, and stir to coat. Taste and season with additional salt and pepper if needed.")], details: "This is awesome! This salad will stay for several days, and improves in flavor. It may be served chilled or room temperature. Preparation time includes cooking the potatoes and beans.")

let mangoSalsaonTilapiaFillets = Recipe(id: 7, name: "Mango Salsa on Tilapia Fillets",category: "lowfat", preparationArray: [peelPinapple], imageName: "mangofillet", price: 12, cookTime: 25, tag: ["lowfat", "seafood", "dinner"], ingredients: ["fresh pineapple" : (1, "pounds"), "strawberries" : (1, "pound"), " large mango" : (1, "cup"), "tilapia fillets": (2, "pounds"), " clove garlic": (1, "piece")], steps: [("tossfruitImage", "In a bowl, toss together the pineapple, strawberries, kiwifruit, mango, tomatoes, cilantro, and balsamic vinegar."),("panfryingtilapiaImage", "Spray a skillet with cooking spray, and heat over medium-high heat. Sprinkle tilapia fillets with seasoned pepper blend, and pan-fry until fish turns white and opaque, 2 to 3 minutes per side. Serve fish topped with salsa.")], details: "Delicious dish with great balance of protain and fruits")

let sesameGreenBeans = Recipe(id: 8, name: "Sesame Green Beans",category: "lowfat", preparationArray: [chopBeans], imageName: "greenbean", price: 6, cookTime: 15, tag: ["lowfat", "vegetarian", "lunch", "dinner"], ingredients: ["sesame seeds" : (1, "tbsp"), "chicken broth" : (1, "cup")], steps: [("heatF", "Heat oil in a large skillet or wok over medium heat. Add sesame seeds. When seeds start to darken, stir in green beans. Cook, stirring, until the beans turn bright green."),("stirfrybeans", "Pour in chicken broth, salt and pepper. Cover and cook until beans are tender-crisp, about 10 minutes. Uncover and cook until liquid evaporates.")], details: "For such a simple dish, you will be surprised at how much flavor this has! Broccoli is equally delicious prepared this way.")

let cedarPlankedSalmon = Recipe(id: 9, name: "Cedar Planked Salmon",category: "lowfatseafood", preparationArray: [peelsalmon], imageName: "salmonImage", price: 15, cookTime: 20, tag: ["lowfat", "seafood", "lunch", "dinner"], ingredients: ["green onions" : (1, "pieces"), "salmon fillets, skin removed" : (2, "pounds")], steps: [("soakPlank", "Soak the cedar planks for at least 1 hour in warm water. Soak longer if you have time."), ("soaksalmonimage", "In a shallow dish, stir together the vegetable oil, rice vinegar, sesame oil, soy sauce, green onions, ginger, and garlic. Place the salmon fillets in the marinade and turn to coat. Cover and marinate for at least 15 minutes, or up to one hour."), ("grillsalmonImage", "Place the salmon fillets onto the planks and discard the marinade. Cover, and grill for about 20 minutes. Fish is done when you can flake it with a fork. It will continue to cook after you remove it from the grill.")], details: "Where this recipe calls for lemon zest and rosemary, the native Coast Salish Indians on Vancouver Island would use grand-fir needles. Either way, the salmon takes on a light, smoky woodiness from grilling on a cedar plank, for a lovely pairing of earth and ocean.")

let broccoli = Recipe(id: 9, name: "Broccoli Rabe with Roasted Peppers",category: "vagetarian", preparationArray: [trimBroccoli], imageName: "brocolli", price: 5, cookTime: 10, tag: ["lowfat", "vegetarian", "lunch", "dinner"], ingredients: ["cloves garlic" : (5, "pieces"), "bunch broccoli rabe" : (1, "piece")], steps: [("boilbroc", "Bring a large pot of lightly salted water to a boil. Add the broccoli rabe, and cook uncovered until the stems are tender, about 5 minutes. Drain in a colander."), ("heatF", "Heat the olive oil in a large skillet over medium heat. Stir in the garlic, and cook until tender, about 1 minute."), ("stirbroImage", "Add the broccoli rabe. Cook and stir until the broccoli rabe has been cooked to your desired degree of tenderness, about 5 minutes for soft. Stir in the roasted peppers until heated, then remove the skillet from the heat, and stir in the lemon juice. Sprinkle with Parmesan cheese to serve.")], details: "Orecchiette with broccoli rabe, also known as rapini, is a classic dish from Apulia, the region of Italy that makes up the heel of the country’s boot shape. To make the dish more colorful, I added red bell pepper to the traditional mix. The sweetness of the peppers makes a nice contrast to the bitter greens.")

let kungpao = Recipe(id: 10, name: "Kung Pao Chicken", category: "asian", preparationArray: [cutchicken], imageName: "kungpao", price: 10, cookTime: 15, tag: ["lowfat", "lunch", "dinner"], ingredients: ["peanuts" : (4, "ounce"), "chickenbreast": (1, "pounds"), "green onions": (4, "piece")], steps: [("marinade", "Combine 1 tablespoon wine, 1 tablespoon soy sauce, 1 tablespoon oil and 1 tablespoon cornstarch/water mixture and mix together. Place chicken pieces in a glass dish or bowl and add marinade. Toss to coat. Cover dish and place in refrigerator for about 30 minutes."), ("sauce", " In a small bowl combine 1 tablespoon wine, 1 tablespoon soy sauce, 1 tablespoon oil, 1 tablespoon cornstarch/water mixture, chili paste, vinegar and sugar. Mix together and add green onion, garlic, water chestnuts and peanuts. In a medium skillet, heat sauce slowly until aromatic."), ("mix", "Meanwhile, remove chicken from marinade and saute in a large skillet until meat is white and juices run clear. When sauce is aromatic, add sauteed chicken to it and let simmer together until sauce thickens.")], details: "Spicy chicken with peanuts, similar to what is served in Chinese restaurants. It is easy to make, and you can be as sloppy with the measurements as you want. They reduce to a nice, thick sauce. Substitute cashews for peanuts, or bamboo shoots for the water chestnuts. You can't go wrong! Enjoy!")

let spareribs = Recipe(id: 11, name: "Chinese Spareribs", category: "asian", preparationArray: [trimrib], imageName: "rib", price: 15, cookTime: 75, tag: ["lunch", "dinner"], ingredients: ["pork spareribs": (1, "pounds"), "honey": (1, "bottle"), "sake": (1, "bottle")], steps: [("preprib", "In a shallow glass dish, mix together the hoisin sauce, ketchup, honey, soy sauce, sake, rice vinegar, lemon juice, ginger, garlic and five-spice powder. Place the ribs in the dish, and turn to coat. Cover and marinate in the refrigerator for 2 hours, or as long as overnight."), ("heatoven", "Preheat the oven to 325 degrees F (165 degrees C). Fill a broiler tray with enough water to cover the bottom. Place the grate or rack over the tray. Arrange the ribs on the grate."), ("inoven", "Place the broiler rack in the center of the oven. Cook for 40 minutes, turning and brushing with the marinade every 10 minutes. Let the marinade cook on for the final 10 minutes to make a glaze. Finish under the broiler if desired. Discard any remaining marinade.")], details: " This recipe is pretty simple, and yields tender, juicy, tangy ribs. In Japan, I cooked this in the fish broiler, but it should be fine on the grill or in the oven." )

let buns = Recipe(id: 12, name: "Chinese Steamed Buns", category: "asian", preparationArray: [])
