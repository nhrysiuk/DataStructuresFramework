//
//  File.swift
//  DataStructuresFramework
//
//  Created by Анастасія Грисюк on 16.11.2024.
//

import Foundation

struct PriorityQueue<Element: Comparable> {
    private var elements: [(element: Element, priority: Int)] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    mutating func enqueue(_ element: Element, withPriority priority: Int) {
        elements.append((element, priority))
    }
    
    mutating func dequeue() -> Element? {
        guard !isEmpty else { return nil }
        
        if let index = elements.enumerated().min(by: { $0.element.priority < $1.element.priority })?.offset {
            let dequeuedElement = elements.remove(at: index)
            return dequeuedElement.element
        }
        
        return nil
    }
    
    func peek() -> Element? {
        return elements.min(by: { $0.priority < $1.priority })?.element
    }
}
