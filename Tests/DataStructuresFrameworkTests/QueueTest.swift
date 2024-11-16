import Testing
@testable import DataStructuresFramework

struct QueueTest {

    @Test func isEmpty() async throws {
        var queue = Queue<Int>()
        #expect(queue.isEmpty)
        queue.enqueue(1)
        #expect(!queue.isEmpty)
    }

    @Test func enqueue() async throws {
        var queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        #expect(queue.description == "[1, 2, 3]")
    }

    @Test func dequeue() async throws {
        var queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        #expect(queue.dequeue() == 1)
        #expect(queue.dequeue() == 2)
        #expect(queue.dequeue() == 3)
        #expect(queue.isEmpty)
    }
}
