//
//  Ingredients+CoreDataProperties.swift
//  FoodManChu
//
//  Created by Ricardo Martinez on 2/2/21.
//
//

import Foundation
import CoreData


extension Ingredients {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredients> {
        return NSFetchRequest<Ingredients>(entityName: "Ingredients")
    }

    @NSManaged public var amount: String?
    @NSManaged public var name: String?
    @NSManaged public var recipe: NSSet?

}

// MARK: Generated accessors for recipe
extension Ingredients {

    @objc(addRecipeObject:)
    @NSManaged public func addToRecipe(_ value: Recipe)

    @objc(removeRecipeObject:)
    @NSManaged public func removeFromRecipe(_ value: Recipe)

    @objc(addRecipe:)
    @NSManaged public func addToRecipe(_ values: NSSet)

    @objc(removeRecipe:)
    @NSManaged public func removeFromRecipe(_ values: NSSet)

}

extension Ingredients : Identifiable {

}
