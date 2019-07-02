//
//  ToDos.swift
//  ToDos
//
//  Created by Andrew Yakovenko on 6/14/19.
//  Copyright © 2019 Andrii Yakovenko. All rights reserved.
//

import Foundation

class ToDo: NSObject {
    @objc var title = ""
    @objc var text = ""
    var checked = false
    var when: Calendar?
    var deadLine: Calendar?
    var priority = Priority.non
    
    public func toggleChecked() {
        checked = !checked
    }
}
