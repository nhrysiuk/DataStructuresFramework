//
//  File.swift
//  DataStructuresFramework
//
//  Created by Анастасія Грисюк on 16.11.2024.
//

import Foundation

public struct LinkedList<Value> {

    public var head: Node<Value>?
    public var tail: Node<Value>?

    public var isEmpty: Bool {
        return head == nil
    }

    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }

    }

    public mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }

        let node = Node(value: value)
        tail!.next = node
        tail = node

    }

    public func node(at index: Int) -> Node<Value>? {

        var currentIndex = 0
        var currentNode = head

        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }

        return currentNode
    }

    public func insert(_ value: Value, after node: Node<Value>) {
        node.next = Node(value: value, next: node.next)
    }

    public mutating func pop() -> Value? {

        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }

        return head?.value
    }

    public mutating func removeLast() -> Value? {

        guard let head = head else {
            return nil
        }

        guard head.next != nil else {
            return pop()
        }

        var prev = head
        var current = head
        while let next = current.next {
            prev = current
            current = next
        }

        prev.next = nil
        tail = prev
        return current.value

    }

    public mutating func remove(after node: Node<Value>) -> Value? {

        defer {
            if node.next === tail {
                tail = node
            }

            node.next = node.next?.next
        }

        return node.next?.value

    }

    init() { }

}

extension LinkedList: CustomStringConvertible {

    public var description: String {

        guard let head = head else {
            return "Empty list"
        }

        return String(describing: head)
    }
}

public class Node<Value> {

    public var value: Value
    public var next: Node?

    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {

    public var description: String {

        guard let next = next else {
            return "\(value)"
        }

        return "\(value) -> " + String(describing: next) + " "

    }
}
