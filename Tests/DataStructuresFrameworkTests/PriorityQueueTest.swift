import Testing
@testable import DataStructuresFramework

struct PriorityQueueTest {

    @Test func enqueueAndPeek() async throws {
        var queue = PriorityQueue<String>()
        #expect(queue.isEmpty)
        queue.enqueue("A", withPriority: 5)
        queue.enqueue("B", withPriority: 2)
        queue.enqueue("C", withPriority: 8)

        #expect(queue.peek() == "B")
    }

    @Test func dequeue() async throws {
        var queue = PriorityQueue<String>()

        queue.enqueue("A", withPriority: 5)
        queue.enqueue("B", withPriority: 2)
        queue.enqueue("C", withPriority: 8)

        #expect(queue.dequeue() == "B")
        #expect(queue.dequeue() == "A")
        #expect(queue.dequeue() == "C")
        #expect(queue.dequeue() == nil)
    }
}
