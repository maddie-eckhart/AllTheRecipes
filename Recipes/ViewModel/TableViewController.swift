//
//  TableViewController.swift
//  Recipes
//
//  Created by Eckhart, Madeline on 1/8/19.
//  Copyright © 2019 Eckhart, Madeline. All rights reserved.
//

import UIKit
class TableViewController: UITableViewController {
    
    var decoder: JSONDecoder?
    var list_recipes: Recipe?
    
    // --------------------------------------- APP LIFECYCLE --------------------------------------- //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "recipes", ofType: "json")
        let jsonData = try? NSData(contentsOfFile: path!, options: NSData.ReadingOptions.mappedIfSafe)
        decoder = JSONDecoder()
        list_recipes = try! decoder?.decode(Recipe.self, from: jsonData! as Data)
        
    }

    
    // --------------------------------------- TABLE VIEW SET UP --------------------------------------- //

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "list_item", for: indexPath) as! TableViewCell
        
        cell.lblHeadline.text = list_recipes![indexPath.row].data.headline
        
        let prepTime = list_recipes![indexPath.row].data.prepTimeInMinutes!
        let cookTime = list_recipes![indexPath.row].data.cookTimeInMinutes!
        cell.lblTimeCook.text = "\(String(describing: prepTime + cookTime))"
        
        let dishEnum = list_recipes![indexPath.row].data.categories.mainIngredient
        var main = dishEnum?[0].rawValue
        guard dishEnum != nil else {
            let catEnum = list_recipes![indexPath.row].data.categories.ingredientCategory
            main = catEnum?[0]
            cell.lblDishType.text = main
            return cell
        }
        
        cell.lblDishType.text = main

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92.0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
