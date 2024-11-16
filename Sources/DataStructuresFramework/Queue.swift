//
//  File.swift
//  DataStructuresFramework
//
//  Created by Анастасія Грисюк on 16.11.2024.
//

import Foundation

public struct Queue<T> {

    public var array: [T] = []
    public init() {}

    public var isEmpty: Bool {
        return array.isEmpty
    }

    public var peek: T? {
        return array.first
    }

    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }

    public mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }

}

extension Queue: CustomStringConvertible {
    public var description: String {
        return String(describing: array)
    }
}
