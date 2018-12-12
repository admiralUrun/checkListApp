//
//  TODOlist.swift
//  CheckkList
//
//  Created by Andrew Yakovenko on 12/10/18.
//  Copyright © 2018 Andrew Yakovenko. All rights reserved.
//

import Foundation




class toDOLIst  {
    
    var  todos : [Checklist] = []
    
    init() {
        
       let row0Item = Checklist()
       let row1Item = Checklist()
       let row2Item = Checklist()
       let row3Item = Checklist()
       let row4Item = Checklist()
        
        
        row0Item.text = "Take a jog"
        row1Item.text = "Write Check list"
        row2Item.text = "Coder"
        row3Item.text = "+Ultra"
        row4Item.text = "lol"
        
        todos.append(row0Item)
        todos.append(row1Item)
        todos.append(row2Item)
        todos.append(row3Item)
        todos.append(row4Item)
        
    }
    
    
    func newTodo() -> Checklist {
        let item =  Checklist()
        item.text = "New todo item"
        item.checked = true
        todos.append(item)
        return item
    }
    
    
    private func randomTitle() -> String {
        var titles = ["Title", "Car", "Wolf", "cebyek", "kek", "LOL"]
        
        let randomNumbe = Int.random(in: 0 ..< titles.count)
        
        return titles[randomNumbe]
    }
    
    
    
}







