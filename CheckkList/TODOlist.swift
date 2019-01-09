//
//  TODOlist.swift
//  CheckkList
//
//  Created by Andrew Yakovenko on 12/10/18.
//  Copyright © 2018 Andrew Yakovenko. All rights reserved.
//

import Foundation

class todoList  {
    
    
    enum Priority: Int, CaseIterable {
        case high, medium, low, no
    }
    
    private var highPriorityTodos : [ChecklistItem] = []
    private var mediumPriorityTodos : [ChecklistItem] = []
    private var lowPriorityTodos : [ChecklistItem] = []
    private var noPriorityTodos : [ChecklistItem] = []
    
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
        
       addtodo(row0Item, for: .medium)
        addtodo(row1Item, for: .medium)
        addtodo(row2Item, for: .medium)
        addtodo(row3Item, for: .medium)
        addtodo(row4Item, for: .medium)
        
    }
    func addtodo(_ item:ChecklistItem, for piortity: Priority,at index: Int = -1) {
        switch piortity {
        case .high:
            if index < 0 {
             highPriorityTodos.append(item)
            } else {
                highPriorityTodos.insert(item, at: index)
            }
        case .medium:
            if index < 0 {
                mediumPriorityTodos.append(item)
            } else {
                mediumPriorityTodos.insert(item, at: index)
            }
        case .low:
            if index < 0 {
                lowPriorityTodos.append(item)
            } else {
                lowPriorityTodos.insert(item, at: index)
            }
        case .no:
            if index < 0 {
                noPriorityTodos.append(item)
            } else {
                noPriorityTodos.insert(item, at: index)
            }
        }
    }
    
    func todoList(for piority: Priority) -> [ChecklistItem] {
        switch piority {
        case .high:
            return highPriorityTodos
        case .medium:
            return mediumPriorityTodos
        case .low:
            return lowPriorityTodos
        case .no:
            return noPriorityTodos
        }
    }
    
    func newTodo() -> ChecklistItem {
        let item =  ChecklistItem()
        item.text = randomTitle()
        item.checked = true
        mediumPriorityTodos.append(item)
        return item
    }
    
    func moveCellInList(item: ChecklistItem,from sourcePriority:Priority, at sourceIndex:Int, to destinationPriority: Priority, at destinationIndex: Int) {
        revomeCellInList(remove: item, from: sourcePriority, at: sourceIndex)
        addtodo(item, for: destinationPriority, at: destinationIndex)
        
    }
    
    func revomeCellInList(remove item:ChecklistItem, from priority: Priority, at index: Int ) {
        switch priority {
        case .high:
            highPriorityTodos.remove(at: index)
        case .medium:
            mediumPriorityTodos.remove(at: index)
        case .low:
            lowPriorityTodos.remove(at: index)
        case .no:
            noPriorityTodos.remove(at: index)
        }
    }
    
    private func randomTitle() -> String {
        var titles = ["Title", "Car", "Wolf", "cebyek", "kek", "LOL"]
        let randomNumbe = Int.random(in: 0 ..< titles.count - 1)
        return titles[randomNumbe]
    }
    
    
    
}







