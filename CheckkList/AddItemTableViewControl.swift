//
//  AddItemTableViewControl.swift
//  CheckkList
//
//  Created by Andrew Yakovenko on 12/11/18.
//  Copyright © 2018 Andrew Yakovenko. All rights reserved.
//

import UIKit

class AddItemTableViewControl: UITableViewController {

    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done(_ sender: Any) {
       navigationController?.popViewController(animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
    }
    
    
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

