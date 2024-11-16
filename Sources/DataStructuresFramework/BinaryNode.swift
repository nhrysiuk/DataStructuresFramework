//
//  File.swift
//  DataStructuresFramework
//
//  Created by Анастасія Грисюк on 16.11.2024.
//

import Foundation

class BinaryNode<Element> {
    
    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(_ value: Element) {
        self.value = value
    }
    
}

extension BinaryNode {
    
    func traversePostOrder(_ visit: (Element) -> Void) {
        
        leftChild?.traverseInOrder(_: visit)
        rightChild?.traverseInOrder(_: visit)
        visit(value)
    }
        
    func traverseInOrder(_ visit: (Element) -> Void) {
      
        leftChild?.traverseInOrder(_: visit)
        visit(value)
        rightChild?.traverseInOrder(_: visit)
        
    }
    
    func traversePreOrder(_ visit: (Element) -> Void) {
        
        visit(value)
        leftChild?.traverseInOrder(_: visit)
        rightChild?.traverseInOrder(_: visit)
        
    }
    
}
