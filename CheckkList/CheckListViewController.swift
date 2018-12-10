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
    
    
    required init?(coder aDecoder: NSCoder) {
        
        todolist = toDOLIst()
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
            cell.accessoryType = .none
        } else {
            cell.accessoryType =  .checkmark
        }
        item.toggleChecked()
    }
}


