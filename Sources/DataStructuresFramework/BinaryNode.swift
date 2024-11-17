import Foundation

/// A class representing a binary tree node.
public class BinaryNode<Element> {

    /// The value stored in the node.
    public var value: Element

    /// The left child of the node.
    public var leftChild: BinaryNode?

    /// The right child of the node.
    public var rightChild: BinaryNode?

    /// Initializes a binary node with a value.
    /// - Parameter value: The value to store in the node.
    public init(_ value: Element) {
        self.value = value
    }
}

extension BinaryNode {

    /// Traverses the binary tree in post-order (left, right, root) and applies a closure to each node's value.
    /// - Parameter visit: A closure to apply to each node's value.
    public func traversePostOrder(_ visit: (Element) -> Void) {
        leftChild?.traverseInOrder(_: visit)
        rightChild?.traverseInOrder(_: visit)
        visit(value)
    }

    /// Traverses the binary tree in in-order (left, root, right) and applies a closure to each node's value.
    /// - Parameter visit: A closure to apply to each node's value.
    public func traverseInOrder(_ visit: (Element) -> Void) {
        leftChild?.traverseInOrder(_: visit)
        visit(value)
        rightChild?.traverseInOrder(_: visit)
    }

    /// Traverses the binary tree in pre-order (root, left, right) and applies a closure to each node's value.
    /// - Parameter visit: A closure to apply to each node's value.
    public func traversePreOrder(_ visit: (Element) -> Void) {
        visit(value)
        leftChild?.traverseInOrder(_: visit)
        rightChild?.traverseInOrder(_: visit)
    }

    /// Description of BinaryNode.
    ///
    /// - Returns: A closure `(TraversalOrder) -> String` that takes a `TraversalOrder` parameter
    ///   and returns a string representation of the tree nodes in the specified traversal order.
    public var description: (TraversalOrder) -> String {
        { order in
            var result = ""
            let appendToResult: (Element) -> Void = { value in
                result += "\(value) "
            }

            switch order {
            case .preOrder:
                self.traversePreOrder(appendToResult)
            case .postOrder:
                self.traversePostOrder(appendToResult)
            case .inOrder:
                self.traverseInOrder(appendToResult)
            }

            return result.trimmingCharacters(in: .whitespaces)
        }
    }

    public enum TraversalOrder {
        case preOrder
        case inOrder
        case postOrder
    }
}
