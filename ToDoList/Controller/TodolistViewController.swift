//
//  ViewController.swift
//  ToDoList
//
//  Created by Austin Chan on 10/5/2018.
//  Copyright © 2018 Austin Chan. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

   
    let defaults = UserDefaults.standard
    
   var itemArray = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Yahoo"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Google"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Bing"
        itemArray.append(newItem3)
        
        if let item = defaults.array(forKey: "ToDoListArray") as? [Item]{
            itemArray = item
        }
    }
    
    //declare the number of row in the tableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //declare the reusable cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = UITableViewCell(style: .default, reuseIdentifier: "ToDoItemCell")
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        
        // Tenary operator
        // value = condition ? valueifTrue : valueifFalse
        
        cell.accessoryType = item.done == true ? .checkmark : .none
        
        
        
        //if item.done == true{
        //    cell.accessoryType = .checkmark
        // }else{
        //    cell.accessoryType = .none
        // }
        
        
        
        
        
        
        
        return cell
    }
    
    //Table view delegate method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    // Mark - add button
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new todoey item", message: "", preferredStyle: .alert
        )
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            
            
            self.itemArray.append(newItem)
            
            self.defaults.setValue(self.itemArray, forKey: "ToDoListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        alert.addTextField { (alertText) in
            alertText.placeholder = "Create new item"
            print(alertText.text)
            textField = alertText
        }
        present(alert, animated: true, completion: nil)
        
        
        
    }
    
    
}
