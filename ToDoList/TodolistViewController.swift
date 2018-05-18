//
//  ViewController.swift
//  ToDoList
//
//  Created by Austin Chan on 10/5/2018.
//  Copyright © 2018 Austin Chan. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Yahoo", "Google", "Youtube"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //declare the number of row in the tableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //declare the reusable cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "ToDoItemCell")
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //Table view delegate method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
