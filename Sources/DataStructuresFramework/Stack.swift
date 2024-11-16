//
//  File.swift
//  DataStructuresFramework
//
//  Created by Анастасія Грисюк on 16.11.2024.
//

import Foundation

public struct Stack<Element> {

    private var storage: [Element] = []

    public init() {}

    public mutating func push(_ element: Element) {
        storage.append(element)
    }

    public mutating func pop() -> Element? {
        storage.popLast()
    }

}

extension Stack: CustomStringConvertible {

    public var description: String {

        let topDivider = "-top\n"
        let bottomDivider = "\n---"

        let stackElements = storage.map {"\($0)"}.reversed().joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}
