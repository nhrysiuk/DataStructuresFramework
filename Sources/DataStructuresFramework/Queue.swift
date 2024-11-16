import Foundation

/// A generic queue data structure that operates on a first-in, first-out (FIFO) principle.
public struct Queue<T> {

    /// The underlying array storing the queue's elements.
    public var array: [T] = []

    /// Creates an empty queue.
    public init() {}

    /// A Boolean value indicating whether the queue is empty.
    public var isEmpty: Bool {
        return array.isEmpty
    }

    /// The first element of the queue without removing it.
    /// - Returns: The first element of the queue if it exists; otherwise, `nil`.
    public var peek: T? {
        return array.first
    }

    /// Adds a new element to the end of the queue.
    /// - Parameter element: The element to enqueue.
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }

    /// Removes and returns the first element of the queue.
    /// - Returns: The first element of the queue if it exists; otherwise, `nil`.
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}

/// Adds a custom description for the queue, displaying its contents as a string.
extension Queue: CustomStringConvertible {
    /// A textual representation of the queue.
    public var description: String {
        return String(describing: array)
    }
}
