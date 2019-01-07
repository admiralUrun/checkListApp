//
//  TODOlist.swift
//  CheckkList
//
//  Created by Andrew Yakovenko on 12/10/18.
//  Copyright © 2018 Andrew Yakovenko. All rights reserved.
//

import Foundation




class todoList  {
    
    var  todos : [ChecklistItem] = []
    
    init() {
        
       let row0Item = ChecklistItem()
       let row1Item = ChecklistItem()
       let row2Item = ChecklistItem()
       let row3Item = ChecklistItem()
       let row4Item = ChecklistItem()
        
        
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
    
    
    func newTodo() -> ChecklistItem {
        let item =  ChecklistItem()
        item.text = randomTitle()
        item.checked = true
        todos.append(item)
        return item
    }
    
    func moveCellInList(item: ChecklistItem, to index: Int) {
        guard let currentIndex = todos.index(of: item) else {
            return
        }
        todos.remove(at: currentIndex)
        todos.insert(item, at: index)
    }
    
    func revomeCellInList(removeItems: [ChecklistItem] ) {
        for item in removeItems {
            if let index = todos.index(of :item) {
                todos.remove(at: index)
            }
        }
    }
    
    private func randomTitle() -> String {
        var titles = ["Title", "Car", "Wolf", "cebyek", "kek", "LOL"]
        let randomNumbe = Int.random(in: 0 ..< titles.count - 1)
        return titles[randomNumbe]
    }
    
    
    
}







