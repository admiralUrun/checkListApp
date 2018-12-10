//
//  ChecklistItem.swift
//  CheckkList
//
//  Created by Andrew Yakovenko on 12/10/18.
//  Copyright © 2018 Andrew Yakovenko. All rights reserved.
//

import Foundation



class Checklist {
    var text = ""
    var checked = false
    
    
    func toggleChecked() {
        checked = !checked
    }
}
