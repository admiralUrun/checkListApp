//
//  ViewController.swift
//  CheckkList
//
//  Created by Andrew Yakovenko on 12/10/18.
//  Copyright © 2018 Andrew Yakovenko. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var toDolist : todoList
    
    private func priorityForSectionIndex(index:Int) -> todoList.Priority? {
        return todoList.Priority(rawValue: index)
    }
    
    @IBOutlet var deleteBarItem: UIBarButtonItem!
    @IBOutlet var addButtonItem: UIBarButtonItem!
    
    @IBAction func addItem(_ sender: Any) {
        
        let newRowIndex = toDolist.todoList(for: .medium).count
        
        _ = toDolist.newTodo()
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
    }
    
    @IBAction func deleteItems(_ sender: Any) {
        if let secletedRows = tableView.indexPathsForSelectedRows {
            for indexPath in secletedRows {
                if let priority = priorityForSectionIndex(index: indexPath.section) {
                    let todos = toDolist.todoList(for: priority)
                    let rowToDelete = indexPath.row > todos.count - 1 ? todos.count - 1 : indexPath.row
                    let item = todos[rowToDelete]
                    
                    toDolist.revomeCellInList(remove: item, from: priority, at: rowToDelete)
                }
            }
            tableView.beginUpdates()
            tableView.deleteRows(at: secletedRows, with: .automatic)
            tableView.endUpdates()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        toDolist = todoList()
        
        super.init(coder: aDecoder)
    }
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = nil
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        tableView.allowsMultipleSelectionDuringEditing = true
        
    }
    // MARK: -
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        if tableView.isEditing {
            self.navigationItem.rightBarButtonItem = self.deleteBarItem
        } else {
            self.navigationItem.rightBarButtonItem = self.addButtonItem
        }
        
    }
    // MARK: - tableView's
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let priority = priorityForSectionIndex(index: section) {
            return toDolist.todoList(for: priority).count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListItem", for: indexPath)
        if let priority = priorityForSectionIndex(index: indexPath.section) {
            let items = toDolist.todoList(for: priority)
            let item = items[indexPath.row]
            configureText(for: cell, with: item)
            configureCheckMark(for: cell, with: item)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.isEditing {
            return
        }
        if let cell = tableView.cellForRow(at: indexPath){
            if let priority = priorityForSectionIndex(index: indexPath.section) {
                let items = toDolist.todoList(for: priority)
                let item = items[indexPath.row]
                item.toggleChecked()
                configureCheckMark(for: cell, with: item)
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if let priority = priorityForSectionIndex(index: indexPath.section) {
            let item = toDolist.todoList(for: priority)[indexPath.row]
            
            toDolist.revomeCellInList(remove: item, from: priority, at: indexPath.row)
            
            let indexPaths = [indexPath]
            tableView.deleteRows(at: indexPaths, with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        if let srcPriority = priorityForSectionIndex(index: sourceIndexPath.section),
            let destPrority = priorityForSectionIndex(index: destinationIndexPath.section) {
            let item = toDolist.todoList(for: srcPriority)[sourceIndexPath.row]
            
            toDolist.moveCellInList(item: item, from: srcPriority , at: sourceIndexPath.row, to: destPrority, at: destinationIndexPath.row)
        }
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return UILocalizedIndexedCollation.current().section(forSectionIndexTitle: index)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title: String? = nil
        if let priority = priorityForSectionIndex(index: section) {
            switch priority {
            case .high:
                title = "High Priority"
            case .medium:
                title = "Medium Priority"
            case .low:
                title = "Low Priority"
            case .no:
                title = "Someday"
            }
        }
        return title
    }
    
    // MARK: -
    func configureText(for cell: UITableViewCell, with item: ChecklistItem) {
        if let checkmarkCell = cell as? CheckListTableViewCell {
            checkmarkCell.todoTextLable.text = item.text
        }
    }
    
    func configureCheckMark (for cell:UITableViewCell, with item: ChecklistItem) {
        guard let checkmarkCell = cell as? CheckListTableViewCell else  {
            return
        }
        if item.checked {
            checkmarkCell.checkmarkLabel.text = "√"
        } else {
            checkmarkCell.checkmarkLabel.text =  ""
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItemSegue" {
            if let itemDitailViewControllerr = segue.destination as? ItemDetailViewController {
                itemDitailViewControllerr.deleget = self
                itemDitailViewControllerr.todolist = toDolist
            }
        } else if segue.identifier == "EditItem" {
            if let itemDitailViewControllerr = segue.destination as? ItemDetailViewController {
                if let cell = sender as? UITableViewCell,
                    let indexPath = tableView.indexPath(for: cell),
                    let priority = priorityForSectionIndex(index: indexPath.section)
                {
                    
                    let item = toDolist.todoList(for: priority)[indexPath.row]
                    itemDitailViewControllerr.itemToEdit = item
                    itemDitailViewControllerr.deleget = self
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return todoList.Priority.allCases.count
    }
    
}

// MARK: -extension
extension ChecklistViewController: ItemDetailViewControllerDelegate {
    
    func itemDitailViewControllerDidCencel(_ controler: ItemDetailViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func itemDitailViewControllerr(_ controller: ItemDetailViewController, didFinishiAdding item: ChecklistItem) {
        navigationController?.popViewController(animated: true)
        let rowIndex = toDolist.todoList(for: .medium).count - 1
        let indexPahth = IndexPath(row: rowIndex, section: todoList.Priority.medium.rawValue)
        let indexPahths = [indexPahth]
        tableView.insertRows(at: indexPahths, with: .automatic)
    }
    
    func itemDitailViewControllerr(_ controller: ItemDetailViewController, didFinishiEditing item: ChecklistItem) {
        
        for priorty in todoList.Priority.allCases {
            let current = toDolist.todoList(for: priorty)
            if let index = current.index(of: item) {
                let indexPath = IndexPath(row: index, section: priorty.rawValue)
                if let cell = tableView.cellForRow(at: indexPath) {
                    configureText(for: cell, with: item)
                }
            }
        }
        
        navigationController?.popViewController(animated: true)
    }
    
}
