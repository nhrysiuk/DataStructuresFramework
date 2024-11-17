import Testing
@testable import DataStructuresFramework

struct LinkedListTest {

    @Test func push() async throws {
        var list = LinkedList<Int>()
        
        list.push(1)
        list.push(2)
        list.push(3)

        #expect(list.head?.value == 3)
        #expect(list.tail?.value == 1)
    }

    @Test func append() async throws {
        var list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        list.append(3)

        #expect(list.head?.value == 1)
        #expect(list.tail?.value == 3)
    }

    @Test func pop() async throws {
        var list = LinkedList<Int>()
        list.push(1)
        list.push(2)
        list.push(3)

        #expect(list.pop() == 3)
        #expect(list.head?.value == 2)
    }

    @Test func removeLast() async throws {
        var list = LinkedList<Int>()
        #expect(list.removeLast() == nil)

        list.push(1)
        #expect(list.removeLast() == 1)
        list.push(1)
        list.push(2)
        list.push(3)

        #expect(list.removeLast() == 1)
        #expect(list.tail?.value == 2)
    }

    @Test func insert() async throws {
        var list = LinkedList<Int>()
        list.push(1)
        list.push(2)
        list.push(3)

        guard let secondNode = list.head?.next else {
            #expect(Bool(false), "The list should have a second node.")
            return
        }

        list.insert(4, after: secondNode)

        #expect(secondNode.next?.value == 4)
    }

    @Test func getNode() async throws {
        var list = LinkedList<Int>()
        list.push(1)
        list.push(2)
        list.push(3)

        guard let node = list.node(at: 1) else {
            #expect(Bool(false), "Expected node at index 1 to exist.")
            return
        }

        #expect(node.value == 2)
    }

    @Test func removeAfter() async throws {
        var list = LinkedList<Int>()
        list.push(1)
        list.push(2)
        list.push(3)

        guard let firstNode = list.head else {
            #expect(Bool(false), "Expected first node to exist.")
            return
        }

        #expect(list.remove(after: firstNode) == 2)
        #expect(list.head?.next?.value == 1)
    }

    @Test func getDescription() async throws {
        var list = LinkedList<Int>()
        #expect(list.description == "[]")

        list.push(1)
        list.push(2)
        list.push(3)

        let description = list.description
        #expect(description.contains("3"))
        #expect(description.contains("2"))
        #expect(description.contains("1"))
    }
}
