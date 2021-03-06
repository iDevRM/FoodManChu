//
//  Constants.swift
//  FoodManChu
//
//  Created by Ricardo Martinez on 1/11/21.
//

import Foundation
import UIKit

struct Constants {
    static let context     = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    static let cellReuseId = "RecipeCell"
    static let detailSegue = "DetailSegue"
    static let addSegue    = "AddSegue"
    
    static let categories: [String?] = ["Meat","Vegetarian","Vegan","Paleo","Keto"]
    
    
}


