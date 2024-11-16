import Foundation

/// A generic stack data structure that operates on a last-in, first-out (LIFO) principle.
public struct Stack<Element> {

    /// The underlying array used to store elements in the stack.
    private var storage: [Element] = []

    /// Creates an empty stack.
    public init() {}

    /// Adds an element to the top of the stack.
    /// - Parameter element: The element to add to the stack.
    public mutating func push(_ element: Element) {
        storage.append(element)
    }

    /// Removes and returns the element at the top of the stack.
    /// - Returns: The element at the top of the stack, or `nil` if the stack is empty.
    public mutating func pop() -> Element? {
        storage.popLast()
    }

    /// Returns a boolean indicating whether the stack is empty.
    /// - Returns: `true` if the stack is empty, otherwise `false`.
    public var isEmpty: Bool {
        return storage.isEmpty
    }
}

extension Stack: CustomStringConvertible {

    /// A textual representation of the stack, with the top element shown first.
    public var description: String {
        let stackElements = storage.map { "\($0)" }.reversed().joined(separator: "\n")
        return stackElements
    }
}
