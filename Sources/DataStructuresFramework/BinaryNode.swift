import Foundation

/// A class representing a binary tree node.
class BinaryNode<Element> {

    /// The value stored in the node.
    var value: Element

    /// The left child of the node.
    var leftChild: BinaryNode?

    /// The right child of the node.
    var rightChild: BinaryNode?

    /// Initializes a binary node with a value.
    /// - Parameter value: The value to store in the node.
    init(_ value: Element) {
        self.value = value
    }
}

extension BinaryNode {

    /// Traverses the binary tree in post-order (left, right, root) and applies a closure to each node's value.
    /// - Parameter visit: A closure to apply to each node's value.
    func traversePostOrder(_ visit: (Element) -> Void) {
        leftChild?.traverseInOrder(_: visit)
        rightChild?.traverseInOrder(_: visit)
        visit(value)
    }

    /// Traverses the binary tree in in-order (left, root, right) and applies a closure to each node's value.
    /// - Parameter visit: A closure to apply to each node's value.
    func traverseInOrder(_ visit: (Element) -> Void) {
        leftChild?.traverseInOrder(_: visit)
        visit(value)
        rightChild?.traverseInOrder(_: visit)
    }

    /// Traverses the binary tree in pre-order (root, left, right) and applies a closure to each node's value.
    /// - Parameter visit: A closure to apply to each node's value.
    func traversePreOrder(_ visit: (Element) -> Void) {
        visit(value)
        leftChild?.traverseInOrder(_: visit)
        rightChild?.traverseInOrder(_: visit)
    }
}
