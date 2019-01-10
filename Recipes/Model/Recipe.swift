//
//  Recipe.swift
//  Recipes
//
//  Created by Eckhart, Madeline on 1/8/19.
//  Copyright © 2019 Eckhart, Madeline. All rights reserved.
//

import Foundation

typealias Recipe = [RecipeList]

struct RecipeList: Decodable {
    let id: ID
    let createdOn, lastUpdatedOn: AtedOn
    let slug: String?
    let source: Source?
    let data: DataClass
    let image: String?
    let mode: Mode
    let type: [TypeElement]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case createdOn, lastUpdatedOn, slug, source, data, image, mode, type
    }
}

struct AtedOn: Decodable {
    let date: String
    
    enum CodingKeys: String, CodingKey {
        case date = "$date"
    }
}

struct DataClass: Decodable {
    let prepTimeInMinutes: Int?
    let headline: String
    let ingredients: [Ingredient]
    let description: String
    let cookTimeInMinutes: Int?
    let categories: Categories
    let cookingDirections: [CookingDirection]
    let chef: Chef?
    let provider, servingSize: String?
}

struct Categories: Codable {
    let dishType: [DishType]?
    let mainIngredient: [MainIngredient]?
    let ingredientCategory: [String]?
    let season: [MyLifeSegment]?
    let mealCourse, foodCategory: [String]?
    let myLifeSegment: [MyLifeSegment]?
    
    enum CodingKeys: String, CodingKey {
        case dishType = "Dish Type"
        case mainIngredient = "Main Ingredient"
        case ingredientCategory = "IngredientCategory"
        case season = "Season"
        case mealCourse = "MealCourse"
        case foodCategory = "FoodCategory"
        case myLifeSegment = "MyLifeSegment"
    }
}

enum DishType: String, Codable {
    case appetizer = "Appetizer"
    case breakfastBrunch = "Breakfast & Brunch"
    case dessert = "Dessert"
    case dinner = "Dinner"
    case lunch = "Lunch"
    case sideDishes = "Side Dishes"
}

enum MainIngredient: String, Codable {
    case beef = "Beef"
    case fruit = "Fruit"
    case pasta = "Pasta"
    case pork = "Pork"
    case poultry = "Poultry"
    case seafood = "Seafood"
    case vegetable = "Vegetable"
}

enum MyLifeSegment: String, Codable {
    case all = "All"
}

enum Chef: String, Codable {
    case chefname = "${chefname}"
    case empty = ""
    case leighANNHieronymus = "Leigh Ann Hieronymus"
}

struct CookingDirection: Codable {
    let step: String?
}

struct Ingredient: Codable {
    let unit: Unit?
    let item: String
    let quantity: Quantity
    let notes: String?
}

struct Quantity: Codable {
    let number: String
    let fraction: Fraction?
}

struct Fraction: Codable {
    let display: Display?
    let denominator, numerator: Int?
}

enum Display: String, Codable {
    case the12 = "1/2"
    case the13 = "1/3"
    case the14 = "1/4"
    case the18 = "1/8"
    case the23 = "2/3"
    case the34 = "3/4"
}

enum Unit: String, Codable {
    case bag = "bag"
    case bottle = "bottle"
    case box = "box"
    case bunch = "bunch"
    case can = "can"
    case clove = "clove"
    case container = "container"
    case cube = "cube"
    case cup = "cup"
    case dash = "dash"
    case dozen = "dozen"
    case drop = "drop"
    case each = "each"
    case ear = "ear"
    case empty = ""
    case head = "head"
    case jar = "jar"
    case large = "large"
    case loaf = "loaf"
    case medium = "medium"
    case ounce = "ounce"
    case package = "package"
    case piece = "piece"
    case pinch = "pinch"
    case pint = "pint"
    case pound = "pound"
    case quart = "quart"
    case rack = "rack"
    case sheet = "sheet"
    case slice = "slice"
    case small = "small"
    case smallBunch = "small bunch"
    case sprig = "sprig"
    case stalk = "stalk"
    case stick = "stick"
    case strip = "strip"
    case tablespoon = "tablespoon"
    case teaspoon = "teaspoon"
    case the6Inch = "6-inch"
}

struct ID: Codable {
    let oid: String
    
    enum CodingKeys: String, CodingKey {
        case oid = "$oid"
    }
}

enum Mode: String, Codable {
    case draft = "Draft"
    case published = "Published"
}

enum Source: String, Codable {
    case fmRecipes = "fmRecipes"
}

enum TypeElement: String, Codable {
    case recipe = "recipe"
}

