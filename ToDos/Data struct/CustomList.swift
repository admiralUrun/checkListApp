//
//  CustomList.swift
//  ToDos
//
//  Created by Andrew Yakovenko on 6/30/19.
//  Copyright © 2019 Andrii Yakovenko. All rights reserved.
//

import Foundation


class CustomList: NSObject {
    
    @objc var title = ""
    @objc var context = ""
    var checked = false
    var when: Calendar?
    var deadLine: Calendar?
    var list = [ToDo]()
    
    public func toggleChecked() {
        checked = !checked
    }
}






