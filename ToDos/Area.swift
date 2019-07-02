//
//  Area
//  Area
//
//  Created by Andrew Yakovenko on 6/12/19.
//  Copyright © 2019 Andrii Yakovenko. All rights reserved.
//

import Foundation


class Area: NSObject {
    typealias Name = String
    
    private var areaName: Name
    private var tags: Tags!
    private var firstList = [ToDo]()
    private var customList = [CustomList]()
    
    
    init(name: Name) {
        areaName =  name
        tags = Tags()
    }
    
    // MARK: - First List
    
    public func add(toDo: ToDo) {
        firstList.append(toDo)
    }

    
    // MARK: - Area
    
    public func getAreaName() -> Name {
        return areaName
    }
    
    public func editArea(name: Name) {
        areaName = name
    }
    
    // MARK: - To do list
    
    
    
    // MARK: - CustomList
    
    
    
}
