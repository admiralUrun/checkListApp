//
//  ViewController.swift
//  CheckkList
//
//  Created by Andrew Yakovenko on 12/10/18.
//  Copyright © 2018 Andrew Yakovenko. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var todolist : toDOLIst
    
    
    
    @IBOutlet weak var textflied: UITextField!
    
    
    
    @IBAction func addItem(_ sender: Any) {
        
        let newRowIndex = todolist.todos.count
        
        _ = todolist.newTodo()
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        todolist = toDOLIst()
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todolist.todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListItem", for: indexPath)
        let item = todolist.todos[indexPath.row]
        configorText(for: cell, with: item)
        configureCheckMark(for: cell, with: item)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
        todolist.todos.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            let item = todolist.todos[indexPath.row]
            configureCheckMark(for: cell, with: item)
        }
    }
    
    func configorText(for cell: UITableViewCell, with item: Checklist) {
        if let lable = cell.viewWithTag(1000) as? UILabel {
            lable.text = item.text
        }
    }
    
    func configureCheckMark (for cell:UITableViewCell, with item: Checklist) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType =  .none
        }
        item.toggleChecked()
    }
}


