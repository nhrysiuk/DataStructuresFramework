import Testing
@testable import DataStructuresFramework

struct BinaryNodeTest {

    @Test func create() async throws {
        let node = BinaryNode(0)
        let node2 = BinaryNode(1)
        let node3 = BinaryNode(2)
        node.leftChild = node2
        node.rightChild = node3
        #expect(node.leftChild?.value == 1)
        #expect(node.rightChild?.value == 2)

        #expect(node.description(.inOrder) == "1 0 2")
        #expect(node.description(.postOrder) == "1 2 0")
        #expect(node.description(.preOrder) == "0 1 2")
    }
}
