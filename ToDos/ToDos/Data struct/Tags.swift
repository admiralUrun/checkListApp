//
//  Tags.swift
//  ToDos
//
//  Created by Andrew Yakovenko on 7/1/19.
//  Copyright © 2019 Andrii Yakovenko. All rights reserved.
//

import Foundation

struct Tag {
    typealias Name = String
    let tagName: Name
}

class Tags: NSObject {
    typealias Index = Int
    
    var tags = [Tag]()
    
    public func addTagWith(name: String) {
        tags.append(Tag.init(tagName: name))
    }
    
    public func removeTagWith(name n: Tag.Name) {
        tags.remove(at: getIndexOf(name: n))
    }
    
    private func getIndexOf(name: Tag.Name) -> Index {
        for i in 0 ..< tags.count {
            if tags[i].tagName == name {
                return i
            }
        }
        preconditionFailure("There's not is tag")
    }
    
}

