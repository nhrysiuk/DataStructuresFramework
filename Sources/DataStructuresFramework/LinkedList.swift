import Foundation

/// A linked list implementation supporting basic operations like push, append, and removal.
public struct LinkedList<Value> {

    /// The head node of the linked list.
    public var head: Node<Value>?

    /// The tail node of the linked list.
    public var tail: Node<Value>?

    /// A Boolean value indicating whether the linked list is empty.
    public var isEmpty: Bool {
        return head == nil
    }

    /// Adds a value to the front of the linked list.
    /// - Parameter value: The value to add.
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }

    /// Adds a value to the end of the linked list.
    /// - Parameter value: The value to add.
    public mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }

        let node = Node(value: value)
        tail!.next = node
        tail = node
    }

    /// Returns the node at the specified index, if it exists.
    /// - Parameter index: The zero-based index of the node to retrieve.
    /// - Returns: The node at the given index, or `nil` if the index is out of bounds.
    public func node(at index: Int) -> Node<Value>? {
        var currentIndex = 0
        var currentNode = head

        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }

        return currentNode
    }

    /// Inserts a value after a specific node.
    /// - Parameters:
    ///   - value: The value to insert.
    ///   - node: The node after which the value will be inserted.
    public func insert(_ value: Value, after node: Node<Value>) {
        node.next = Node(value: value, next: node.next)
    }

    /// Removes and returns the value at the front of the linked list.
    /// - Returns: The value of the removed node, or `nil` if the list is empty.
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }

    /// Removes and returns the value at the end of the linked list.
    /// - Returns: The value of the removed node, or `nil` if the list is empty.
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

    /// Removes and returns the value of the node after a specific node.
    /// - Parameter node: The node preceding the one to remove.
    /// - Returns: The value of the removed node, or `nil` if there is no node after the specified node.
    public mutating func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }

    /// Creates an empty linked list.
    public init() { }
}

extension LinkedList: CustomStringConvertible {

    /// A textual representation of the linked list.
    public var description: String {
        guard let head = head else {
            return "[]"
        }
        return String(describing: head)
    }
}

/// A node in the linked list.
public class Node<Value> {

    /// The value stored in the node.
    public var value: Value

    /// The next node in the linked list, or `nil` if this is the last node.
    public var next: Node?

    /// Creates a new node with the specified value and optional next node.
    /// - Parameters:
    ///   - value: The value to store in the node.
    ///   - next: The next node in the list. Defaults to `nil`.
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {

    /// A textual representation of the node and its successors.
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next)
    }
}
