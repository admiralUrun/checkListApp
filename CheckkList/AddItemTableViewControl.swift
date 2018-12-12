//
//  AddItemTableViewControl.swift
//  CheckkList
//
//  Created by Andrew Yakovenko on 12/11/18.
//  Copyright © 2018 Andrew Yakovenko. All rights reserved.
//

import UIKit

protocol AddItemViewControlerDelefate : class {
    func addItemviewControleDidCencel(_ controler: AddItemTableViewControl)
    func addIremViewControler(_ controller: AddItemTableViewControl, didFinishiAdding item:Checklist)
    
}

class AddItemTableViewControl: UITableViewController {
    
    
    weak var deleget: AddItemViewControlerDelefate?
    
    
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    @IBOutlet weak var cancel: UIBarButtonItem!
    @IBOutlet weak var textfield: UITextField!
    
    
    
    
    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        deleget?.addItemviewControleDidCencel(self)
    }
    
    @IBAction func done(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        let item = Checklist()
        if let textFieldText = textfield.text {
            item.text = textFieldText
        }
        item.checked = false
        deleget?.addIremViewControler(self, didFinishiAdding: item)
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
    }
    
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}

extension AddItemTableViewControl: UITextFieldDelegate {
    
    
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
















