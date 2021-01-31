//
//  IngredientVC.swift
//  FoodManChu
//
//  Created by Ricardo Martinez on 1/31/21.
//

import UIKit
import CoreData

class IngredientVC: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var preloadedIngredients = [Ingredients]()


    override func viewDidLoad() {
        super.viewDidLoad()
        addButton.layer.cornerRadius = 8
        deleteButton.layer.cornerRadius = 8
        navigationController?.delegate = self
        loadIngredients()
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        if textField.hasText && !preloadedIngredients.contains(where: { $0.name == "\(textField.text!)" }) {
            let newIngredient = Ingredients(context: Constants.context)
            newIngredient.name = textField.text!
            
            do {
                try Constants.context.save()
            } catch {
                print(error.localizedDescription)
            }
            textField.text = ""
        }
    }
//   delete AAron AAAron AAAAron 
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        if textField.hasText && preloadedIngredients.contains(where: { $0.name == "\(textField.text!)" }) {
            if let ingredient = preloadedIngredients.first(where: { $0.name == "\(textField.text!)" }) {
                Constants.context.delete(ingredient)
                
                do {
                    try Constants.context.save()
                } catch {
                    print(error.localizedDescription)
                }
                textField.text = ""
            }
        }
    }
    
    
    
    func loadIngredients() {
        let request: NSFetchRequest<Ingredients> = Ingredients.fetchRequest()
        do {
            preloadedIngredients = try Constants.context.fetch(request)
        } catch {
            print("Error fetching data from context: \(error)")
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if let destVC = viewController as? AddVC {
            destVC.loadIngredients()
            destVC.ingredientNamesAssigned()
            destVC.tableView.reloadData()
        }
    }

}