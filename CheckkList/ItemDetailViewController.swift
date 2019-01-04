//
//  AddItemTableViewControl.swift
//  CheckkList
//
//  Created by Andrew Yakovenko on 12/11/18.
//  Copyright © 2018 Andrew Yakovenko. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate : class {
    func itemDitailViewControllerDidCencel(_ controler: ItemDetailViewController)
    func itemDitailViewControllerr(_ controller: ItemDetailViewController, didFinishiAdding item:Checklist)
    func itemDitailViewControllerr(_ controller: ItemDetailViewController, didFinishiEditing item:Checklist )
}

class ItemDetailViewController: UITableViewController {
    
    
    weak var deleget: ItemDetailViewControllerDelegate?
    weak var todolist: toDOLIst?
    weak var itemToEdit: Checklist?
    
    
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    @IBOutlet weak var cancel: UIBarButtonItem!
    @IBOutlet weak var textfield: UITextField!
    
    
    @IBAction func cancel(_ sender: Any) {
        deleget?.itemDitailViewControllerDidCencel(self)
    }
    
    @IBAction func done(_ sender: Any) {
        if let item = itemToEdit, let text = textfield.text {
            item.text = text
            deleget?.itemDitailViewControllerr(self, didFinishiEditing: item)
        } else {
            if let item = todolist?.newTodo() {
                if let textFieldText = textfield.text {
                    item.text = textFieldText
                }
                item.checked = false
                deleget?.itemDitailViewControllerr(self, didFinishiAdding: item)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = itemToEdit {
            title = "Edit item"
            textfield.text = item.text
            addBarButton.isEnabled = true
        }
        navigationItem.largeTitleDisplayMode = .never
        
    }
    
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}

extension ItemDetailViewController: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textfield.resignFirstResponder()
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let oldText = textfield.text,
            let stringRange = Range(range, in: oldText) else {
                return false
        }
        
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        if newText.isEmpty {
            
            addBarButton.isEnabled = false
        } else {
            addBarButton.isEnabled = true
        }
        return true
    }
    
    
    
    
    
    
    
    
}
















